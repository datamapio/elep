# The Election Project (Elep)

The Election Project (Elep) is the attempt to create a global nomenclature and modular system for elections. 
Tabular data or more specifically csv is its main exchange data format of choice.

## Modules
- Election Results (csv)
- Candidates
- Parties
- Vendors of Electronic Voting Hardware
- Local Color Schemes
- One Global Color Scheme 
- Positioning Compass 
- Polling Stations
- Maps

## File Prefixes and Conventions
- RAW = the collected, untreated data
- EXT = the cleaned data, using the defined naming conventions
- DATA = mappable data; data is a merge of the REF coming from the MAP and the EXT
- REF = The reference file contains ids and features of a map (e.g. county name)
- META = metadata about the other files

### Process:        
- Raw > Ext  (tidy)
- Map + Ref  
- Ext + Ref = Data (merge)
- Data > Data (transform)

### File Naming Conventions
- EXT: what_where_boundary_date, e.g. EXT_presidential_alameda_precinct_20161123.csv
- REF: where_boundary_data, e.g. REF_alameda_precinct_20161102.csv

## Election Results and the Minimal Set
### From RAW to EXT

### DATA: From Votes to Percentages


## Candidates and Parties
### Candidates
TO DO            
One use of candidate information can be seen [here](https://elections.datamap.io/us/2016/primaries/states/california/democrats)                              
See [FEC Raw data](https://github.com/datamapio/elep/tree/master/us)              
### Parties








## Color

### Example: Map the Election Result (Domain) to Color (Range)

If you want to map the results in your csv on a map, you typically use a scale. 

Result = candidate / valid * 100     
Color = candidate color     

#### Result in Percentages (Domain)
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



PS:
[Threshold scales](https://github.com/d3/d3-scale/blob/master/README.md#threshold-scales) are similar to quantize scales, except they allow you to map arbitrary subsets of the domain to discrete values in the range. The input domain is still continuous, and divided into slices based on a set of threshold values. 

[Quantize/Threshold Choropleth](https://bl.ocks.org/mbostock/4060606)        
[Quantile Choropleth](https://bl.ocks.org/mbostock/8ca036b3505121279daf)



## What do we really want to know?
- What is the current political climate and why?
- Where do the candidates and parties stand?
- Do elections reflect the political climate accurately?
- How representative are elections?

              

[@datamapio](https://twitter.com/datamapio)


