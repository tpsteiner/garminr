Garmin Connect API wrapper
================
Thomas Steiner
2017-10-05

#### Motivation

tl;dr No R package for garmin connect web API; first R package

Having strong physical and mental health is very important to me. So much so that I bought one of those fancy smart watches from Garmin (Vivoactive 3) to start collecting health data.

I was severely disappointed to find that the data is not easily exportable (by Garmin and competitors). Garmin has a readily accessibly link to all users that provides summary statistics for past activities.

Not cool. Where is my second-by-second data? I didn't go through a MS in Data Analytics to use summary statistics.

There are two ways to get the more extensive data:

1.  Extract .FIT files from the device via USB
2.  Use the Garmin Connect API

Extracting .FIT files from the device is the simple option, but it has a few problems.

-   Requires me to plug the device in to extract files
-   The watch has 8MB of storage (WTF!?) so old activities will get automatically deleted to free up space

Option 2 is the harder, but safer choice. The data from my watch is automatically stored permanently in Garmin's servers, accessible by their web API.

Watch -&gt; phone (Connect App) -&gt; Garmin servers -&gt; API request -&gt; local storage

Quick rant: What the hell was Garmin thinking with their API!? Instead of using a standard token system, they make users log into their Garmin Connect accounts to use it.

My goal is to have a single package in R that downloads the data and returns a data frame. The process should look something like this:

    library(garminr)

    df <- garmin_download(type = "Activity")

As aids in my research, I have used a python 2.7 script that [downloads all user activities in XML format](https://github.com/magsol/garmin/blob/master/download.py), and the [tapiriik.com](tapiriik.com) python code for [connecting to the Garmin website](https://github.com/cpfair/tapiriik/blob/master/tapiriik/services/GarminConnect/garminconnect.py). Many thanks to the users who made these scripts available. I would have quit without them.
