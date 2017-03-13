+++
date = ""
highlight = true
math = false
external_link = "https://github.com/michaelnetbiz/red_ga"
tags = ["angular-js", "flask", "google-analytics","postgres", "redcap"]
title = "REDCap and Google Analytics Integration"
summary = "Contribution to the ongoing Michigan Stroke Transitions Trial (MISTT) project, which includes collaborators from Michigan State's Department of Epidemiology, School of Social Work, Department of Media and Information, and Usability/Accessibility Research and Consulting."
+++

## Problem
The Project team needed a way to integrate their analysis of conventional survey data, participant interviews, social worker case notes, and Google Analytics session data on participants' use of the Project's Virtual Stroke Support Portal (VSSP).

## Solution
Working on a team of Media and Information master's students during the Fall of Academic Year 2016-2017, I developed the server-side and client-side systems for this proof-of-concept web application. The application was designed to support MISTT Project data analysis, and was implemented as a Flask web application that accepted, cleaned, and persisted .csv uploads to a database. These uploads were export of varying types (e.g., closeouts, interactions, biopsychosocial assessments, inter alia) from the Project's REDCap instance. Juxtaposing uploaded data with data from Google Analytics (accessed through the debrouwere/google-analytics Python facility), data relevant to each case identifier were subsequently presented to the user via Angular.js controllers.

At the beginning of this semester I was asked by the MISTT Project team to consult on the project for further development. This consists in implementing unit tests, documenting the deliverable more comprehensively, with the Sphinx documentation library, and improving the health informatics application's ability to model Goals and Goal Types from uploaded data.

## [Source and Documentation](https://github.com/michaelnetbiz/mistt-solution)

## [Demo](http://mistt-solution.herokuapp.com)

## Other Assets
