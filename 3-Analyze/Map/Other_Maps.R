map_plot_LR_fill_Pop <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = joined_data2, aes(fill = P20_POP), color = "black") +
  scale_fill_viridis_c() +  
  geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  geom_label_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = paste(com_name.x)),
    box.padding = 0.2, # Adjust as needed
    label.padding = unit(0.4, "lines"),  # Adjust as needed
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 4,
    fill = "lightblue",  # Background color
    color = "black"  # Text color
) +
#geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
#geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
#geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
labs(
  title = "Population of La Rochelle",
  fill = "Number of People",
  x = "Longitude",
  y = "Latitude"
) +
  theme_minimal()


map_plot_LR_fill <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = joined_data, aes(fill = (P20_ACTOCC15P_COMMUN/P20_POP)*100), color = "black") +
  scale_fill_viridis_c() +  
  #geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  #geom_label_repel(
  #  data = text_tab,
  #  aes(x = label_lon, y = label_lat, label = paste(com_name.x,"(", point_count, ")")),
  #  box.padding = 0.2, # Adjust as needed
  #  label.padding = unit(0.4, "lines"),  # Adjust as needed
  #  max.overlaps = Inf, 
  #  segment.color = "transparent", 
  #  size = 4,
  #  fill = "lightblue",  # Background color
  #  color = "black"  # Text color
  #) +
  #geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
  #geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
  #geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
  labs(
    title = "Population Means of Transport",
    fill = "Public Transport %",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()


map_plot_LR_fill_NV <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = joined_data, aes(fill = MED20), color = "black") +
  scale_fill_viridis_d() +  
  #geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  #geom_label_repel(
  #  data = text_tab,
  #  aes(x = label_lon, y = label_lat, label = paste(com_name.x,"(", point_count, ")")),
  #  box.padding = 0.2, # Adjust as needed
  #  label.padding = unit(0.4, "lines"),  # Adjust as needed
  #  max.overlaps = Inf, 
  #  segment.color = "transparent", 
  #  size = 4,
  #  fill = "lightblue",  # Background color
  #  color = "black"  # Text color
#) +
#geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
#geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
#geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
labs(
  title = "Average Quality of Life",
  fill = "Euros",
  x = "Longitude",
  y = "Latitude"
) +
  theme_minimal()



map_plot_LR_fill_car <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = joined_data, aes(fill = (P20_ACTOCC15P_VOITURE/P20_POP)*100), color = "black") +
  scale_fill_viridis_c() +  
  #geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  #geom_label_repel(
  #  data = text_tab,
  #  aes(x = label_lon, y = label_lat, label = paste(com_name.x,"(", point_count, ")")),
  #  box.padding = 0.2, # Adjust as needed
  #  label.padding = unit(0.4, "lines"),  # Adjust as needed
  #  max.overlaps = Inf, 
  #  segment.color = "transparent", 
  #  size = 4,
  #  fill = "lightblue",  # Background color
  #  color = "black"  # Text color
#) +
#geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
#geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
#geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
labs(
  title = "Population Means of Transport",
  fill = "Vehicule Use %",
  x = "Longitude",
  y = "Latitude"
) +
  theme_minimal()


map_plot_percent_fill_bus <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = joined_data2, aes(fill = (P20_ACTOCC15P_COMMUN/P20_POP)*100), color = "black") +
  scale_fill_viridis_c() +  
  geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  geom_label_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = paste(com_name.x)),
    box.padding = 0.2, # Adjust as needed
    label.padding = unit(0.4, "lines"),  # Adjust as needed
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 4,
    fill = "lightblue",  # Background color
    color = "black"  # Text color
  ) +
  #geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
  #geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
  #geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
  labs(
    title = "Population Means of Transport",
    fill = "Public Transport %",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()

map_plot_percent_fill_car <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = joined_data2, aes(fill = (P20_ACTOCC15P_VOITURE/P20_POP)*100), color = "black") +
  scale_fill_viridis_c() +  
  geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  geom_label_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = paste(com_name.x)),
    box.padding = 0.2, # Adjust as needed
    label.padding = unit(0.4, "lines"),  # Adjust as needed
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 4,
    fill = "lightblue",  # Background color
    color = "black"  # Text color
  ) +
  #geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
  #geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
  #geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
  labs(
    title = "Population Means of Transport",
    fill = "Vehicule Use %",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()


map_plot_LR_fill_Pop <- map_plot_LR_fill_Pop +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
  )

map_plot_percent_fill_bus_z <- map_plot_percent_fill_bus +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
  )

map_plot_percent_fill_car_z <- map_plot_percent_fill_car +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
  )


#print(map_plot_LR_fill_car)

#print(map_plot_percent_fill_bus_z)
#print(map_plot_percent_fill_car_z)

