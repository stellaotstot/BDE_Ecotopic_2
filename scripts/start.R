### Load in Data

library(sf)
library(tmap)
# Read in bird data from Nevada and Arizona 

# Read in lake mead water level data
water_elevation <- read.csv("data/lake_mead_water_elevation.csv")
head(water_elevation)
#filter or combine average for fall/spring

# Read in shape file for study location (around lake mead) (Q: can we download individual data points rather than shape file)
lake_mead_shape <- st_read("data/lake_tracts/lake_tracts.shp")
sf::sf_use_s2(FALSE) #solving spherical geom problem
mega_lake <- st_union(lake_mead_shape) #dissolving polygon borders into one mega polygon
mini_lakes <- st_cast(mega_lake, "POLYGON") #splits up multi-polygon into individual polygons
lake_mead <- mini_lakes[2, ] #keep specific lake mead polygon (row 2, all columns)
tm_shape(lake_mead) + tm_polygons() 

#yadda 