---
title: "Ignore New Files in Link Checker"
tags: [programming, git]
---

# Ignore New Files in Link Checker

A challenge I ran into while developing a link checker was to know what files were created in a pull request. The documentation website included automatically generated edit links on each page, and those links would be invalid if a file didn't yet exist in GitHub, which they wouldn't if the pull request was creating them.  Described below is the solution I created. 


1. First, get a list of files added in the pull request.  The diff-filter says to only include **A**dded files and the HEAD~1 looks at 1 commit back. 
```bash
$ git diff --diff-filter=A HEAD~1 --name-only
topics/docs/installation/311-nodes.adoc
topics/docs/installation/add-redhat-registry.adoc
```
2. Add the base URL.
```
$cat testFile | awk -v s='https://github.com/Maistra/maistra.github.io/edit/maistra-1.2/' '{print s$1}' |  awk -v s='"' '{print s$1s}' | paste -s -d ','

https://github.com/Maistra/maistra.github.io/edit/maistra-1.2/topics/docs/installation/311-nodes.adoc","https://github.com/Maistra/maistra.github.io/edit/maistra-1.2/topics/docs/installation/add-redhat-registry.adoc","https://github.com/Maistra/maistra.github.io/edit/maistra-1.2/topics/docs/installation/_index.adoc"
```
3. Take multiple lines, surround with quotes, and comma separate. In this case, we wanted everything on the same line.
```
awk -v s='"' '{print s$1s}' testFile | paste -s -d ','
"http://www.google.com","http://www.yahoo.com","http://voo.com","https://github.com/Maistra/maistra.github.io/edit/maistra-1.2/topics/docs/troubleshooting"
```

This output could then be plugged into the HTML proofer link checker. 