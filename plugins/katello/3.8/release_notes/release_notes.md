---
layout: plugins/katello/documentation
title: Release Notes
version: 3.8
---

# Katello 3.8 (Stout) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.8/CHANGELOG.md).

## Features

#### Satellite QE 
Several robottelo tests have been added by Satellite QE team

#### Content Views
It is now possible to change the description of a content view version

#### Environments
It is now possible to add new environments in between an environment path

## Bug Fixes

Several bug fixes around Errata Management, Repositories, Docker, and more are part of this release. Please refer to the [changelog](https://github.com/Katello/katello/blob/KATELLO-3.8/CHANGELOG.md) for more details.

## Client package changes
- katello-agent/goferd is now optional, only used for remote exec.
- katello-host-tools is required for package upload/errata status.
- katello-host-tools-tracer required for traces management, must be installed AFTER updating katello-host-tools.

## Contributors
- agrawal
- Adam Ruzicka
- Andrew Kofink
- Bernhard Suttner
- Bryan Kearney
- Chris Duryee
- Chris Hale
- Christine Fouant
- Daniel Lobato Garcia
- Dan Seethaler
- Dmitri Dolguikh
- Eric D. Helms
- Evgeni Golov
- Ido Kanner
- Ivan Nečas
- John Mitsch
- Jonathon Turel
- Justin Sherrill
- kgaikwad
- ldjebran
- Lukas Zapletal
- Marek Hulan
- Masatake YAMATO
- Matthias Dellweg
- Michael Johnson
- Michael Moll
- Ondrej Prazak
- Partha Aji
- Paul Donohue
- Quirin Pamp
- Ranjan Kumar
- Samir Jha
- Sean O'Keeffe
- Sebastian Gräßl
- Shimon Shtein
- Stephen Benjamin
- Tomas Strachota
- Tom McKay
- Walden Raines
- Zach Huntington-Meath
