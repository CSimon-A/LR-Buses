

map_plot_percent_fill_car_TW <- ggplot() +
  geom_sf(data = map, fill = "white", color = "black") +
  geom_sf(data = T2W_map, aes(fill = VOIT), color = "black") +
  scale_fill_viridis_d() +  # Use _d for discrete scales
  geom_point(data = b_stop, aes(x = stop_lon, y = stop_lat), color = "red", size = 1) +
  geom_text_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = paste(com_name.x,"\n", point_count)),
    box.padding = 0.2, 
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 4
  ) +
  geom_line(data = lines_bus_17, aes(x = stop_lon, y = stop_lat, color = "Bus 17")) +
  geom_line(data = lines_bus_18, aes(x = stop_lon, y = stop_lat, color = "Bus 18")) +
  geom_line(data = lines_bus_19, aes(x = stop_lon, y = stop_lat, color = "Bus 19")) +
  labs(
    title = "Communes à La Rochelle étudiées avec les arrêts de bus YELO",
    fill = "Transport en Commun"  
  ) +
  theme_minimal()



map_plot_percent_fill_car_z_TW <- map_plot_percent_fill_car_TW +
  coord_sf(
    xlim = c(center_lon - zoom_scale, center_lon + zoom_scale),
    ylim = c(center_lat - zoom_scale*0.55, center_lat + zoom_scale*0.4)
  )

#print(map_plot_percent_fill_car)
