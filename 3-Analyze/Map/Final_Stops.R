
map_plot_s <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = map_filter, fill = "lightblue", color = "black") +
  geom_point(data = sirene_f, aes(x = longitude, y = latitude), color = "red", size = 1) +
  geom_point(data = bus_lines_auto, aes(x = stop_lon, y = stop_lat), color = "black", size = 2, shape = 21, fill = "green", stroke = 1) +
  labs(title = "Map of the Final Bus Stops in La Rochelle",
       color = "Final Bus Stops"
  ) +
  theme_minimal()

center_lat <- mean(map_filter$label_lat)
center_lon <- mean(map_filter$label_lon)
zoom_scale <- 0.1  # Adjust the zoom scale as needed

#print(map_plot_s)

map_plot2_s <- map_plot_s +
  geom_label_repel(
    data = bus_lines_auto, 
    aes(x = stop_lon, y = stop_lat, label = stop_name),
    box.padding = 0.4, # Adjust as needed
    point.padding = 0.1, # Adjust as needed
    segment.color = "black", # Adjust as needed
    size = 3,
    max.overlaps = Inf, # Set to Inf to allow all labels, adjust as needed
    fill = "lightblue"
  ) +
  #geom_label_repel(
  #  data = text_tab,
  #  aes(x = label_lon, y = label_lat, label = paste(com_name.x)),
  #  box.padding = 0.4, # Adjust as needed
  #  label.padding = unit(0.4, "lines"),  # Adjust as needed
  #  max.overlaps = Inf, 
  #  segment.color = "transparent", 
  #  size = 4,
  #  fill = "lightblue",  # Background color
  #  color = "black"  # Text color
  #) +
coord_sf(
  xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
  ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
)

map_plot2_s_pop <- map_plot_LR_fill_Pop +
  geom_point(data = sirene_f, aes(x = longitude, y = latitude), color = "red", size = 1) +
  geom_point(data = bus_lines_auto, aes(x = stop_lon, y = stop_lat), color = "black", size = 2, shape = 21, fill = "green", stroke = 1) +
  geom_label_repel(
    data = bus_lines_auto, 
    aes(x = stop_lon, y = stop_lat, label = stop_name),
    box.padding = 0.4, # Adjust as needed
    point.padding = 0.1, # Adjust as needed
    segment.color = "black", # Adjust as needed
    size = 3,
    max.overlaps = Inf, # Set to Inf to allow all labels, adjust as needed
    fill = "lightblue"
  ) +
  #theme(legend.position = "none") +  # Optional: Hide the legend
  expand_limits(x = c(min(map$longitude), max(map$longitude)), y = c(min(map$latitude), max(map$latitude)))

#print(map_plot2_s_pop)


map_plot_f <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = map_filter, fill = "lightblue", color = "black") +
  geom_point(data = bus_lines_auto, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  labs(title = "Map of the Final Bus Stops in La Rochelle",
       color = "Final Bus Stops"
  ) +
  theme_minimal()

#print(map_plot2_f)


map_plot2_f <- map_plot_f +
  geom_label_repel(
    data = bus_lines_auto, 
    aes(x = stop_lon, y = stop_lat, label = stop_name),
    box.padding = 0.4, # Adjust as needed
    point.padding = 0.1, # Adjust as needed
    segment.color = "black", # Adjust as needed
    size = 3,
    max.overlaps = Inf, # Set to Inf to allow all labels, adjust as needed
    fill = "lightblue"
  ) +
  #geom_label_repel(
  #  data = text_tab,
  #  aes(x = label_lon, y = label_lat, label = paste(com_name.x)),
  #  box.padding = 0.4, # Adjust as needed
  #  label.padding = unit(0.4, "lines"),  # Adjust as needed
  #  max.overlaps = Inf, 
  #  segment.color = "transparent", 
  #  size = 4,
  #  fill = "lightblue",  # Background color
  #  color = "black"  # Text color
  #) +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
  )

