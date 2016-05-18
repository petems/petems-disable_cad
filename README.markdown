#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with disable_cad](#setup)
    * [What disable_cad affects](#what-disable_cad-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A module to disable Ctrl+Alt+Delete.

## Module Description

Ctrl+Alt+Delete on a Linux machine can be suprising, in the worst kind of way.

This thread from Serverfault explains it well:

> In the years since, most of my systems have been deployed headless or are running as virtual machines. This has reduced the frequency of unintended reboots... however, I've had a recent set of ctrl-alt-delete oopses from:

> 1). an IP KVM plugged into the wrong server by datacenter staff.
> 2). a Windows admin using the key combination in a VMware console, thinking it was needed for logon.
> 3). me using the ctrl-alt-delete macro in an HP ILO console to reboot a live CD... but it was actually > the ILO for a very busy production server.

> If you have ILO/IPMI/... It makes absolute sense [to disable CAD]. The only reason for CTRLALTDEL was a magic trap when nothing else would interrupt. With a control card, you don't need that - you can reset the machine anyway. Needless to say, if the machine behaves correctly, you can always 'reboot'/'shutdown -r now'/'init 6'/'systemctl reboot' from console or gui.

> - http://serverfault.com/questions/614051/isnt-ctrl-alt-delete-on-linux-really-dangerous

Also, it's force of habit for a lot of Windows users to press Ctrl+Alt+Delete as they walk away from their workstations to lock it. Doing that whilst in the console for a server could be devastating.

So it's often part of a base build or hardening to disable the Ctrl+Alt+Delete function on a Linux server.

## Setup

### What disable_cad affects

* Depending on the system, disables Ctrl+Alt+Delete in the inittab, the init file or with systemd.

## Usage

`include ::disable_cad`

## Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

## Limitations

* Currently only supports RHEL and CentOS
