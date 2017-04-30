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

## RAW, EXT, DATA
- RAW = the collected, untreated data
- EXT = the cleaned data, using the defined naming conventions
- DATA = mappable data

### Election Results and the Minimal Set





### Map the Election Result (Domain) to Color (Range)

Result = candidate / valid * 100     
Color = candidate color     
    
#### Range Example (Colors)
```
.range(['#f3d7d0','#e3afa3','#d18978','#bc634f','#a53c28','#8b0000']);
```
Based on [Red Palette](https://gka.github.io/palettes/#colors=white,darkred|steps=7|bez=1|coL=1)

#### Domain Example (Percentages) 
```
.domain([0,40,45,50,55,60,100]);
```
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



