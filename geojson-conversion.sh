# Bulk convert shapefiles to geojson using ogr2ogr

# Note: Assumes you're in a folder with one or more zip files containing shape files
# and Outputs as geojson with the crs:84 SRS (for use on GitHub or elsewhere)

#geojson conversion
function shp2geojson() {
  ogr2ogr -f GeoJSON -t_srs crs:84 "$1.geojson" "$1.shp"
}

#unzip all files in a directory
for var in *.zip; do unzip "$var"; done

#convert all shapefiles
for var in *.shp; do shp2geojson ${var%\.*}; done

# You'd probably want to `mv *.geojson [path-to-git-repo]/` at this point
# so you could commit the file to GitHub
# Happy mapping!