# Vagrant Development Environment

## Intro
This is meant for a quick Deve environment for Java, Scala with Spark etc.
Note that this will be doing a lot of Downloads so if you don't have a fast internet connection this will take a while and will look like it's hanging because I can't be bothered to do some sort of progress indicaiton

## Requirements
Installed Oracle VBox on Host system
Oracle VM VirtualBox Extension Pack
vagrant

## Includes

### OS
Fedora 27

### VCS
Git

### Runtime
Oracle JDK
Anaconda Python 3.6

### Buildtools
SBT, Scala with ensime plugin installed for SBT
Gradle
Maven

### Shell setup
ohmyzsh as standard shell
terminator

### Browser
vivaldi

### Cluster computing
spark

### Dev tools (IDEs etc)
intellij installer. you'll need to do the install yourself, no silent mode sadly
ammonite
emacs

### Provisioning
ansible

## Usage
Check the vagrantfile and adjust RAM usage.

Due to license reason I cannot upload the jdk executable. download the version you want, drop it in the installer folder and adjust the bootstrap.sh

1. mkdir installers
2. download jdk rpm and adjust bootstrap.sh accordingly
3. vagrant up

vagrant up

You might want to modify
.zshrc to include path variables to anything you want. Also don't forget to enable modules there if you install any additionally
.init.el for your emacs needs
bootstrap.sh to update versions of software as needed and install new ones

I have made the expirience that the VM hangs hard or flickers after provisioning you might need to reboot it. 

Note that files like .zshrc and .init.el are without preceeding '.' in the repo. it seems to screw with vagrant foldersyncing at least on windows hosts.
