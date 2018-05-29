---
layout: post
title: Introduction to Hadoop
author: Jorge Figueiredo
categories: [Hadoop, Big Data]
comments: true
excerpt_separator: <!--more-->
---

Apache Hadoop is a framework to process large quantities of information in a cluster of commodity hardware. It have a simple and easy to learn API that make it accessible to all developers to build algorithms to run in a cluster.
 
<!--more-->

## Introduction

Apache Hadoop is an open source framework for large scale processing and storage of terabyte data-sets on cluster of commodity hardware. Hadoop consisted of two main components Hadoop Distributed File System (HDFS) and a distributed computing engine that allows to implement and execute programs as MapReduce jobs.

MapReduce is a simple programming model that was popularized by Google by being useful for processing large datasets in a highly parallel and scalable way.

The MapReduce is based in the functional programming where engineers express a computation as two functions. The map function that receives the input data and produces key/value pairs that are then aggregated by key and passed as input to the reduce functions that in that case produce a result with the values associated with easy key.

In addition, the Hadoop infrastructure takes care of all aspects of the distributed processing such as resource management, inter-machine communication, handling software and hardware failures, parallelization, scheduling, and others. 
This clean and easy abstraction, implementing distributed applications to process terabytes of data on thousands of machines has never been easy even to engineers without experience with distributed systems.

## A bit of History

Hadoop is the most popular implementation of a large cluster inspired by the a paper published by Google in 2004 and it was created by Doug Cutting and Make Cafarella in 2005 originally developed to support distribution for the Nutch search engine project.

At that time Dug was working at Yahoo! and now he is Chief Architect at Cloudera.

The first release of Hadoop was in December 10, 2011 and the Hadoop 2 (YARN) was released in October 15, 2013.

## Hadoop Modules

The Apache Hadoop (MR2 or YARN) consists in four major modules that are the base for the Hadoop infrastructure:

**Hadoop Common**: contains libraries and utilities needed by other Hadoop modules.

**Hadoop Distributed File System (HDFS)**: distributed file-system to store data on a group or commodity machines.

**Hadoop YARN**: a resource-management platform responsible for managing compute resources in clusters and using them scheduling of user applications.

**Hadoop MapReduce**: a programming model for large scale data processing.

## High Level Architecture

In the classical version of Apache Hadoop (MRv1) we have two main entities, the Job Tracker and the Task Tracker. As the name suggests they manage the jobs and the map or reduce tasks.

<img alt="MR1 Architecure" src="/assets/diagram/mr1_architecture.jpg" style="width:50%" />

This arquitecture revealed a scalability bottleneck problem because of having a single JobTracker. These problems start to arise in clusters with more than 5000 nodes and 40000 tasks running concurrently. In an efford to solve these scalability issues a new architecture called YARN started to be developed. 

<img alt="MR2 YARN Architecture" src="/assets/diagram/mr2_architecture.jpg" style="width:50%" />

The YARN architecture was designed not only to try to solve the scalability problems with large clusters that the first version has but also allow to abstract the framework to run other applications than Hadoop, this new architecture was implemented in five main entities:

* Client
	* Submit any type of application supported by YARN.

* Resource Manager (RM)
	* Allocates available resources to appropriate applications and tasks.
	* Monitors applications masters.
	* Keeps track of live Node Managers and resources available.

* Node Manager (NM)
	* Provides computational resources in form of containers.
	* Manage processes running in containers.

* Application Master (AM)
	* Asks for appropriate resource containers to run tasks.
	* Coordinates the execution of all tasks within its application.

* Containers
	* Can run different types of tasks.
	* Has different sizes (e.g. RAM, CPU) 


## Hadoop Distributed File System (HDFS)

In order to Hadoop to process large amount of data the problem of storing large quantities of data also had to be solved. 

The Hadoop Distributed File System (HDFS) is a distributed file system designed to store in a reliable way large quantities of information in a cluster of commodity hardware. It have key differences from other existing distributed file systems like replication, data locality

### NameNode and DataNodes

HDFS probably like the majority of distributed systems follows the master/slave paradigm and in this case the NameNode is the master and the DataNodes are the slaves.

