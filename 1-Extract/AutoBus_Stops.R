

bus_table_auto <- data.frame(
  stop_name = c("P+R Saint-Rogatien", "Calvaire", "Centre-Bourg", "Les Gacheteries", "Stade de Bourgneuf", "Sud Commanderie",
                "Mairie de Montroy", "Treuil Arnaudeau", "Eglise de Saint Christophe", "Stade de Saint Christophe", "Le Verger",
                "Val Pastour", "Bourg de Salles sur Mer", "Eglise de Salles sur Mer",
                "L'Aumonerie", "ZAC de l'Aubépin", "Grande Rue", "Le Puits", "Croix Fort", "Les Massardes",
                "Mairie de Clavette", "Boulangerie", "Rue du Chat", "Chassagné", "Fief Chapitre", "Fief Jaulin", "Fief Retaillé",
                "La Jarrie Gare SNCF", "Les Abeilles", "Les Deux Moulins", "Moulin d'Amour de La Jarrie", "Puyvineux")
)

bus_lines_auto <- left_join(bus_table_auto, line_table, by = c("stop_name"))
