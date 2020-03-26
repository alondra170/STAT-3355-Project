# STAT-3355-Project

------------------------------------------------------------------------------------------------------------------------------------------
ALONDRA:
The clean_data(2) is the version with all the officer positions. 

NOTE: when I was researching how to do this I realized there are a lot of overlapping titles for officers. The methodology behind how I did everything was to just use the titles of the highest position they held so we wouldn't have like 200 different labels to deal with.
- For example there are Detective Lieutenants, but the Lieutenant portion of their position is higher than just Detective so Detective   Lieutenants have their position labeled as Lieutenant. 
- Likewise for Chief Detectives they are labelled as just detectives for the reason stated above
------------------------------------------------------------------------------------------------------------------------------------------
3/25/2020
I added 3 new .csv files
- police.deaths: it's just the csv file that's the results of the cleaned data set
- deaths.states: only shows death information for U.S. states and other special areas within the country (e.g. Washington DC)
- deaths.territories: only shows death information for U.S. territories/not officially in country (e.g. tribal land, US Virgin Islands)
