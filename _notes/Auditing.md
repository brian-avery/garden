---
title: "Auditing"
keywords:
---

The creation of well-defined log entries that track:

* who made the request?
* when did they make the request?
* what did they access?

This may optionally also record whether the operations were correct and authorized. This is useful for analyzing the history of actions in security operations and incident response.


## _Never_ record -- debug shouldn't be able to record these either!
* Personally identifiable information (PII) in plain text
* Sensitive content that's part of API or function calls
* Cleartext versions of content that would otherwise be encrypted
* Cryptographic secrets

***
## References:
* Tarandach, I., & Coles, M. J. (2020). _Threat Modeling: A Practical Guide for Development Teams_ (1st ed.). O’Reilly Media.

