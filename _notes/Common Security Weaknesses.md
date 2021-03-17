---
title: "Common Weaknesses"
tags: [security]
keywords:
alias: []
---

Rank

ID

Name

1

[CWE-119](https://cwe.mitre.org/data/definitions/119.html)

Improper Restriction of Operations within the Bounds of a Memory Buffer

2

[CWE-79](https://cwe.mitre.org/data/definitions/79.html)

Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')

3

[CWE-20](https://cwe.mitre.org/data/definitions/20.html)

Improper Input Validation

4

[CWE-200](https://cwe.mitre.org/data/definitions/200.html)

Information Exposure

5

[CWE-125](https://cwe.mitre.org/data/definitions/125.html)

Out-of-bounds Read

6

[CWE-89](https://cwe.mitre.org/data/definitions/89.html)

Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')

7

[CWE-416](https://cwe.mitre.org/data/definitions/416.html)

Use After Free

8

[CWE-190](https://cwe.mitre.org/data/definitions/190.html)

Integer Overflow or Wraparound

9

[CWE-352](https://cwe.mitre.org/data/definitions/352.html)

Cross-Site Request Forgery (CSRF)

10

[CWE-22](https://cwe.mitre.org/data/definitions/22.html)

Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')

11

[CWE-78](https://cwe.mitre.org/data/definitions/78.html)

Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')

12

[CWE-787](https://cwe.mitre.org/data/definitions/787.html)

Out-of-bounds Write

13

[CWE-287](https://cwe.mitre.org/data/definitions/287.html)

Improper Authentication

14

[CWE-476](https://cwe.mitre.org/data/definitions/476.html)

NULL Pointer Dereference

15

[CWE-732](https://cwe.mitre.org/data/definitions/732.html)

Incorrect Permission Assignment for Critical Resource

16

[CWE-434](https://cwe.mitre.org/data/definitions/434.html)

Unrestricted Upload of File with Dangerous Type

17

[CWE-611](https://cwe.mitre.org/data/definitions/611.html)

Improper Restriction of XML External Entity Reference

18

[CWE-94](https://cwe.mitre.org/data/definitions/94.html)

Improper Control of Generation of Code ('Code Injection')

19

[CWE-798](https://cwe.mitre.org/data/definitions/798.html)

Use of Hard-coded Credentials

20

[CWE-400](https://cwe.mitre.org/data/definitions/400.html)

Uncontrolled Resource Consumption

21

[CWE-772](https://cwe.mitre.org/data/definitions/772.html)

Missing Release of Resource after Effective Lifetime

22

[CWE-426](https://cwe.mitre.org/data/definitions/426.html)

Untrusted Search Path

23

[CWE-502](https://cwe.mitre.org/data/definitions/502.html)

Deserialization of Untrusted Data

24

[CWE-269](https://cwe.mitre.org/data/definitions/269.html)

Improper Privilege Management

25

[CWE-295](https://cwe.mitre.org/data/definitions/295.html)

Improper Certificate Validation




## Top 10 Web Application Security Risks

1.  [**Injection**](https://owasp.org/www-project-top-ten/2017/A1_2017-Injection). Injection flaws, such as SQL, NoSQL, OS, and LDAP injection, occur when untrusted data is sent to an interpreter as part of a command or query. The attacker’s hostile data can trick the interpreter into executing unintended commands or accessing data without proper authorization.
2.  [**Broken Authentication**](https://owasp.org/www-project-top-ten/2017/A2_2017-Broken_Authentication). Application functions related to authentication and session management are often implemented incorrectly, allowing attackers to compromise passwords, keys, or session tokens, or to exploit other implementation flaws to assume other users’ identities temporarily or permanently.
3.  [**Sensitive Data Exposure**](https://owasp.org/www-project-top-ten/2017/A3_2017-Sensitive_Data_Exposure). Many web applications and APIs do not properly protect sensitive data, such as financial, healthcare, and PII. Attackers may steal or modify such weakly protected data to conduct credit card fraud, identity theft, or other crimes. Sensitive data may be compromised without extra protection, such as encryption at rest or in transit, and requires special precautions when exchanged with the browser.
4.  [**XML External Entities (XXE)**](https://owasp.org/www-project-top-ten/2017/A4_2017-XML_External_Entities_(XXE)). Many older or poorly configured XML processors evaluate external entity references within XML documents. External entities can be used to disclose internal files using the file URI handler, internal file shares, internal port scanning, remote code execution, and denial of service attacks.
5.  [**Broken Access Control**](https://owasp.org/www-project-top-ten/2017/A5_2017-Broken_Access_Control). Restrictions on what authenticated users are allowed to do are often not properly enforced. Attackers can exploit these flaws to access unauthorized functionality and/or data, such as access other users’ accounts, view sensitive files, modify other users’ data, change access rights, etc.
6.  [**Security Misconfiguration**](https://owasp.org/www-project-top-ten/2017/A6_2017-Security_Misconfiguration). Security misconfiguration is the most commonly seen issue. This is commonly a result of insecure default configurations, incomplete or ad hoc configurations, open cloud storage, misconfigured HTTP headers, and verbose error messages containing sensitive information. Not only must all operating systems, frameworks, libraries, and applications be securely configured, but they must be patched/upgraded in a timely fashion.
7.  [**Cross-Site Scripting (XSS)**](https://owasp.org/www-project-top-ten/2017/A7_2017-Cross-Site_Scripting_(XSS)). XSS flaws occur whenever an application includes untrusted data in a new web page without proper validation or escaping, or updates an existing web page with user-supplied data using a browser API that can create HTML or JavaScript. XSS allows attackers to execute scripts in the victim’s browser which can hijack user sessions, deface web sites, or redirect the user to malicious sites.
8.  [**Insecure Deserialization**](https://owasp.org/www-project-top-ten/2017/A8_2017-Insecure_Deserialization). Insecure deserialization often leads to remote code execution. Even if deserialization flaws do not result in remote code execution, they can be used to perform attacks, including replay attacks, injection attacks, and privilege escalation attacks.
9.  [**Using Components with Known Vulnerabilities**](https://owasp.org/www-project-top-ten/2017/A9_2017-Using_Components_with_Known_Vulnerabilities). Components, such as libraries, frameworks, and other software modules, run with the same privileges as the application. If a vulnerable component is exploited, such an attack can facilitate serious data loss or server takeover. Applications and APIs using components with known vulnerabilities may undermine application defenses and enable various attacks and impacts.
10.  [**Insufficient Logging & Monitoring**](https://owasp.org/www-project-top-ten/2017/A10_2017-Insufficient_Logging%2526Monitoring). Insufficient logging and monitoring, coupled with missing or ineffective integration with incident response, allows attackers to further attack systems, maintain persistence, pivot to more systems, and tamper, extract, or destroy data. Most breach studies show time to detect a breach is over 200 days, typically detected by external parties rather than internal processes or monitoring.
11.  

---
**References**
* https://cwe.mitre.org/top25/archive/2020/2020_cwe_top25.html
* https://www.sans.org/top25-software-errors/
* https://owasp.org/www-project-top-ten/
