
sirene_all_f_m <- filter(sirene_all_f, latitude > 46.08 & latitude <= 46.18 & longitude < -0.9 & longitude >= -1.09)

# Assuming your data frame is called 'business_data' with columns 'lat' and 'long'
density <- kde2d(sirene_all_f_m$longitude, sirene_all_f_m$latitude ,h = 0.01, n = 200)

# Create a data frame with the density values and original lat/long values
# Initialize an empty data frame to store results
density_df <- data.frame(lon = numeric(0), lat = numeric(0), density = numeric(0))

# Iterate over each longitude and latitude value
for (i in seq_along(density$x)) {
  for (j in seq_along(density$y)) {
    # Append longitude, latitude, and corresponding density to the data frame
    density_df <- rbind(density_df, data.frame(lon = density$x[i], lat = density$y[j], density = density$z[i, j]))
  }
}

############

map_filter_sf <- st_as_sf(map_filter)

density_sf <- st_as_sf(density_df, coords = c("lon", "lat"), crs = 4326)

merged_geometry <- st_union(map_filter_sf)

# Perform intersection
intersects <- st_intersects(density_sf, merged_geometry)

# Initialize an empty vector to store the indices of intersecting geometries
intersecting_indices <- c()

# Iterate over the elements of intersects
for (i in seq_along(intersects)) {
  # Check if the element is not empty
  if (length(intersects[[i]]) > 0) {
    # Add the index to the vector
    intersecting_indices <- c(intersecting_indices, i)
  }
}

intersecting_points <- density_df[intersecting_indices, ]


###########

# Determine the range of density values

normalized_density <- scales::rescale(sqrt(intersecting_points$density))

map_m <- st_crop(map, xmin = -1.09, xmax = -0.9, ymin = 46.08, ymax = 46.18)

map_plot_grad <- ggplot() +
  geom_sf(data = map_m, fill = alpha("white", 0))

map_plot_with_density <- map_plot_grad +
  geom_tile(data = intersecting_points, aes(x = lon, y = lat, fill = normalized_density)) +  # Apply linear scaling
  scale_fill_gradient(low = "lightblue", high = "darkblue") +  # Define color gradient
  #  geom_point(data = sirene_all_f_m, aes(x = longitude, y = latitude), color = "black", 
  #             size = 0.5, shape = 21, fill = "green", stroke = 0.5) +
  labs(fill = "Density (scaled)")  # Add legend label for density


map_plot_grad <- map_plot_with_density +
  geom_sf(data = map_filter, fill = alpha("white", 0), color = "black") +
  geom_point(data = bus_lines_auto_1, aes(x = stop_lon, y = stop_lat, color = "Bus Stops"), size = 3) +
  labs(title = "Map of the Bus Stops in La Rochelle") +
  geom_label_repel(
    data = text_tab,
    aes(x = label_lon, y = label_lat, label = com_name.x),
    box.padding = 2.5, # Adjust as needed
    label.padding = unit(0.4, "lines"),  # Adjust as needed
    max.overlaps = Inf, 
    segment.color = "transparent", 
    size = 3,
    fill = alpha("lightblue", 0.7),  # Background color
    color = "black"  # Text color
  ) +
  scale_color_manual(name = "Bus Stops", values = "black", labels = "Bus Stops") + # Adding legend for bus stops
  theme_minimal()

# Display the combined plot
#print(map_plot_grad)