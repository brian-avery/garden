---
title: "Supply Chain"
tags: [security, supply chain, programming]
stage: budding
---
>  Part of the mindset of bringing in thirdparty code is the idea that it has already been tested for quality and security by someone else. This might or might not be true, but it’s still your name on the box, no matter what fails inside. [^1]

Modern software packages are built as a set of components that are all bundled together. A web browser might have the JavaScript runtime, the HTML parser, an image library, a GUI toolkit, and a range of other components. In many cases, the group writing the software relies on components written by other people in order to fulfill certain requirements. When these components are considered, many things need to be taken into account: security of the dependency, how it's maintained, what it's licensing model is, etc. The **supply chain** is the way that we integrate all of this together. 

## Licensing

Licenses often have specific requirements. For instance, the GPL can require you to publish the source for your entire product [^2]. These can impact the surrounding software and how you can legally use them. In addition, some licenses are [incompatible](https://en.wikipedia.org/wiki/License_compatibility#CDDL_and_GPL) with each other and cannot be used together. Failure to abide by the license requirements can lead to bad PR and being sued.

* Strong copyleft
* Weak copyleft
* Permissive

## Export Restrictions
In some cases, the inclusion of dependencies can cause export issues[^3].

## Security
### Software Bill of Materials



***
_References_

[^1]: http://go.coverity.com/rs/157-LQW-289/images/FY16%20SIG%20TC%20WP%20Letter%20Don't%20Let%20Bad%20Apples%20Ruin%20Your%20Pie%201.3.pdf
[^2]: https://www.linuxjournal.com/content/cisco-settles-where-here
[^3]: https://www.eff.org/deeplinks/2019/08/us-export-controls-and-published-encryption-source-code-explained

