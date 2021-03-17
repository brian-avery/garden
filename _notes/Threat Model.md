---
title: "Threat Model"
keywords: [security]
stage: budding
---

Threat modeling is a structured process to identify weaknesses, threats, and vulnerabilities in a system. Once identified, mitigations and fixes for these threats can be prioritized. 

It should be completed as early as possible in the design process, preferably before designs are implemented or deployed. Waiting too long to create a threat model may allow security issues to be introduced through design choices that are easily exploited and difficult to fix. Patterns may also be more pervasive throughout the software. 

When constructing a threat model, the entire team should be involved in order to generate discussion and clarity in the design and execution. 

The process is as follows: 
1. Break the system down into a collection of its components, their interactions with the world, and the actors who may perform those actions. 
1. Imagine what may cause these components and interactions to fail or what could make them fail. 
1. Repeat the process to uncover further issues

**NOTE**: [Common Weakness Enumeration (CWE)](https://cwe.mitre.org/)  has created a listing of common weaknesses that may be useful to reference. 

The threat model should evolve as the software evolves and be updated periodically. Decisions and their impacts made as a result of analyzing the threat model should be documented. This will help make the decisions easier to understand in the future. 

A threat model won't solve all security challenges, but it will help discover many issues. 

## Terms
* Weakness -- design flaw that modifies behavior or functionality
* Severity -- the potential for damage of a weakness. This can be calculated using [[CVSS Scoring]]
* Exploitability -- how easy it is to exploit a weakness
* Vulnerability -- exploitable weakness

***
_References_
* [Microsoft Elevation of Privileges Game](https://www.microsoft.com/en-us/download/details.aspx?id=20303)
* Tarandach, I., & Coles, M. J. (2020). _Threat Modeling: A Practical Guide for Development Teams_ (1st ed.). O’Reilly Media.
* [Cyber Threat Modeling](https://www.eccouncil.org/threat-modeling/)
* [Common Weakness Enumeration (CWE)](https://cwe.mitre.org/) 
* [Cost to fix bugs and defects](https://www.synopsys.com/blogs/software-security/cost-to-fix-bugs-during-each-sdlc-phase/)