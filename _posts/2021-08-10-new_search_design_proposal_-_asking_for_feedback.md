---
layout: post
title: New search design proposal - asking for feedback
date: 2021-08-16
author: Maria Svirikova
tags:
  - UX
  - Design
  - Search
  - foreman
  - community
  - katello
---

Recent Visual refreshment initiative - an ongoing effort to upgrade Foreman to better UX with PF4 react - drives a redesign of multiple commonly used components of Foreman such as navigation, buttons, modals. One of its goals for the upcoming release is to introduce a new consistent user-friendly search.

<!--more-->

## **Solution proposal**

During our research a new visual PF4’s component “search input” was introduced. Unfortunately, even its “advanced search” variation provides unsatisfactory complexity of input queries using just a limited number of operators. We settled on the similar visual style to promote consistency with other products.

#### Introducing 3 search types to be used in Foreman:

#### Plain

![](/static/images/blog_images/2021-08-16-new_search_design_proposal-asking_for_feedback/2021-08-16-plain_search.png)

#### Basic with a bookmark

![](/static/images/blog_images/2021-08-16-new_search_design_proposal-asking_for_feedback/2021-08-16-search1.png)

#### Combination with filter(s)

![](/static/images/blog_images/2021-08-16-new_search_design_proposal-asking_for_feedback/2021-08-16-combination_search_input_and_filter.png)

### **Visual part**

It's similar to PF4’s basic search input.
Main elements within a search input field are:

- **Magnifying glass** on the left side
- **Placeholder** (dependent on a content pf the page e.g. Search hosts)
- **Deletion X** appears upon interaction with a search input inside the field

### **Functionalities**

- **Search triggers** - Enter/ Autosearch upon inactivity (possibility to switch on/off or alternate frequency in settings)
- **Complex queries (with multiple operators)**
- **Fulltext search** - for names / descriptions / messages (no need to add query format Name = maria)
- **Autocomplete**
- **Bookmarks** - it’s possible to bookmark a search query that was created also with an additional filter. This will be stored and restored in the form of a search query)
- **Deletion** with X inside the search input or filter chip
- **Chip creation** - at the end of the search, to better communicate selected values (results in a better control over the search query - no need to scroll right/left within the small search input component) For extremely long queries, chip truncation is an option.

[See interactive design here](https://marvelapp.com/prototype/676i0cf/screen/81174843 "Designs")

Proposed designs are based on the research driven by the Visual refreshment initiative. Our research examined visual aspects and capabilities of search options within Foreman, focusing primarily on search inputs. We mapped all search input types and filter combinations within Foreman, analyzed and categorized the gathered data and formed requirements to help us design a better search.

### **Requirements**

1.  Share the visual style with other PF4 components and search inputs within other RH products to enhance consistency across pages and products.
2.  Use the same functionalities as the current search input (support complex queries with multiple operators, bookmarks, autocomplete).
3.  Unify search inputs, filters, and their usage to improve intuitiveness and expected behaviour.

## **Tell us what you think**

These designs were discussed just with a small number of users, therefore we would like to invite you to share your opinions with us. You could either [fill out a short questionnaire](https://docs.google.com/forms/d/e/1FAIpQLSd_sx4AQquUKTKQnJZIHU00ZAySRnBj7-4pExcuRCcblZ0h7A/viewform "Questionnaire"), leave a comment under the article, or drop me a message.

This is just a design proposal, which may not be implemented exactly in this way. Recently, PF4 has been looking at our requirements and working on their own solution (not very different from proposed one here).
