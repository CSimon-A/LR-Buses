
# Create a data frame with your data
bus_table <- data.frame(
  stop_name = c("Stade de Saint Christophe", "Eglise de Saint Christophe", "Le Verger", "Val Pastour", "L'Aubertière", "Mairie de Montroy",
                "Les Gacheteries", "Centre-Bourg", "La Chartrie", "La Gabardelière", "Gare La Rochelle (De Gaulle)", "La Jarrie Gare SNCF",
                "Grande Rue", "Le Puits", "Rue du Chat", "Boulangerie", "Fief Retaillé", "Fief Jaulin", "Les Abeilles", "Croix Fort",
                "Mairie de Clavette", "Les Massardes", "Les Bonneveaux", "La Ragoterie", "La Frénée", "Le Collet",
                "Eglise de Salles sur Mer", "Bourg de Salles sur Mer", "Les Monrois", "Dames Blanches (Maubec)")
)

bus_17_vec <- c("Stade de Saint Christophe", "Eglise de Saint Christophe", "Le Verger", "Val Pastour", "L'Aubertière", "Mairie de Montroy",
                "Les Gacheteries", "Centre-Bourg", "La Chartrie", "La Gabardelière", "Gare La Rochelle (De Gaulle)")

bus_table <- bus_table %>%
  mutate(order_in_bus_17 = match(stop_name, bus_17_vec))

bus_18_vec <- c("La Jarrie Gare SNCF", "Grande Rue", "Le Puits", "Rue du Chat", "Boulangerie", "Fief Retaillé", "Fief Jaulin",
                "Les Abeilles", "Croix Fort", "Mairie de Clavette", "Les Massardes", "Gare La Rochelle (De Gaulle)")

bus_table <- bus_table %>%
  mutate(order_in_bus_18 = match(stop_name, bus_18_vec))

bus_19_vec <- c("Les Bonneveaux", "La Ragoterie", "La Frénée", "Le Collet", "Eglise de Salles sur Mer",
                "Bourg de Salles sur Mer", "Les Monrois", "Dames Blanches (Maubec)")

bus_table <- bus_table %>%
  mutate(order_in_bus_19 = match(stop_name, bus_19_vec))

line_table <- b_stop %>% filter(location_type == 1 | stop_code == "6211")

bus_lines <- left_join(bus_table, line_table, by = c("stop_name"))
bus_lines <- bus_lines %>% arrange(order_in_bus_17, order_in_bus_18, order_in_bus_19)

lines_bus_17 <- bus_lines %>% 
  filter(!is.na(order_in_bus_17)) %>% 
  dplyr::select(stop_name, stop_lon, stop_lat)
lines_bus_18 <- bus_lines %>% filter(!is.na(order_in_bus_18)) %>%
  dplyr::select(stop_name, stop_lon, stop_lat)
lines_bus_19 <- bus_lines %>% filter(!is.na(order_in_bus_19)) %>%
  dplyr::select(stop_name, stop_lon, stop_lat)




