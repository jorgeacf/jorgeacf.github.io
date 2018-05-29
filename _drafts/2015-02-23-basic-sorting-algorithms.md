---
layout: post
title: Basic Sorting Algorithms
author: Jorge Figueiredo
date: 2015-02-23 00:00:00
categories: [Back to basics]
comments: true
excerpt_separator: <!--more-->
---


This post talks about the basic sorting algorithms.

<!--more-->

## Introduction


## Principal sorting algorithms

### Insertion Sort

Insertion sort is probably the most fundamental and straightforward sorting algorithm.

	for i = 2:n,
		for (j = i; j > 1 and a[j] < a[j-1]; j--)
			swap a[j, j-1]
	end

Properties
* O(1) space
* O(n^2) comparisons and swaps

### Selection Sort

	for i = 1:n,
		k = i
		for j = i+1:n,
			if a[j] < a[k], 
				k = j
			swap a[i,k]
	end

Properties
* O(1) extra space
* O(n^2) comparisons
* O(n) swaps

### Bubble Sort

	for i = 1:n,
		swapped = false
		for j = n:i+1,
			if a[j] < a[j-1],
				swap a[j, j-1]
				swapped = true
		break if not swapped
	end

### Shell Sort

### Merge Sort

### Heap Sort

### Quick Sort