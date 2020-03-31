# STAT-3355-Project

------------------------------------------------------------------------------------------------------------------------------------------
ALONDRA:
The clean_data(2) is the version with all the officer positions. 

NOTE: when I was researching how to do this I realized there are a lot of overlapping titles for officers. The methodology behind how I did everything was to just use the titles of the highest position they held so we wouldn't have like 200 different labels to deal with.
- For example there are Detective Lieutenants, but the Lieutenant portion of their position is higher than just Detective so Detective   Lieutenants have their position labeled as Lieutenant. 
- Likewise for Chief Detectives they are labelled as just detectives for the reason stated above
------------------------------------------------------------------------------------------------------------------------------------------
TO DO LIST
- create a new csv. file that contains all the cleaned data - NC
- related to the above, make sure all the U.S. territories are excluded - C
------------------------------------------------------------------------------------------------------------------------------------------
3/31/2020
I added 2 new folder
1) Overall Death Trends
- This folder contains the code I used to create the plot contained within the folder. It shows the overall trend of deaths by state over 3 centuries (19th, 20th, and 21st)

2) Death by Location and Method
- This folder contains the code and plot that show comparative plots regarding different manners of death (gunfire, automobile accident, heart attack, and vehicle pursuit) over 2 centuries (20th, and 21st)
- the reason I chose these particular manners of death was because their frequency throughout the overall original dataset was high and they were also all quite different from each other. I avoided using redunant methods like automobile vs motorcycle accidents since they fall in the overall realm of vehicle accidents
- I chose the 20th and 21st century because there was a lot of change that happened historically in that time frame, so I suspected that the results should show and be indicative of the changes the U.S. experienced over time
