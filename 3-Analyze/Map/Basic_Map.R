
map_plot <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = map_filter, fill = "lightblue", color = "black") +
  geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
  geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
  geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
  labs(title = "Map of the Bus Stops in La Rochelle",
       color = "Bus Lines"
  ) +
  theme_minimal()

#print(map_plot)

center_lat <- mean(map_filter$label_lat)
center_lon <- mean(map_filter$label_lon)
zoom_scale <- 0.1  # Adjust the zoom scale as needed

map_plot2 <- map_plot +
  geom_label_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = paste(com_name.x,"(", point_count, ")")),
    box.padding = 0.4, # Adjust as needed
    label.padding = unit(0.4, "lines"),  # Adjust as needed
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 4,
    fill = "lightblue",  # Background color
    color = "black"  # Text color
  ) +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
  )

#print(map_plot2)

