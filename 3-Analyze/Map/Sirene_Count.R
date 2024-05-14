
map_plot <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = map_filter, fill = "lightblue", color = "black") +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)) +
  geom_point(data = sirene_f, aes(x = longitude, y = latitude), color = "black", 
             size = 1, shape = 21, fill = "green", stroke = 1) +
  geom_label_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = com_name.x),
    box.padding = 0.4, # Adjust as needed
    label.padding = unit(0.4, "lines"),  # Adjust as needed
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 3,
    fill = "lightblue",  # Background color
    color = "black"  # Text color
  )

map_plot_100m <- map_plot +
  geom_point(data = bus_lines_auto_1, aes(x = stop_lon, y = stop_lat, color = business_count_100m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (100m)")

map_plot_200m <- map_plot +
  geom_point(data = bus_lines_auto_2, aes(x = stop_lon, y = stop_lat, color = business_count_200m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (200m)")

map_plot_500m <- map_plot +
  geom_point(data = bus_lines_auto_5, aes(x = stop_lon, y = stop_lat, color = business_count_500m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (500m)")

map_plot_1000m <- map_plot +
  geom_point(data = bus_lines_auto_10, aes(x = stop_lon, y = stop_lat, color = business_count_1000m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (1000m)")

map_plot_100m_a <- map_plot +
  geom_point(data = bus_lines_auto_1_a, aes(x = stop_lon, y = stop_lat, color = business_count_100m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (100m)")

map_plot_200m_a <- map_plot +
  geom_point(data = bus_lines_auto_2_a, aes(x = stop_lon, y = stop_lat, color = business_count_200m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (200m)")

map_plot_500m_a <- map_plot +
  geom_point(data = bus_lines_auto_5_a, aes(x = stop_lon, y = stop_lat, color = business_count_500m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (500m)")

map_plot_1000m_a <- map_plot +
  geom_point(data = bus_lines_auto_10_a, aes(x = stop_lon, y = stop_lat, color = business_count_1000m), size = 4) +
  scale_color_gradient(low = "blue", high = "red", name = "Businesses Nearby") +
  labs(title = "Density of Businesses Around Bus Stops (1000m)")

#print(map_plot_1000m)



