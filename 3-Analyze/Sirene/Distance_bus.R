
degree_lat_km <- 111.32

bus_locations_sf <- st_as_sf(bus_lines_auto, coords = c("stop_lon", "stop_lat"))
business_locations_sf <- st_as_sf(sirene_all_f, coords = c("longitude", "latitude"))

buffer_distance_degrees_1 <- 100 / 1000 / degree_lat_km # radius
buffer_distance_degrees_2 <- 200 / 1000 / degree_lat_km
buffer_distance_degrees_5 <- 500 / 1000 / degree_lat_km
buffer_distance_degrees_10 <- 1000 / 1000 / degree_lat_km


bus_stop_buffer_sf_1 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_1)
bus_stop_buffer_sf_2 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_2)
bus_stop_buffer_sf_5 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_5)
bus_stop_buffer_sf_10 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_10)

business_counts_1 <- st_join(bus_stop_buffer_sf_1, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_100m = n())
business_counts_2 <- st_join(bus_stop_buffer_sf_2, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_200m = n())
business_counts_5 <- st_join(bus_stop_buffer_sf_5, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_500m = n())
business_counts_10 <- st_join(bus_stop_buffer_sf_10, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_1000m = n())

# Merge business counts with b_stop data frame
bus_lines_auto_1 <- merge(bus_lines_auto, business_counts_1, by = "stop_id", all.x = TRUE)
bus_lines_auto_2 <- merge(bus_lines_auto, business_counts_2, by = "stop_id", all.x = TRUE)
bus_lines_auto_5 <- merge(bus_lines_auto, business_counts_5, by = "stop_id", all.x = TRUE)
bus_lines_auto_10 <- merge(bus_lines_auto, business_counts_10, by = "stop_id", all.x = TRUE)

bus_lines_auto_all <- merge(bus_lines_auto, business_counts_1, by = "stop_id", all.x = TRUE)
bus_lines_auto_all <- merge(bus_lines_auto_all, business_counts_2, by = "stop_id", all.x = TRUE)
bus_lines_auto_all <- merge(bus_lines_auto_all, business_counts_5, by = "stop_id", all.x = TRUE)
bus_lines_auto_all <- merge(bus_lines_auto_all, business_counts_10, by = "stop_id", all.x = TRUE)

geometry_cols <- grep("^geometry\\.(x|y)$", names(bus_lines_auto_all), value = TRUE)

# Remove geometry columns
bus_lines_auto_all <- bus_lines_auto_all[, !names(bus_lines_auto_all) %in% geometry_cols]
bus_lines_auto_all <- bus_lines_auto_all[, -c(7, 8, 9)]

