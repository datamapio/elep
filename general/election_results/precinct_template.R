## Base Election Template
## ======================
##
## DATA always starts with:
## id = GeoID; put it first in R: DATA %>% select(id, everything())


## Think about consolidated precint maps, e.g. Alameda

## ELEMENTS
## ========
## precinct_id        =>  e.g. 0750876000001
## precinct_name      =>  (optional) => e.g. Blackman Charter Township, Precinct 1
## precinct_split_id  =>  (optional) possible subprecincts
## precinct_split_name
##
## registered           =>  natural number incl. 0
## ballots_cast         =>  natural number incl. 0
## turnout              =>  in %, rounded on 2 decimals, from 1.00 to 100.00 e.g "45.22". Do not use the %, just the number
## valid                =>  same as total votes, votes of all candidates and write-ins 
##                          If available take the number, it should be the same as all candidates and official write-ins, without under- and overvotes
##
## candidate1           =>  use last name or last name and first name first letter; this is the total of vbm, elecday, early (and absentee). 
##                          candidate1 = candidate1_elecday + candidate1_vbm + candidate1_early + candidate1_absentee
## writein
##
## residual             =>  ballots_cast - valid
## overvote
## undervote
##
## valid_elecday        =>  Election Day: all candidates and write-ins
## candidate1_elecday   =>  Vote on Election Day, 
## valid_vbm            =>  Vote by mail: all candidates and write-ins
## candidate1_vbm       =>  Vote by mail
## valid_early          =>  Early Voting: all candidates and write-ins
## candidate1_early     =>  Vote Early
## valid_absentee       =>  Absentee: all candidates and write-ins
## candidate1_absentee  =>  Absentee Voting (check if it is not Early Voting)

## status               =>  (optional) 1 = fully reported, O = not reported, number between 0 and 1 = pct reported
## update_date          =>  (optional) date and time of last update, transform into UNIX Timestamp or add Timezone?
## utc                  =>  (optional) timezone in UTC, e.g. for EST, Eastern Standard Time = -5


## EXT BASE = EXT WIDE, IDEAL FOR VIZ
## ==================================

## CASE A: only totals are available
## precinct_id | precinct_name | registered | ballots_cast | turnout | valid | clinton | trump | 
## 1001        | precint 1001  |        100 |           80 |   80.00 |    70 |      35 |    35 |       
## 1002        | precint 1002  |        200 |          160 |   80.00 |   150 |      80 |    70 |          
##
## CASE B: totals and subtotals are available (elecday, vbm, early, absentee)
## precinct_id | precinct_name | registered | ballots_cast | turnout | valid | clinton | clinton_elecday | clinton_vbm | clinton_early |
## 1001        | precint 1001  |        100 |           80 |   80.00 |    70 |      35 |              25 |           5 |             5 |
## 1002        | precint 1002  |        200 |          160 |   80.00 |   150 |      80 |              50 |          20 |            10 |


## EXT LONG OR EXT TIDY
## ====================
## Use tidyr or reshape to go from wide to long and vice versa
##
##  CASE A
##  precinct_id | precinct_name | registered | ballots_cast | turnout | valid | candidate | votes |   
##  1001        | precint 1001  |        100 |           80 |   80.00 |    70 |   clinton |    35 |        
##  1002        | precint 1002  |        200 |          160 |   80.00 |   150 |   clinton |    80 |   
##
##  CASE B
##  precinct_id | precinct_name | registered | ballots_cast | turnout | valid | candidate | votes |   type  | 
##  1001        | precint 1001  |        100 |           80 |   80.00 |    70 |   clinton |    35 |    all  |     
##  1001        | precint 1001  |        100 |           80 |   80.00 |    70 |   clinton |     5 |    vbm  |      
##  1001        | precint 1001  |        100 |           80 |   80.00 |    70 |   clinton |     5 |   early |  
##  1001        | precint 1001  |        100 |           80 |   80.00 |    70 |   clinton |    25 | elecday |  
##  1002        | precint 1002  |        200 |          160 |   80.00 |   150 |   clinton |    80 |    all  |     
##  1002        | precint 1002  |        200 |          160 |   80.00 |   150 |   clinton |    20 |    vbm  |      
##  1002        | precint 1002  |        200 |          160 |   80.00 |   150 |   clinton |    10 |   early |  
##  1002        | precint 1002  |        200 |          160 |   80.00 |   150 |   clinton |    50 | elecday |  


## EXAMPLE WIDE, IDEAL FOR DATAMAP
## ===============================
## ext_wide <- ext_base 
## head(ext_wide)

## precinct_id                             precinct_name  registered ballots_cast turnout valid clinton johnson stein trump castle soltysik fox
## 1 0750876000001 Blackman Charter Township, Precinct 1        2534         1146   45.22  1139     496      59    13   556      5        3   0
## 2 0750876000002 Blackman Charter Township, Precinct 2        3008         1977   65.72  1961     712      73    17  1135      8        0   0
## 3 0750876000003 Blackman Charter Township, Precinct 3        2946         1849   62.76  1825     686      74    17  1027      9        0   0
## 4 0750876000004 Blackman Charter Township, Precinct 4        2928         1541   52.63  1536     691      65    22   741     10        0   0
## 5 0750876000005 Blackman Charter Township, Precinct 5        2357         1198   50.83  1189     518      42    16   599      7        0   0
## 6 0754142001001   City of Jackson, Ward 1, Precinct 1        1650          763   46.24   758     508      32     9   197      5        1   0
##   hartnell hoefling kotlikoff mcmullin maturen   moorehead   writein
## 1        0        0         0        0       0           0         7
## 2        0        0         0        0       0           0        16
## 3        0        0         0        4       0           0         8
## 4        0        0         0        2       0           0         5
## 5        0        0         0        0       0           0         7
## 6        0        0         0        1       0           0         5

library(tidyr)
ext_long <- gather(ext_wide,  candidate, votes, clinton:writein) 

## > head(ext_long, 100)
##       precinct_id                           precinct_name  registered ballots_cast turnout valid candidate votes
## 1   0750876000001   Blackman Charter Township, Precinct 1        2534         1146   45.22  1139   clinton   496
## 2   0750876000002   Blackman Charter Township, Precinct 2        3008         1977   65.72  1961   clinton   712
## 3   0750876000003   Blackman Charter Township, Precinct 3        2946         1849   62.76  1825   clinton   686
## 4   0750876000004   Blackman Charter Township, Precinct 4        2928         1541   52.63  1536   clinton   691
## 5   0750876000005   Blackman Charter Township, Precinct 5        2357         1198   50.83  1189   clinton   518
## 6   0754142001001     City of Jackson, Ward 1, Precinct 1        1650          763   46.24   758   clinton   508
