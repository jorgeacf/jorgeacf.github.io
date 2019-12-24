---
layout: post
title: Algorithm execution cost analysis
author: Jorge Figueiredo
categories: [Algorithms]
comments: true
excerpt_separator: <!--more-->
---

In this blog post I will write about the analysis of the cost in terms of memory and processor resources cost.
 
<!--more-->

### Introduction

An algorithm can be described as a set of computational instructions that receives a input in a form of a value or a set of values and returns or produces a output also as a value or a set of values. 

To analyse the cost of the execution of a algorithm and by that I mean what is the cost in terms for processor resources and memory necessary to process an input and produce an output.

To add more complexity to this analysis there is a number of variables to considerer that will influence the time that will take the algorithm to execute:

* The hardware that it is running upon, especially regarding the processor and memory capacities.
* The programming languages that the algorithm is coded.
* The compiler and environment you are using.

All these variables have influence in the time that the algorithm is going to take to complete, but in order to make more easy to compare the performance of multiple algorithms we need to define a way that is abstract enough and it is easy to compare the performance between algorithms. 

The important thing is to know if an implementation of an algorithm is going to take the same, double, triple of the time comparing with other implementation, it is not the amount of milliseconds they are going to take to complete.

### So what should we take in consideration to define the performance of an algorithm?

It’s important to define what we should measure if we need to predict the performance of the algorithm with different input values topically this is made using what is called the Big O notation.

This notation describes how the time the algorithm takes to complete based on the number of input elements.
 

### Algorithms order of growth


**Constant**: Having a constant order of growth means that independently of the size of the algorithm input the time to execute will be always the same. For instance the instruction int i = 0; will always take the same time to complete.

**Logarithmic**: A logarithmic order of growth is typically when the algorithm divides the input in half. An example of an algorithm with a logarithmic cost is the well known binary search were we verify if the element that we are looking for is on the first half of the input or on the second, and 

**Linear**: A linear order of growth is when the algorithm loop through all the elements of the output. An example of an algorithm is to find the maximum in a list of elements where we need to loop throw all elements to check the maximum.

**Linearithmic**: A linearithmic order of growth 

**Quadratic**: A quadratic order of growth is when the algorithm have a double loop.

**Cubic**: A cubic order of growth is when the algorithm have a triple loop.

**Exponential**: An exponential order of growth is the worst in terms of scalability because the cost of the algorithm increases exponentially with the size of the input. Typically the algorithms to check all the subsets have this cost. 
 

### Worst-case and average-case analysis

Is not true for all cases that the running time of an algorithm can be defined only by the size of the input. 
For instance, if we are defining an algorithm to sort a list of elements as the input, the time to sort the list can depend of the order of the elements in the input list. If the list is "almost" order the running time is going to be less in the case of the list being in the reverse order that the algorithm should order the list.

This is the reason because sometimes in the analysis of the algorithm we define values for the worst and average case. The worst-case is normally how long it would take for the algorithm to run if it were given with the most insidious of all possible inputs. The average-case is the average of how long it would take the algorithm to run if it was given all possible inputs. 
 

### Summary of order of growth of algorithms

The figure below summarises the order of growths that we discussed in this post:

|Order of growth|Name			|Description        |Example           |
|---------------|---------------|-------------------|------------------|
|$$1$$			|constant		|statement          |adding two numbers|
|$$logN$$ 		|logarithmic	|divide in half     |binary search     |
|$$N$$			|linear			|loop               |find the maximum  |
|$$N log N$$	|linearithmic	|divide and conquer |mergesort         |
|$$N^2$$		|quadratic		|double loop        |check all pairs   |
|$$N^3$$		|cubic			|triple loop        |check all triples |
|$$2^N$$		|exponential	|exhaustive search  |check all subsets |

In order to have the best performance algorithms we should strive to implement algorithms with the costs constant, logarithmic, linear and linearithmic.

### Problem size solvable in minutes


|Growth rate    |1970s		|1980s				|1990s	|2000s	|
|---------------|-----------|-------------------|-------|-------|
|$$1$$			|any		|any				|any	|any	|
|$$logN$$ 		|any		|any				|any	|any	|
|$$N$$			|millions	|tens of millions	|hundreds of millions|billions|
|$$N log N$$	|hundreds of thousands|millions|millions|hundreds of millions|
|$$N^2$$		|hundreds|thousands|thousands|tens of thousands|
|$$N^3$$		|hundred|hundreds|thousands|thousands|
|$$2^N$$		|20|20s|20s|30|

### Memory

In addition to the processing time of an algorithm we also need to be aware about the memory that our algorithm is going to need to complete his execution.

Each variable that we create in our algorithm have a memory cost depending of the type of variable

#### Primitive Types

|type   |bytes|			
|-------|-----|			
|boolean|1    |			
|byte   |1    |
|char   |2    |
|int    |4    |
|float  |4    |
|long   |8    |
|double |8    |


#### One-dimensional array

|type    |bytes  |
|--------|-------|
|char[]  |2N + 24|
|int[]   |4N + 24|
|double[]|8N + 24|

#### Two-dimensional array

|type      |bytes  |
|----------|-------|
|char[][]  |~2MN   |
|int[][]   |~4MN   |
|double[][]|~8MN   |

#### Typical memory usage for objects (in Java)

* Object overhead: 16 bytes.
* Reference: 8 bytes.
* Padding: Each object uses a multiple of 8 bytes.

### Conclusion and why knowing algorithm cost analysis is important

As a computer scientist, it is crucial to understand and estimate the running time of an algorithm. Assuming that you are working on a critical piece of software not being able to predict the behaviour of the algorithm face to the increase of the input can lead to problems in a future more close that we would desire.

It will be easy as soon as the complexity of the algorithm increases that the analysis of the running cost will be also complicated that is the reason because knowing very well the fundamentals of algorithms design and analysis is so important as the base knowledge.

