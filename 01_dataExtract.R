install.packages("rjson", repos='http://cran.us.r-project.org')
library("rjson")




dir.create("data")

### MISE EN FORME DES DATA

#censusBlock
print("-----------------------------")
print("----Extract census blocks----")
print("-----------------------------")
extractDataCB <- function(file){
  x <- list(id=file$properties$bctcb2010, name=file$properties$boro_name, geometry=file$geometry)
}
geojson <- fromJSON(file="https://data.cityofnewyork.us/api/geospatial/v2h8-6mxf?method=export&format=GeoJSON")
geojson <- geojson$features
geojson <- lapply(geojson, extractDataCB)
cb <- toJSON(geojson)
write(x=cb, file = "data/censusBlocks.geojson")
rm(cb, extractDataCB, geojson)

#censusTracts
print("-----------------------------")
print("----Extract census tracts----")
print("-----------------------------")
extractDataCT <- function(file){
  x <- list(id=file$properties$boro_ct2010, name=file$properties$boro_name, geometry=file$geometry)
}
geojson <- fromJSON(file="https://data.cityofnewyork.us/api/geospatial/fxpq-c8ku?method=export&format=GeoJSON")
geojson <- geojson$features
geojson <- lapply(geojson, extractDataCT)
ct <- toJSON(geojson)
write(x=ct, file = "data/censusTracts.geojson")
rm(ct, extractDataCT, geojson)


#subwaysStations
print("--------------------------------")
print("----Extract subways stations----")
print("--------------------------------")
extractDataSubwaysStations <- function(file){
  x <- list(id= file$properties$objectid, name=file$properties$name, lines = file$properties$line, geometry=file$geometry)
}
geojson <- fromJSON(file="https://data.cityofnewyork.us/api/geospatial/arq3-7z49?method=export&format=GeoJSON")
geojson <- geojson$features
geojson <- lapply(geojson, extractDataSubwaysStations)
subways <- toJSON(geojson)
write(x=subways, file = "data/subways.geojson")
rm(subways, extractDataSubwaysStations)
head(geojson)


#theaters
print("------------------------")
print("----Extract theaters----")
print("------------------------")
extractDataTheaters <- function(file){
  x <- list(name=file$properties$name, address= file$properties$address1, geometry=file$geometry)
}
geojson <- fromJSON(file="https://data.cityofnewyork.us/api/geospatial/kdu2-865w?method=export&format=GeoJSON")
geojson <- geojson$features
geojson <- lapply(geojson, extractDataTheaters)
theaters <- toJSON(geojson)
write(x=theaters, file = "data/theaters.geojson")
rm(theaters, extractDataTheaters)



print("----------------------")
print("----Extract parks2----")
print("----------------------")
extractDataParks2 <- function(file){
  x <- list(id= file$properties$gispropnum, name=file$properties$signname, acres= file$properties$acres, geometry=file$geometry)
}
geojson <- fromJSON(file="https://data.cityofnewyork.us/api/geospatial/rjaj-zgq7?method=export&format=GeoJSON")
geojson <- geojson$features
gsub('MultiPolygon','Polygon', geojson)
geojson <- lapply(geojson, extractDataParks2)
parks2 <- toJSON(geojson)
write(x=parks2, file = "data/parks2.geojson")
rm(parks2, extractDataParks2)


