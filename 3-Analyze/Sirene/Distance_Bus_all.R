sirene_all_f
b_stop_f <- b_stop %>% filter(stop_lat > 46.08 & stop_lat <= 46.18 & stop_lon < -0.9 & stop_lon >= -1.09)

degree_lat_km <- 111.32

bus_locations_sf <- st_as_sf(b_stop_f, coords = c("stop_lon", "stop_lat"))
business_locations_sf <- st_as_sf(sirene_all_f, coords = c("longitude", "latitude"))

buffer_distance_degrees_1 <- 100 / 1000 / degree_lat_km
buffer_distance_degrees_2 <- 200 / 1000 / degree_lat_km
buffer_distance_degrees_5 <- 500 / 1000 / degree_lat_km
buffer_distance_degrees_10 <- 1000 / 1000 / degree_lat_km


bus_stop_buffer_sf_1 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_1)
bus_stop_buffer_sf_2 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_2)
bus_stop_buffer_sf_5 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_5)
bus_stop_buffer_sf_10 <- st_buffer(bus_locations_sf, dist = buffer_distance_degrees_10)

#business_counts_1 <- st_join(bus_stop_buffer_sf_1, business_locations_sf, left = FALSE) %>%
#  group_by(stop_id, Code_Name) %>%
#  summarize(business_count_100m = n(), .groups = "drop")
#            code_name = first(Code_Name))
#library(dplyr)
#library(tidyr)
#business_counts_1 <- st_join(bus_stop_buffer_sf_1, business_locations_sf, left = FALSE) %>%
#  group_by(stop_id, Com_Name) %>%
#  count(name = "business_count_100m") %>%
#  pivot_wider(names_from = Com_Name, values_from = business_count_100m, values_fill = 0)



business_counts_1 <- st_join(bus_stop_buffer_sf_1, business_locations_sf, left = FALSE) %>%
  group_by(stop_id, Code_Name) %>%
  summarize(business_count_100m = n())
business_counts_2 <- st_join(bus_stop_buffer_sf_2, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_200m = n())
 #           code_name = first(Code_Name))
business_counts_5 <- st_join(bus_stop_buffer_sf_5, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_500m = n())
 #           code_name = first(Code_Name))
business_counts_10 <- st_join(bus_stop_buffer_sf_10, business_locations_sf, left = FALSE) %>%
  group_by(stop_id) %>%
  summarize(business_count_1000m = n())
 #           code_name = first(Code_Name))


# Merge business counts with b_stop data frame
bus_lines_auto_1_a <- merge(b_stop_f, business_counts_1, by = "stop_id", all.x = TRUE)
bus_lines_auto_2_a <- merge(b_stop_f, business_counts_2, by = "stop_id", all.x = TRUE)
bus_lines_auto_5_a <- merge(b_stop_f, business_counts_5, by = "stop_id", all.x = TRUE)
bus_lines_auto_10_a <- merge(b_stop_f, business_counts_10, by = "stop_id", all.x = TRUE)

bus_lines_auto_a_all <- merge(b_stop_f, business_counts_1, by = "stop_id", all.x = TRUE)
bus_lines_auto_a_all <- merge(bus_lines_auto_a_all, business_counts_2, by = "stop_id", all.x = TRUE)
bus_lines_auto_a_all <- merge(bus_lines_auto_a_all, business_counts_5, by = "stop_id", all.x = TRUE)
bus_lines_auto_a_all <- merge(bus_lines_auto_a_all, business_counts_10, by = "stop_id", all.x = TRUE)

geometry_cols <- grep("^geometry\\.(x|y)$", names(bus_lines_auto_a_all), value = TRUE)

# Remove geometry columns
bus_lines_auto_a_all <- bus_lines_auto_a_all[, !names(bus_lines_auto_a_all) %in% geometry_cols]
bus_lines_auto_a_all <- bus_lines_auto_a_all[, -c(7, 8, 9)]


