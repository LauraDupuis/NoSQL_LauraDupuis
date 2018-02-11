mongoimport -d "new_york" -c "censusBlocks" --type json --file "data/censusBlocks.geojson" --jsonArray

mongoimport -d "new_york" -c "censusTracts" --type json --file "data/censusTracts.geojson" --jsonArray

mongoimport -d "new_york" -c "subways" --type json --file "data/subways.geojson" --jsonArray

mongoimport -d "new_york" -c "theaters" --type json --file "data/theaters.geojson" --jsonArray

mongoimport -d "new_york" -c "parks" --type json --file "data/parks2.geojson" --jsonArray
