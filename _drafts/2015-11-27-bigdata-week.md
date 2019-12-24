---
layout: post
title: London Big Data Week + Big Data in 2016
author: Jorge Figueiredo
categories: [Big Data, Conferences, Meet-ups]
comments: true
excerpt_separator: <!--more-->
---

My current view about Big Data and London Big Data Week.

<!--more-->

<br/>

Is not new that Big Data is and will continue to be one of the areas in the IT industry that get more attention and growth, a large group of companies are trying to be "data driven" by trying to monetise their data in most of the cases by providing more fine tuned information and services for their customers something that really makes the difference as we are flooded with information on our daily lives so this is definitely something that most of us will appreciate.

Last week the Big Data community in London had the opportunity to learn and share experiences in an event that during a week provide us with workshops, conferences and meetups in a variety of subjects related with Big Data from advanced machine learning techniques to detect human sentiments in datasets of pictures to what concerns do we need to have in terms of ethics and privacy in big data.

This event runs in different cities over the would from Barcelona, São Paulo to Moscow but it's origin was here in London in 2012 and have been growing alongside with the growth of the Big Data industry.

This year the event was focus around case studies in the industries like Retail, Gaming, Advertising, Publishing and IoT showing how these industries are changing with the help of Big Data.

I have not attended to all events during the week but in my opinion the following three talks definitely got my attention:

**Deep learning @Twitter: using the right tools** by Nicolas Koumchatzky on Monday 23th 
(http://www.meetup.com/Data-Science-London/events/226696208/)

  In this talk, Nicolas discussed some of the tools that the Twitter Cortex Team is using to have a environment to test, experiment and deploy models quickly making an environment efficient to work but also being flexible to research. 

  One of the tools refereed in the presentation was Torch7 that allows Matlab-like tensor's calculations and manipulations in Lua (low level C) and more specifically Torch-autograd that automatically differentiates native Torch code amongst other features that can be found on Twitter GitHub at https://github.com/twitter/torch-autograd/ with more detail.

  Torch-autograd compares with the recently open-sourced TensorFlow by Google but one of the main differences apart from the language supported, Lua used by Torch-autograd and Python used by TensorFlow is the fact that Torch-autograd supports compiled and non-compile graph (Dynamic DAG) but TensorFlow only supports compiled graph. TensorFlow have the adventage that supports control over the hardware.

  Twitter has been a great contributor for the open source community especially in the Big Data space but also in other software engineering areas and their open source projects can be found at https://github.com/twitter/.

<img src="http://i.imgur.com/rLbZhPp.jpg" alt="Twitter office" style="width:600px;" />

**From too late to real time – Data Science driving real time decisioning** by Kriti Sharma and three members of her team at Barclays on Tuesday 24th (http://www.meetup.com/hadoop-users-group-uk/events/226589899/)

  In this talk Kriti demostrated how the relationship between banks and their customers have changed, as most of the customer are not going to the bank branches frequently as they were in the past and for that reason the banks need to get different ways to get to the customers to offer other services. 
  
  Here is were big data and data science can help for example providing insight from transactional data from the customers to better target the customers with the most relevant products.

  It was interesting to see that even large banks that some times have the reputation of being more slow to adopt new technologies are also trying to implement Big Data in their infrastructure and for that credit must be given to Barclays and Kriti team. 

**Big Data Pipelining - Discover how to use Spark, Cassandra and Docker** by Simon Ambridge on Friday 27th (http://www.meetup.com/Cassandra-London/events/226859450/)

  Simon's talk was the most hands on from these three that I have highlighted and he showed us an very interesting demo of how we can use Spark and Cassandra within an Docker containers environment. Cassandra is a high performance distributed database and for that reason is one of the best choices to store and manipulate data with Spark. 

  You can find the talk resources on the meetup.com page of the Cassandra London group including a tutorial to setup this kind of environment with Cassandra/Spark/Docker with an nice browser base notebook to execute the commands.

<img src="http://i.imgur.com/aYV3sc2.jpg" alt="Cassandra Meetup" style="width:600px;" />

These examples are only to exemplify some of the talks that I found particular relevant for my current interests but in average all the other were very interesting and relevant for what is going on in Big Data and that is the reason because I think that this event is definitely very useful for anyone that is interested in Big Data whatever is their current role being Engineer, Architect, Data Science, Manager and others.

With all these things going on the the Big Data space and on the same time the fact that not always is easy to find a way to effectively make profit from the data that companies have already collected or are trying to collect many big data projects fail, many projects that fail are actually because of the reasons that traditional software projects also fail like not being able to identify a business model but that in this case should profit from their data but also not being able to demonstrate multiple benefits to decision makers or even the non existing or poor planning.

Being this field so dynamic where new frameworks or libraries are coming up every year which makes it also difficult to engineers, data scientists and analysts to keep updated or learn all of these technologies that might be another reason for why some projects fail and because of that we are seeing a race between the number of skilled professionals that we can get and how much can we automate to need less of those skilled professionals.

If we were doing a list of the top reasons to big data projects to fail, probably the last one to add should be a bit of a contradiction since its the fact that some companies trust more that they should on data results that might be the case that the results are wrong or at least the are not relevant for the real world cases.

It is always difficult to predict the future but I think that we can get some directions that have great probabilities to have important developments in the short term. 

One of the areas is the Internet of things that been pointed to be very disruptive for the last two years or so but it is a field that it's been difficult to find business models around it however it might be soon getting to a boiling phase and with that will come some challenges like security that is already a industry weakness that we definitely need to address in a more deeply way especial with the data that IoT can create like logs from wearables or your home appliances. 
Would you like to see public detailed information about your movements captured by your bracelet or what you had or have in your fridge when we had all or home appliances connected to the internet? Having strong security will probably drive to more adoption for these technologies or at least it will not create barriers for adoption. 
Another issue will be the even greater amount of data to be stored, transformed and processed that will not only require valid technologies and infrastructures to support it but also engineers, architects and data scientists to be able to deal with these systems and data.

Deep Learning is another area that we are already having big developments in the last two or three years and that will definitely to continue in the future. Image and Video recognition systems especially in large companies like Google, Facebook, Microsoft are developing systems to label or categorise large datasets of pictures automatically, natural language processing, automatic speech recognition but also fields like Bioinformatics or even CRM are getting the benefits of the developments in Deep Learning.


With all this very fast rhythm were companies are fighting to be able to implement or develop the best and latest technologies as that will be a part of their success the cloud that already have a huge adoption will continue to grow as companies need a fast and easy environment to implement their systems. We are most likely going to start to see more cloud providers to provide deep learning services running on GPUs but other kinds of services will also start to show up. 
One that is already starting to be discussed is Big Data as Service witch is still a concept not very well defined to describe a wide range of services to create, store and manipulate in the cloud but companies to implement their big data initiatives still need professionals with the right skills to setup and integrate the actual services and technologies but the issue is that since there is also a shortage of skilled professionals more solutions to easily analyse large data sets will be most likely very well adopted by companies.

I look forward for the next London Big Data Week and I'm excited about the developments and growth in the Big Data technologies and community.

