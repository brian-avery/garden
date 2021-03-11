---
title: "Code Reviews"
keywords:
stage: budding
---

Code reviews are a process in which other members of a team review code changes before they get committed to a source control system.  These can have many benefits including more readable/maintainable code, improved solutions, accident prevention, finding bugs, knowledge sharing, and mentoring. Often, these are expanded upon with additional automated tooling. 

![Utility of specific comment classifications](https://docs.microsoft.com/en-us/azure/devops/learn/_img/usefulness-of-comments.png)

## Feedback
Best | Ok | Not useful
------------ | ------------ | ---------
Functional defects, missing corner cases or validation, API usage, best practices | Documentation, coding style, conventions, spelling mistakes |Alternatives without benefits, existing tech debt and refactoring, planning and future work

## Reading modes
* Ad-hoc: no predefined way to do the code reviews
* Scenario based: scenario is "data type consistency"
* [[Code Review Checklist]]: review based on questions, instructions 
* Test-driven code reviews: analyze by starting with test code

## Reviewers' Success
* Expert blindspot: Experts are frequently so familiar with their subject that they can no longer imagine what it's like to *not* understand the world that way
* Experts tend to give more valuable code reviews, but code reviews should not be restricted to experts or you get knowledge pockets
* The larger a code review is, the less useful and reviewable it is. 

![[Pasted image 20210303150834.png]]

## Purpose driven processes
* when is a change ready for review?
* who should review the change?
* when should the review take place? 
* what should reviewers look for? 
* when can a change be reviewed?


***
_TO REVIEW_

* https://google.github.io/eng-practices/review/reviewer/
* [Boosting your code reviews with useful comments](https://docs.microsoft.com/en-us/azure/devops/learn/devops-at-microsoft/boosting-code-reviews-useful-comments)
* https://www.michaelagreiler.com/workshops/

***
_References_

* [Code Reviews: from Bottleneck to Superpower by Dr Michaela Greiler](https://www.youtube.com/watch?v=gRR-UhusQe8)
