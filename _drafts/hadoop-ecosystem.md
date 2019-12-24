---
layout: post
title: Hadoop Ecosystem
author: Jorge Figueiredo
categories: [Hadoop, Big Data]
comments: true
excerpt_separator: <!--more-->
---

Apache Hadoop is the most used tool now days to process large quantities of data but it is not alone in this task. In the past years a couple of projects arise on top of Hadoop to help to extend the  core functionalities of Hadoop and in this post I will give a little introduction to a couple of them.
 
<!--more-->

## Introduction

Apache Hadoop is a framework build to allow the distributed processing of large data sets across clusters of computers using simple programming models.

With this post I intend to give a brief look at some of the more important tools used to complement the Hadoop functionalities.

This post is just to give a quick overview of these tools but for a more deeply look you should consult the project documentation.

## Resume of tools

* Flume
* Sqoop
* HBase
* Hive
* Pig
* Oozie

## Flume
[http://flume.apache.org](http://flume.apache.org)

Apache Flume is a distributed, available and reliable service for efficiently collecting, moving and aggregating large amounts of log data.

With an simple architecture based on streaming data flows makes it robust and fault tolerant with tunable reliability mechanisms and many failover and recovery mechanisms.

### Architecture

![Flume Architecture](/assets/diagram/flume_architecture.jpg)

### Example

To use Flume we should start it by using the application *bin/flume-ng* passing for instance the flowing parameters:

	$ bin/flume-ng agent --conf conf --conf-file example.conf --name a1 -Dflume.root.logger=INFO,console

One of the parameters, --conf specifies the source of the configuration for this agent and for the sake of this example we can start from the following configuration:


    # example.conf: A single-node Flume configuration
    	
    # Name the components on this agent
    a1.sources = r1
    a1.sinks = k1
    a1.channels = c1
    
    # Describe/configure the source
    a1.sources.r1.type = netcat
    a1.sources.r1.bind = localhost
    a1.sources.r1.port = 44444
    
    # Describe the sink
    a1.sinks.k1.type = logger
    
    # Use a channel which buffers events in memory
    a1.channels.c1.type = memory
    a1.channels.c1.capacity = 1000
    a1.channels.c1.transactionCapacity = 100
    
    # Bind the source and sink to the channel
    a1.sources.r1.channels = c1
    a1.sinks.k1.channel = c1

This configuration basically specifies a single agent (a1) listening for information on port 4444.

To test if the Flume agent is running accordingly we can open a telnet session from a separate window:

	$ telnet localhost 44444
	Trying 127.0.0.1...
	Connected to localhost.localdomain (127.0.0.1).
	Escape character is '^]'.
	Hello world! <ENTER>
	OK

If everything is running well the original Flume session should output the event in a log message:

	12/06/19 15:32:19 INFO source.NetcatSource: Source starting
	12/06/19 15:32:19 INFO source.NetcatSource: Created serverSocket:sun.nio.ch.ServerSocketChannelImpl[/127.0.0.1:44444]
	12/06/19 15:32:34 INFO sink.LoggerSink: Event: { headers:{} body: 48 65 6C 6C 6F 20 77 6F 72 6C 64 21 0D          Hello world!. }


## Sqoop
[http://sqoop.apache.org](http://sqoop.apache.org)

Apache Sqoop is the right tool if we need to transfer efficiently bulk data between Apache Hadoop HDFS and structured databases such as relational databases. 

Sqoop automates the process of importing and exporting the information from Hadoop, using the Hadoop infrastructure to provide parallelism and fault tolerance.

After installing the tool if we execute in the command prompt *sqoop help* we should see the available operations, as displayed below:

	$ sqoop help
	usage: sqoop COMMAND [ARGS]
	
	Available commands:
	  codegen            Generate code to interact with database records
	  create-hive-table  Import a table definition into Hive
	  eval               Evaluate a SQL statement and display the results
	  export             Export an HDFS directory to a database table
	  help               List available commands
	  import             Import a table from a database to HDFS
	  import-all-tables  Import tables from a database to HDFS
	  import-mainframe   Import mainframe datasets to HDFS
	  list-databases     List available databases on a server
	  list-tables        List available tables in a database
	  version            Display version information
	
	See 'sqoop help COMMAND' for information on a specific command.

As displayed we can use *sqoop help COMMAND* to get more information about a particular operation.

Probably one of the must used operations in sqoop is the import operation, below we can see a simple command to connect to a MySQL database to import the data being possible to import a specific table, all tables or even just some records from a table:

	$ sqoop import --connect jdbc:mysql://localhost/employees \
	    --username jorgeacf --password 12345

As an example lets just check two examples of additional configuration that we can specify when calling sqoop import:

In this example we specify the exact columns from a table employee to import:

	$ sqoop import --connect jdbc:mysql://localhost/corp --table EMPLOYEES \
	    --columns "employee_id,first_name,last_name,job_title"

This example shows how to define that 8 map tasks will be used to import the data instead of 1 used by default:
	
	$ sqoop import --connect jdbc:mysql://localhost/corp --table EMPLOYEES \
	    -m 8

As the last example, we can also import only a specific set of records as showed in this example where only the records dated after 2010-01-01 will be imported:
	
	$ sqoop import --connect jdbc:mysql://localhost/corp --table EMPLOYEES \
	    --where "start_date > '2010-01-01'"

You can check the Sqoop documentation for more options but always keep in mind that Sqoop is very powerful and flexible so if you need to transfer data from/to Hadoop it might save you time and problems checking Sqoop as it must likely will solve your problems.

## HBase

[http://hbase.apache.org/](http://hbase.apache.org/)

Apache HBase is a distributed, non-relational database based on Google Big Table that is well suited when we need random, realtime read/write access to very large tables (billions of rows X millions of columns) running on clusters of commodity hardware like Hadoop.

Some of the most important features:

* Linear and modular scalability.
* Strictly consistent reads and writes.
* Automatic and configurable sharding of tables.
* Automatic failover support between Region Servers.
* Convenient base classes for backing Hadoop MapReduce jobs with Apache HBase tables.
* Easy to use Java API for client access.
* Amongst others...

After installing HBase in your cluster like almost every Hadoop tool we can open a command line session and run the hbase shell command to connect to the HBase instance.

	$ ./bin/hbase shell
	hbase(main):001:0>

After connect to a HBase instance from the shell we can create a fist table using the  command *create*:

	hbase(main):001:0> create 'test', 'cf'
	0 row(s) in 0.4170 seconds
	
	=> Hbase::Table - test

This creates a new table test and a column family cf, in short a column family is like a group for columns with similar data to be together since all columns within the same column family will be grouped together on disk.

After the table creation we can add information to the table using the command *put*:

	hbase(main):003:0> put 'test', 'row1', 'cf:a', 'value1'
	0 row(s) in 0.0850 seconds
	
	hbase(main):004:0> put 'test', 'row2', 'cf:b', 'value2'
	0 row(s) in 0.0110 seconds
	
	hbase(main):005:0> put 'test', 'row3', 'cf:c', 'value3'
	0 row(s) in 0.0100 seconds

To see the information in a specific table we can use the command *scan* to get all the table data at once:

	hbase(main):006:0> scan 'test'
	ROW                                      COLUMN+CELL
	 row1                                    column=cf:a, timestamp=1421762485768, value=value1
	 row2                                    column=cf:b, timestamp=1421762491785, value=value2
	 row3                                    column=cf:c, timestamp=1421762496210, value=value3
	3 row(s) in 0.0230 seconds

This is just a small set of the operations that HBase support, for more information the HBase documentation is a good place to get more deeply within HBase.

## Hive

[http://hive.apache.org/](http://hive.apache.org/)

The Apache Hive makes easy to querying and managing large datasets residing in distributed storage.

This way Hive provides a mechanism to project structure onto this data and query the same in a language called HiveQL.

In addition to the HiveQL operations we can use regular mappers and reducers to extend the logic in HiveQL.

### DDL Operations

To create a table in Hive we should *run* the command:

	hive> CREATE TABLE users (id INT, username STRING);

We could list all the tables using the *show* command:

	hive> SHOW TABLES '.*s';

Additionally we can use de command *describe* to display the information about a specific table.

	hive> DESCRIBE users;

### DML Operations

To load data from a flat file into Hive we could use the following command:

	hive> LOAD DATA LOCAL INPATH './users.txt' OVERWRITE INTO TABLE users;

This command will load the file users.txt containing two columns separated by ctrl-a into users table. 'LOCAL' is used to load the file from the local file system and if this parameter is omitted then HIVE will look for the file in HDFS. The parameter 'OVERWRITE' means that existing data in the table is going to be deleted.

### SQL Operations

SELECTS and FILTERS

	hive> SELECT u.username FROM users u WHERE u.country='pt';

Selects the column 'username' from all rows of partition country=pt of the users table and simple displays it to the console.

If the data returned by the query needs to be consulted or manipulated multiple times we can save the results back to the file system, for example using the following query:

	hive> INSERT OVERWRITE DIRECTORY '/tmp/hdfs_out' SELECT u.username FROM users u WHERE u.country='pt';

GROUP BY

	hive> FROM roles r INSERT OVERWRITE TABLE users SELECT r.name, count(*) WHERE r.active = 1 GROUP BY r.name;

JOIN

	hive> FROM users u JOIN roles r ON (u.id = r.userId) INSERT OVERWRITE TABLE user_roles SELECT u.id, u.username, r.name;

MULTITABLE INSERT

	FROM src
	INSERT OVERWRITE TABLE dest1 SELECT src.* WHERE src.id < 100
	INSERT OVERWRITE TABLE dest2 SELECT src.id, src.value WHERE src.id >= 100 and src.key < 200
	INSERT OVERWRITE LOCAL DIRECTORY '/tmp/dest3.out' SELECT src.value src.id >= 300;

STREAMING

	hive> FROM users u INSERT OVERWRITE TABLE permissions SELECT TRANSFORM(u.id, u.username) AS (id, user) USING '/bin/cat' WHERE u.country = 'pt';

This command streams the data in the map phase through the script /bin/cat, similarly to the Hadoop streaming.

## Pig

[https://pig.apache.org/](https://pig.apache.org/)

Apache Pig is a platform for analysing large data sets without the need to write map reduce tasks that can be expressed with a high-level language. One of the fundamental properties of the Pig infrastructure is that it can be paralelized, characteristic that enables it to be used with large data sets.

The programs in Pig are expressed in a language called Pig Latin, that in some ways is very similar with regular SQL used in RDBMS systems. In addition with the functions already available in the language the user can specify functions called UDF (User defined functions) in a variety of languages like Java, Python, Javascript and others that in is essence represent a map reduce job.

The "Hello World" in Pig (and almost every tool in the Hadoop ecosystem) is a word count example like the one shown below:
	
	 input_lines = LOAD '/tmp/input-files' AS (line:chararray);
	 
	 words = FOREACH input_lines GENERATE FLATTEN(TOKENIZE(line)) AS word;
	 
	 filtered_words = FILTER words BY word MATCHES '\\w+';
	 
	 word_groups = GROUP filtered_words BY word;
	 
	 word_count = FOREACH word_groups GENERATE COUNT(filtered_words) AS count, group AS word;
	 
	 ordered_word_count = ORDER word_count BY count DESC;
	 STORE ordered_word_count INTO '/tmp/output-result';

The example above will create a set of map reduce jobs that will be able to run in parallel in multiple nodes and that allows to analyse large data sets.

## Oozie

[http://oozie.apache.org](http://oozie.apache.org)

Apache Oozie is a scalable, reliable and extensible workflow scheduler system no manage Apache Hadoop jobs.

Oozie is a Java Web-Application that runs in a Java servlet-container and it is integrated with the remaining Hadoop stack tools supporting several Hadoop jobs out of the box (such as Java map-reduce, Streaming map-reduce, Pig, Hive, Sqoop and Distcp) as well as system specific jobs (like Java programs and shell scripts).

Oozie workflows definitions are written in hPDL and it contains a collection of actions (i.e. Hadoop Map/Reduce, Pig jobs, Hive, HDFS file system, SSH, HTTP, eMail) arranged in a control dependency DAG (Direct Acyclic Graph).

The following example we define a work-flow with three main tasks, the first one will run a sqoop job to import the data from a MySQL database to HDFS, the second job will run a Pig script to filter (or any other operation possible with Pig) if this job completes successfully the third and last job will run and in this case a Hive script will be executed and the results will be available in the HDFS path the configured in the job configuration.

#### Example of Oozie workflow xml configuration file

	<?xml version="1.0" encoding="UTF-8"?>
	<workflow-app xmlns="uri:oozie:workflow:0.2" name="cs-wf-fork-join">
	    <start to="fork-node"/>
	 
	    <fork name="fork-node">
	        <path start="sqoop-node" />
	        <path start="pig-node" />
	    </fork>
	 
	    <action name="sqoop-node">
	        <sqoop xmlns="uri:oozie:sqoop-action:0.2">
	            <job-tracker>${jobTracker}</job-tracker>
	            <name-node>${nameNode}</name-node>
	            <prepare>
	                <delete path="${nameNode}/${demos}/input-data/employees"/>
	            </prepare>
	 
	            <configuration>
	                <property>
	                    <name>mapred.job.queue.name</name>
	                    <value>${queueName}</value>
	                </property>
	            </configuration>
	            <command>
			import --connect jdbc:mysql://localhost/employees 
				--table employees 
				--target-dir ${demos}/input-data/employees 
				-m 1
		    </command>
	        </sqoop>
	        <ok to="joining"/>
	        <error to="fail"/>
	    </action>
	 
	    <action name="pig-node">
	        <pig>
	            <job-tracker>${jobTracker}</job-tracker>
	            <name-node>${nameNode}</name-node>
	            <prepare>
	                <delete path="${nameNode}${demos}/intermediate"/>
	            </prepare>
	            <configuration>
	                <property>
	                    <name>mapred.job.queue.name</name>
	                    <value>${queueName}</value>
	                </property>
	                <property>
	                    <name>mapred.compress.map.output</name>
	                    <value>true</value>
	                </property>
	            </configuration>
	            <script>data_filter.pig</script>
	            <param>INPUT=${demos/clickstream</param>
	            <param>OUTPUT=${demos}/intermediate</param>
	        </pig>
	        <ok to="joining"/>
	        <error to="fail"/>
	    </action>
	 
	    <join name="joining" to="hive-node"/>
	 
	    <action name="hive-node">
	        <hive xmlns="uri:oozie:hive-action:0.2">
	            <job-tracker>${jobTracker}</job-tracker>
	            <name-node>${nameNode}</name-node>
	            <prepare>
	                <delete path="${nameNode}/${demos}/finaloutput"/>
	            </prepare>
	            <configuration>
	                <property>
	                    <name>mapred.job.queue.name</name>
	                    <value>${queueName}</value>
	                </property>
	            </configuration>
	            <script>script.sql</script>
	            <param>CLICKSTREAM=${demos}/intermediate/</param>
	            <param>USER=${demos}/input-data/employees/</param>
	            <param>OUTPUT=${demos}/finaloutput</param>
	        </hive>
	        <ok to="end"/>
	        <error to="fail"/>
	    </action>
	 
	    <kill name="fail">
	        <message>Sqoop failed, error message[${wf:errorMessage(wf:lastErrorNode())}]</message>
	    </kill>
	    <end name="end"/>
	</workflow-app>


#### Oozie job configuration file (job.properties)
	
To run a Oozie job a configuration file typically called job.properties must be created and uploaded to HDFS. As a simple example please have a look at the following properties:

	nameNode=hdfs://localhost:9000
	jobTracker=localhost:9001
	queueName=default
	 
	demosRoot=oozie-demos
	demosRootDir=/user/${user.name}/${demosRoot}
	 
	oozie.use.system.libpath=true
	oozie.wf.application.path=${nameNode}/user/${user.name}/${demosRoot}/apps/cs

At last to run this job after upload all the necessary files to HDFS the following command needs to be executed in the command line:

	 bin/oozie job -oozie http://localhost:11000/oozie -config /home/jorgeacf/oozie-demos/job.properties -run


Thanks, JF
