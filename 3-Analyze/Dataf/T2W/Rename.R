
commune_df_OG <- as.data.frame(commune_df)
commune_df_bus_OG <- as.data.frame(commune_df_bus)
commune_df_car_OG <- as.data.frame(commune_df_car)
commune_df_walk_OG <- as.data.frame(commune_df_walk)

commune_df_join <- commune_df %>%
  rownames_to_column("from_commune")
commune_df_join <- commune_df_join[, !(colnames(commune_df_join) == "Count")]


colnames(commune_df) <- com_names_LR_to
rownames(commune_df) <- com_names_LR_from

colnames(commune_df_bus) <- com_names_LR_to
rownames(commune_df_bus) <- com_names_LR_from

colnames(commune_df_car) <- com_names_LR_to
rownames(commune_df_car) <- com_names_LR_from

colnames(commune_df_walk) <- com_names_LR_to
rownames(commune_df_walk) <- com_names_LR_from

colnames(commune_df_all) <- com_names_LR_to
rownames(commune_df_all) <- com_names_LR_from

colnames(commune_df_car_per) <- com_names_LR_to
rownames(commune_df_car_per) <- com_names_LR_from

colnames(commune_df_walk_per) <- com_names_LR_to
rownames(commune_df_walk_per) <- com_names_LR_from

colnames(commune_df_bus_per) <- com_names_LR_to
rownames(commune_df_bus_per) <- com_names_LR_from