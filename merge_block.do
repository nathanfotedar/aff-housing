clear
set more off

global laura "/Users/laurazhang/Documents/artificialecon"
global rawdata "${laura}/datasets"
global cleandata "${laura}/clean"

import delimited "${rawdata}/Jobs_Proximity_Index.csv", clear
drop *objectid
rename *pid BLOCKGROUPID
save "${cleandata}/jobsdata.dta", replace

import delimited "${rawdata}/School_Proficiency_Index.csv", clear
drop *objectid
rename *pid BLOCKGROUPID
save "${cleandata}/schooldata.dta", replace

import delimited "${rawdata}/Location_Affordability_Index_Data.csv", clear
rename blkgrp BLOCKGROUPID
drop if BLOCKGROUPID==.

merge 1:1 BLOCKGROUPID using "${cleandata}/jobsdata.dta", generate(merge1)
merge 1:1 BLOCKGROUPID using "${cleandata}/schooldata.dta", generate(merge2)

drop *objectid merge*
order BLOCK jobs schl

export delimited using "/Users/laurazhang/Documents/artificialecon/clean/block_merge.csv", replace
