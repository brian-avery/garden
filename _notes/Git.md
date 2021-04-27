---
title: "Git"
tags: [programming, git]
stage: budding
---

[[Ignore new files in Git]]

## Reset file to remote
This allows you to discard all local changes for a file and instead just use the remote. 

```
git checkout origin/master -- path/to/file

```

## Clone repo with all history 
If a force push happens and the Git history is lost, the following command can be used to create an `unshallow` clone. This will then allow SHAs from, for example, a GitHub pull request, that no longer exist in the tree to be checked out. 

```
git fetch --unshallow
```

You may also be able to use

```
git fetch --shallow-since=15/11/2012
```
