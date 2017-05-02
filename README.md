# The Election Project (Elep)

The Election Project (Elep) is the attempt to create a global nomenclature and modular system for elections. 
Tabular data or more specifically csv is its main exchange data format of choice.

## Slides
[Election Project Slides](https://www.slideshare.net/rogerfischer3990/election-project-elep)      
At [csv,conf,v3](https://csvconf.com/), Portland   

## Modules
- Election Results (ongoing, see the Minimal Set)
- Polling Stations
- Candidates
- Parties
- Vendors of Electronic Voting Hardware
- Local Color Schemes
- One Global Color Scheme 
- Positioning Compass 
- Maps (ongoing)

## File Prefixes and Conventions

### Names and File Prefixes
- RAW = the collected, untreated data
- EXT = the cleaned data, using the defined naming conventions
- DATA = mappable data; data is a merge of the REF coming from the MAP and the EXT
- DATAT = DATA with further transformations (e.g. candidate_pct)
- MAP = map as geojson or topojson 
- REF = The reference file contains ids and features of a map (e.g. county name)
- META = metadata about the other files

### Versions
If you have more than one EXT or DATA file, try to describe it.

### File Naming Conventions      
- EXT: what_where_boundary_date       
  e.g. EXT_president_alameda_precinct_20161123.csv               
       EXT_president_vbm_alameda_precinct_20161123.csv           

- REF: where_boundary_data          
  e.g. REF_alameda_precinct_20161102.csv       

## Process & Tools    
- RAW => EXT  (clean, wrangle)
- MAP + REF  
- EXT + REF => DATA (merge)
- DATA => DATAT (transform)

### Tools
[R Cheatsheet](https://github.com/datamapio/story/blob/master/cheatsheet/r_cheatsheet.md)               
[Tidyr vs Reshape2: wide to long format and vice versa](http://www.milanor.net/blog/reshape-data-r-tidyr-vs-reshape2/)


## Election Results and the Minimal Set
### The Minimal Set
[Minimal Set Definitions](https://medium.com/@datamapio/a-common-vocabulary-for-elections-608372f12f64)



## Candidates and Parties
### Candidates  
TO DEFINE           
One use of candidate information can be seen [here](https://elections.datamap.io/us/2016/primaries/states/california/democrats)                              
See [FEC Raw data](https://github.com/datamapio/elep/tree/master/us)              
### Parties
TO DEFINE     

## Color Schemes / Color Compass
![red-blue color compass](https://raw.githubusercontent.com/datamapio/elep/master/images/color_space_with_red_blue_brewer_scales.png)
![subjective color compass](https://raw.githubusercontent.com/datamapio/elep/master/images/color_square_version3.png)


## Positioning / Compass
x from -1 to 1, y from -1 to 1; increments of 0.1 or 0.2   
               
Example:
```
candidate, x, y, date
sanders, -0.8, 0.6, 20160620
```



See also:
[Vote Compass Methodology ](http://voxpoplabs.com/votecompass/methodology.pdf)





## Color

### Example: Map the Election Result (Domain) to Color (Range)

If you want to map the results in your csv on a map, you typically use a scale. 

Result = candidate / valid * 100     
Color = candidate color     

#### Result in Percentages (Domain)
Up to 40% | 40-45% | 45-50% | 50-55% | 55-60% | Over 60%
```
.domain([0,40,45,50,55,60,100]);
```
    
#### Color (Range)
```
.range(['#f3d7d0','#e3afa3','#d18978','#bc634f','#a53c28','#8b0000']);
```
Based on [Red Palette](https://gka.github.io/palettes/#colors=white,darkred|steps=7|bez=1|coL=1)


#### Domain to Range Mapping with scaleThreshold (d3.js)
```
var color = d3.scaleThreshold()
    .domain([0,40,45,50,55,60,100]);
    .range(['#f3d7d0','#e3afa3','#d18978','#bc634f','#a53c28','#8b0000']);
```



Note:       
[Threshold scales](https://github.com/d3/d3-scale/blob/master/README.md#threshold-scales) are similar to quantize scales, except they allow you to map arbitrary subsets of the domain to discrete values in the range. The input domain is still continuous, and divided into slices based on a set of threshold values. 

[Quantize/Threshold Choropleth](https://bl.ocks.org/mbostock/4060606)        
[Quantile Choropleth](https://bl.ocks.org/mbostock/8ca036b3505121279daf)




## What do we really want to know?
- What is the current political climate and why?
- Where do the candidates and parties stand?
- Do elections reflect the political climate accurately?
- How representative are elections?


## Going Further
- Sortition vs Election: [A Citizen Legislature](https://www.well.com/~mp/citleg.html) / [Against Elections](https://www.amazon.com/Against-Elections-David-Van-Reybrouck/dp/1847924220/)
- [Different Election Systems](http://ncase.me/ballot/)
- [Pattern of Democracy: Majoritarian vs Consensus Democracy](http://wikisum.com/w/Lijphart:_Patterns_of_democracy) 
              

[@datamapio](https://twitter.com/datamapio)


