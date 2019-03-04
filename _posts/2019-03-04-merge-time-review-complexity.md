---
layout: post
title: "Merge time vs Change complexity in Foreman Core"
author: "Greg Sutcliffe"
date: "4 March 2019"
tags:
  - foreman
  - data
  - process
  - community
---

In this post I'm going to dig into some of the data we have on GitHub about how
our community functions. In particular, I'm looking to investigate some of the
[issues raised on
Discourse](https://community.theforeman.org/t/improving-pr-merge-velocity/12992)
to help draw some conclusions about how to structure Foreman's code-and-review
processes.

<!-- more -->

# The Goal

Let's start with defining what we're going to look at. I'm going to focus on
Tomer's *8th* point:

> "Bigger changes are harder to review."

Review complexity is a hard thing to quantify, so the size of the change does
seem like a sensible proxy. Tomer then goes on to say:

> "A while ago I saw a talk by Greg Kroah-Hartman, where he mentioned that they
> usually don’t accept patches longer than about 100 line change into the
> stable kernel."

OK, so that gives us one thing to look at - the number of lines of changes.
However, I don't think that's the whole story. So I'm going to add a second
dimension:

> "The number of files touched also increases review complexity."

I think this stands to reason, in most cases - 100 changes in one files is
easier to review than 20 changes in 5 files, because you have more
inputs/outputs to track. That's not going to be 100% true (e.g. consider
re-factoring, where you make the *same* 20 line change 5 times...), but
overall, I think it's worth investigating.

# The Output

We need to think about how to investigate this. Getting data isn't hard -
GitHub has a solid API, we can grab all the PRs for a given time period, and
ask what the merge time is, the number of files touched, and the lines of
changes. We can define this:

* `merge time` = `date of merge` - `date of creation`
* `lines of change` = `lines added` + `lines removed`
* `files touched` = self-explanatory (I hope!)