<img alt="HDFS Architecture" src="/assets/diagram/hdfs.jpg" style="width:50%" />

### Data Replication

## Example of MapReduce job

Is tradition to present a new language to write a "Hello World" program, in Hadoop the "Hello World" application is typically a job to count the number of words in a input text.

### Job Client

	public class HadoopJobRunner1 extends Configured implements Tool
	{
	    public static void main( String[] args ) throws Exception
	    {
	        int res = ToolRunner.run(new Configuration(), new HadoopJobRunner1(), args);
	        System.exit(res);
	    }
	
		public int run(String[] args) throws Exception {
			
			Configuration conf = getConf();
	
			Job job = Job.getInstance(conf);
			
			job.setJarByClass(HadoopJobRunner1.class);
			
			
			job.setMapperClass(TestMapperTextInputFormat.class);
			job.setReducerClass(TestReducerTextInputFormat.class);
			
			
			job.setMapOutputKeyClass(LongWritable.class);
			job.setMapOutputValueClass(Text.class);
			
			job.setOutputKeyClass(LongWritable.class);
			job.setOutputValueClass(Text.class);
			
			// Input
			FileInputFormat.addInputPath(job, new Path("input"));
			job.setInputFormatClass(TextInputFormat.class);
			
			// Output
			FileOutputFormat.setOutputPath(job, new Path("output"));
			//job.setOutputFormatClass(KeyValueTextOutputFormat.class);
	
			return job.waitForCompletion(true) ? 0 : 1;
		}
	}

### Mapper

	public class TestMapperTextInputFormat extends Mapper<LongWritable, Text, LongWritable, Text> {
	
		
		@Override
		public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
			
			
			String[] line = value.toString().split(",");
			
			context.write(new LongWritable(Integer.parseInt(line[0])), new Text(line[1]));
		
		}
	}

### Reducer

	public class TestReducerTextInputFormat extends Reducer<LongWritable, Text, LongWritable, Text> {

		@Override
		public void reduce(LongWritable key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
			
			List<String> valuesList = new ArrayList<String>();
			
			for(Text text : values) {
				valuesList.add(text.toString());
			}
			
			context.write(key, new Text(String.join("-", valuesList)));
			
		}
		
	}

## Configuration

## Streaming

Hadoop provides a API in Java to specify Map/Reduce Jobs but in addition and to allow engineers with knowledge in other languages.

The way that Hadoop Streaming API allows other languages than Java run Jobs is by specifing the Map and Reduce functions and read the data from STDIN and write the results to the STDOUT.

### mapper.py
	
The following Python script could be used as a mapper function using the Hadoop Streaming API. It reads data from the STDIN, splinting each line into words and outputting the pair word and the value 1 for each word.

	#!/usr/bin/env python
	
	import sys
	
	for line in sys.stdin:

		line = line.strip()

		words = line.split()

		for word in words:

			print '%s\t%s' % (word, 1)


### reducer.py

On the other side the following Python script will read from the STDIN the pairs of words and the value that the previous mapper function emit and it will make the count for each word.

	#!/usr/bin/env python

	from operator import itemgetter
	import sys

	current_word = None
	current_count = 0
	word = None

	for line in sys.stdin:
	
		line = line.strip()

		word, count = line.split('\t', 1)

		try:
			count = int(count)
		except ValueError:
			continue
		
		if current_word == word:
			current_count += count
		else:
			if current_word:
				print '%s\t%s' % (curret_word, current_count)
			current_count = count
			current_word = word

	if current_word = word:
		print '%s\t%s' % (current_word, current_count)


### Run the MapReduce job

To run the MapReduce job we need to upload the necessary files to the HDFS and then we can run job calling hadoop for instance with the following parameters:

	$ bin/hadoop jar contrib/streaming/hadoop-*streaming*.jar \
	-file /home/jorgeacf/mapper.py    -mapper /home/jorgeacf/mapper.py \
	-file /home/jorgeacf/reducer.py   -reducer /home/jorgeacf/reducer.py \
	-input /user/jorgeacf/input/* -output /user/jorgeacf/output