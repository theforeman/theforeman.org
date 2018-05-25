---
layout: privacy
title: Privacy Notice
---

# Foreman Privacy Policy

This document describes the data Foreman collects about you, why it is
collected, what is done with it, and your options for how it's processed.

The Foreman project does not share data with 3rd parties, except for hosting
requirements (e.g. GitHub, YouTube) as detailed below, or when required to by
law.

# Types of data we collect

* Contact details
  * Name
  * Email address
* Data that identifies you
  * IP addresses
  * Browser UserAgent strings
  * Debug archives
  * Answers to survey questions

# How and why we use your data

## The website

The Foreman website is a static site which does not track, collect, store
information or set cookies. There is no account for the website itself. The
webserver (Apache) logs will contain IP addresses, timestamps, and UserAgent
strings - these are log-rotated and deleted after 4 weeks.

The webserver logs are primarily used to produce aggregated statistics about
the community, such as popularity of different operating system packages,
plugins, etc.

* Legal basis for this data usage: Legitimate interest

The website does embed YouTube videos, see [YouTube's privacy policy][YouTube]
for details. These videos do not autoplay.

## Codebase

The Foreman community use [GitHub](https://github.com) to manage the code that
comprises the Foreman project. Refer to [GitHub's privacy policy][GitHub] for
details on how GitHub handles the data you posts there. We also use
non-identifiable data from the codebase to provide aggregated statistics such
as average time to merge, number of open pull requests, etc.

* Legal basis for this data usage: Legitimate interest

The Foreman community also run a bug tracker using the
[Redmine](http://www.redmine.org) software. When you sign up for a Redmine
account, you provide us with an email address and a name. We only use this
email within Redmine to contact you about bugs you have reported or subscribed
to. You have full control over what emails are sent from your Redmine account
preferences. The bug tracker also uses cookies to store your session.

We also use the bug tracker data to provide aggregated statistics such as
number of open/closed bugs, average time to close a bug, etc.

* Legal basis for this data usage: Legitimate interest, consent

## Communication

The Foreman project maintains two public IRC channels on
[Freenode](https://freenode.net), refer to [Freenode's privacy
policy][Freenode] for details on how they handle your data. In addition, our
*public* channels are logged to [BotBot.me](https://botbot.me) who also have a
[privacy policy][BotBot].

The Foreman community uses a forum using the [Discourse](https://discourse.org)
software. When signing up for a Discourse account, you provide a name and email
address - and in addition we store the IP address of your most recent
connection. The email address is only used to send you updates to your forum
topics, personal messages from other users, and digest summaries. You have full
control over the emails sent from your Discourse account preferences. The forum
also uses cookies to store your session.

We also use the IP addresses and *public* post data to provide aggregated
statistics about the forum community, such as posts-per-month, user engagement,
etc. We also use the IP addresses to help identify [sock
puppeting](https://en.wikipedia.org/wiki/Sockpuppet_(Internet)) and spam
accounts.

* Legal basis for this data usage: Legitimate interest, consent

## Surveys

The Foreman community runs a survey each year. Completing the survey is op-in,
and providing a contact email address in the survey is *optional*. Such
addresses are stored until the survey analysis is complete, and then deleted
from the raw survey data before publication. The survey data is used to gain
understanding of the community, and aggregated statistics based on the survey
results are published each year.

* Legal basis for this data usage: Legitimate interest, consent

## Foreman debug archives

The Foreman project provides a tool called [foreman-debug][foreman debug] which
collects logs from your Foreman server and uploads it to a secure location in
our infrastructure. Use of this tool is entirely voluntary (it is never run
automatically), and the data is used by our developers to assist users in
debugging complex problems. The data is not used for any analysis or
statistics, is only accessible to a small number of the Foreman developers, and
is deleted regularly.

* Legal basis for this data usage: Consent

# Your rights regarding your data

## Your choices

### You can choose not to provide us with personal data

Using a VPN, Tor, or other IP / UserAgent masking service will not affect your
use of the project website, as it is entirely static.

### Your accounts on our services

Your Redmine and Discourse accounts contain options to control what emails are
sent to you. 3rd party services such as [GitHub](https://github.com) retain
their own policies and privacy options.

## Your rights

Where the EU General Data Protection Regulation 2016/679 (“GDPR”) applies to
the processing of your personal data, especially when you access the website
from a country in the European Economic Area (“EEA”), you have the following
rights, subject to some limitations, against the Foreman Project:

* The right to access your personal data
* The right to rectify the personal data we hold about you
* The right to erase your personal data
* The right to restrict our use of your personal data
* The right to object to our use of your personal data
* The right to receive your personal data in a usable electronic format and transmit it to a third party (also known as the right of data portability)
* The right to lodge a complaint with your local data protection authority

If you would like to exercise any of these rights, you may do so by contacting
the Foreman Project on [IRC](/support.html#IRClivechat). Please understand,
however, the rights enumerated above are not absolute in all cases.

# Contacting us

If you have any questions about this policy or our use of your data, please
feel free to [contact us](privacy@community.theforeman.org) or on
[IRC](/support.html#IRClivechat).

# Changes to this Privacy Statement

Foreman reserves the right to update this policy from time to time. Material
changes will be posted to the [Announcements
list](https://community.theforeman.org/c/release-announcements) and posted to
the front page of the [website](https://theforeman.org). This policy was last
updated on 25th May 2018.

[BotBot]: https://botbot.me/privacy
[Freenode]: https://freenode.net/policies
[foreman debug]: https://github.com/theforeman/foreman/blob/develop/script/foreman-debug
[GitHub]: https://help.github.com/articles/global-privacy-practices
[YouTube]: https://support.google.com/youtube/answer/7671399?hl=en
