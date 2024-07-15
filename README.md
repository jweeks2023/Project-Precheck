# ⚠️ ARCHIVED REPO ⚠️ See version in csci-1301 organization
# Project-Precheck
A simple makefile to bulk check C# files for issues

## Requirements
- Make
- Dotnet SDK

## How to run
Run `make` to see list of commands:
- `out`: outputs results of precheck to csv file
- `print-all`: prints results of all projects to screen
- `print zip=[ZIP_DIR]`: prints results of specified project

## Specification

### Problem Description
Both UCAs and instructors alike spend a lot of time sifting through project submissions, and a lot of time is wasted downloading, unzipping, and opening projects that cannot be compiled or do not have all the required files to run everything. If we can automate at least some of these components to bulk-evaluate projects for the ability to compile, then that would save a ton of time across the entire semester for everyone who has to grade. 

### Solution
As one popular Python textbook states, "automate the boring stuff!" Essentially the goal is to make a program that...

1. Automatically pulls all the submissions for a specific project from D2L (see [Pulling Projects From D2L](#pulling-projects-from-d2l)),
2. Checks all the projects if it compiles and has all the required files (see [Project Prechecking](#project-prechecking)),
3. Outputs the results to our project grading workbook (see [Export to Workbook](#export-to-workbook)).

With this program, we can systematically validate all the project submissions much quicker than if we were to do it by hand, which will allow us to give feedback to students quicker and lessen the load on graders for churning through submissions.

#### Pulling Projects From D2L 
[Andrew Sanders](https://github.com/andrew101sanders) has already created [a python script to automatically pull submissions from D2L](https://github.com/andrew101sanders/CSCI-Data-Collection-Scripts) and has given us permission to use and modify this as needed for this project. It is currently out of date and will likely need to be configured to fit our use case, but this is a big head start in that front.

#### Project Prechecking
This is currently being handled by [my makefile](https://github.com/jweeks2023/Project-Precheck/blob/main/makefile), which systematically checks every zip file in the directory it's put in, unzips it, and builds it to see which ones build successfully. Development on this is still ongoing to expand compatibility for all kinds of project files. but is the simplest of the 3 steps.

#### Export to Workbook
This is also currently being handled by my makefile, and is currently done by exporting to a CSV file that simply states the project name and if the build passed or failed. This could suffice with a bit of end work on the user to copy/paste to the workbook, but ideally we could output directly to the workbook to automate that as well.