How will we study this? A naive approach would be to take an average (probably
the [median](https://en.wikipedia.org/wiki/Median) or perhaps the [geometric
mean](https://en.wikipedia.org/wiki/Geometric_mean)), and this would be a good
first approximation. However, I feel it missed two things. Firstly, not all PRs
are merged. At any given time, some will still be open, and they should be
accounted for. Second, I think we're not so interested in the "50% line" that
averages would give us. I think it's far better to think about the classic
"80/20" rule we apply so often in development - we'd like 80% of our PRs to be
merged in good time. So that leads us to ask a question like this:

> "For a given amount of lines-of-change and files-touched, after what time do
> we have an 80% chance of the PR being merged?"

This is a well-specified quantitative question that we can answer. It leads us
to a technique known as [Survival
Analysis](https://en.wikipedia.org/wiki/Survival_analysis) which is ideal for
any time-to-event dataset, which is what we have here. Let's get to it!

# Exploration

First, a little house cleaning. We need to only use PRs from after 2016-10-01.
This is the date that GitHub added the "Rebase" and "Squash" options to the UI,
before which we can not reliably tell a merged PR from a closed one (as we used
to close and then merge on the cmdline). Obviously, that means we also want to
filter out things which are `state == closed` rather than `merged`, as that
means they weren't merged.

That still leaves 2235 PRs to study, which is plenty.

Let's take a look at the data, shall we? Since we're interested in 3 things
(LoC, files, and merge time) then we can do a nice scatter plot:

![Exploratory Scatter Plot](static/images/blog_images/2019-03-04-merge-time-review-complexity/scatter-1.png)<!-- -->

Hmm, some *really big* but also *very quick* PRs there. Possible outliers?

<table class="table table-bordered table-striped">
<caption>Outlier PRs</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> number </th>
   <th style="text-align:left;"> title </th>
   <th style="text-align:right;"> loc </th>
   <th style="text-align:right;"> changed_files </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 5016 </td>
   <td style="text-align:left;"> i18n - extracting new, pulling from tx </td>
   <td style="text-align:right;"> 21953 </td>
   <td style="text-align:right;"> 33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5431 </td>
   <td style="text-align:left;"> i18n - extracting new, pulling from tx </td>
   <td style="text-align:right;"> 18673 </td>
   <td style="text-align:right;"> 33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5291 </td>
   <td style="text-align:left;"> i18n - extracting new, pulling from tx </td>
   <td style="text-align:right;"> 8316 </td>
   <td style="text-align:right;"> 33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6056 </td>
   <td style="text-align:left;"> Fixes #16294 - Remove noVNC from vendors </td>
   <td style="text-align:right;"> 7694 </td>
   <td style="text-align:right;"> 25 </td>
  </tr>
</tbody>
</table>

Ah, i18n, of course. Definitely an outlier. Let's drop PRs matching `/^i18n/`
and look again...

![Cleaned Scatter Plot](static/images/blog_images/2019-03-04-merge-time-review-complexity/scatter-2.png)<!-- -->

Better, but wow, some patches really change a lot of files. Still, this seems
usable now, and we can sum up the dataset with a quick table:

<table class="table table-bordered table-striped">
<caption>PR breakdown: Lines of change vs. files touched</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> &lt;10 </th>
   <th style="text-align:right;"> 10-49 </th>
   <th style="text-align:right;"> &gt;50 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt;100 </td>
   <td style="text-align:right;"> 1827 </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 100-2999 </td>
   <td style="text-align:right;"> 170 </td>
   <td style="text-align:right;"> 163 </td>
   <td style="text-align:right;"> 28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &gt;3000 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
</tbody>
</table>

For Survival Analysis, it's helpful to pick some "typical values" to plot the
curves with. Looking at this table, it seems to me that we can pick 100 & 2000
lines of change to compare, and 1, 10 & 50 files changed. Note that this is
*just* for plotting - the statistical model considers the whole distribution of
values in each dimension that we ask it to consider.

# Lines of code only

Here's our first pair of survival curves:

![Lines of Code Analysis](static/images/blog_images/2019-03-04-merge-time-review-complexity/surv-loc-1.png)<!-- -->

How do we interpret this? Well, the y-axis shows us the probability of a PR
still being *open* after X time. Intuitively, all PRs start off with 100%
chance to be open when they are created. What we can see is that the red curve
(small changes) decreases far more rapidly than the blue curve. That's what we
expect - small changes are more likely to be merged quickly. (The shaded area
is the 95% confidence interval, which is larger for 2000 LoC as we have a
smaller dataset - the important point is the areas do not overlap).

If we return to the "80/20 rule", and ask what's the time at which a PR has an
80% chance of being merged, then we see a real difference - 25.56 days for
small changes, 142.07 days for large ones; nearly **6** times higher!

(For the real stats nerds, the actual model is a CoxPH model, which results in
a relative risk increase of 0.0335% per line of code added)

# Files touched

We can repeat this analysis for files touched:

![Files Changes Analysis](static/images/blog_images/2019-03-04-merge-time-review-complexity/surv-files-1.png)<!-- -->

The effect here is definitely smaller, so I've plotted three values for files,
just to illustrate. Overall, though, it's the same story - the 80% merge chance
here is at 20.36 days for 1 file vs 30.85 days for 10 files - a 50% increase.

# Putting it all together

Let's combine these models

![LoC and Files Analysis](static/images/blog_images/2019-03-04-merge-time-review-complexity/surv-both-1.png)<!-- -->

So this is really interesting! The lines are very close together for the
lines-of-code axis, so I've zoomed in a little (reducing both the x and y axis
ranges a little).

What we see is that *despite* the lines of code appearing to have the larger
impact when we studied it separately, the combined effect shows that number of
files is *far* more important (this is known as [Simpson's
paradox](https://en.wikipedia.org/wiki/Simpson%27s_paradox). Indeed, if we look
at the model, we can quantify *how much* we expect the merge time to increase
by, per line-of-change or file-touched:

<table class="table table-bordered table-striped">
<caption>Hazard increase per formula term (%)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Term </th>
   <th style="text-align:right;"> Coefficient </th>
   <th style="text-align:right;"> Confidence (upper) </th>
   <th style="text-align:right;"> Confidence (lower) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> loc </td>
   <td style="text-align:right;"> 0.0012857 </td>
   <td style="text-align:right;"> 0.0112858 </td>
   <td style="text-align:right;"> -0.0087154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> changed_files </td>
   <td style="text-align:right;"> 1.7208675 </td>
   <td style="text-align:right;"> 2.2305595 </td>
   <td style="text-align:right;"> 1.2085184 </td>
  </tr>
</tbody>
</table>

Here we see the confidence interval for the risk-increase per line of code, or
per file touched. Note that now, for this combined model, the LoC risk estimate
includes 0 - that is, it is no longer statistically significant. For files
though, it's pretty big - an increase of between 1.2% and 2.2% per file. 

# Conclusions

We asked two questions - does lines-of-change and files-touched affect the
merge time? Unquestionably, the answer is yes. But there's really two results
here.

Firstly, in terms of the overall dataset, the big win is keeping the *number of
files changed* to a minimum. Only when that has been satisfied, does the
*amount of changes* have an effect. I think that's a nice result, as it
*doesn't* suggest we should all go and break our PRs into 20 smaller PRs -
rather, that we should strive to make our changes *local* to the area of the
code we're working in.

What does this mean for Tomer's proposal? I think Foreman needs a culture
shift. It needs to be OK to merge something non-functional, so long as it's not
a breaking change, and for an accepted RFC. In this way, code can be reviewed
quicker and agreed on for a single part of the codebase (e.g. the
orchestration, for example) in order to keep the amount of changes and the
number of files touched to a minimum. Then a developer moves on to part N+1 of
the RFC, building on what was just merged. This *should* make the tasking of
reviewing PRs a lighter burden.

There's probably more we could study here. Merge time by Redmine category is an
obvious one, as is looking at other GitHub repos (perhaps `katello/katello`?).
Also adding in `closed` as an end-state and doing a "competing risk" model
could be fun. But that's for a future analysis - suggestions are welcome!

Thanks for reading! As this is my first post in my new role, I'm looking
forward to feedback on this :)
