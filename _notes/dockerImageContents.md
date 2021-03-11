---
---

# Viewing Docker Image Contents

Sometimes, it's helpful to view the contents of a [[docker]] container. For instance, if you need to check the versions of libraries within a container. If the container is based off of something like Ubuntu, you can use a bash shell to see container contents. However, if the image is more minimal, this may not be possible. 

When this is not possible, there are a couple of tools available. 

## Dive
Dive is a tool that allows you to inspect the contents of an image using a command line file-manager-like interface. Using it, you can swap between panes, see the layer that added a file, and navigate the filesystem.

![[Pasted image 20210302162605.png]]

## Skopeo
Skopeo takes a different approach. Using Skopeo, you can download an image as a tar file, and extract the layers individually to see their contents. In my experience, Dive is the better tool.

***
_References_

* [Dive](https://github.com/wagoodman/dive)
* [Skopeo](https://github.com/containers/skopeo)