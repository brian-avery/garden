---
title: "CVSS Scoring"
tags: [security, cvss, vulnerability scoring, exploit evaluation]
alias: [CVSS Scoring]
---

The Common Vulnerability Scoring System (CVSS) is framework for communicating the characteristics and severity of software vulnerabilities. This is a score from 0-10 based on: 

### Impact
* Scope changed
* Confidentiality
* Integrity
* Availability

### Exploitabilty
* **Attack vector**: a measure of how much network access an attacker requires _[adjacent, local, physical]_
* **Attack complexity**: how difficult the weakness is to exploit _[low, high]_
* **Privileges required**: how privileged the attacker needs to be [none, low, high] 
* **User interaction**: how much user interaction is required to exploit the vulnerability

A score is developed for the impact and the exploitability, which are then combined in order to generate the CVSS score.

**NOTE** the CVSS communicates how easy a vulnerability is to exploit and its impact. It does not describe how likely a vulnerability is to be exploited. 

***
_References_

* [CVSS calculator](https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator)