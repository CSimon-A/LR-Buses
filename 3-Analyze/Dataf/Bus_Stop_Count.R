
#____STOP COUNT_____________________________________________________________________

bus_count <- st_as_sf(b_stop, coords = c("stop_lon", "stop_lat"), crs = st_crs(map))
bus_count <- bus_count %>% filter(location_type == 1)

joined_bus <- st_join(map_filter, bus_count)

bus_stop_count <- joined_bus %>% 
  group_by(com_name) %>% 
  summarize(point_count = n())


bus_stop_count <- st_make_valid(bus_stop_count)
text_tab <- st_join(map_filter, bus_stop_count, join = st_within, largest = TRUE)