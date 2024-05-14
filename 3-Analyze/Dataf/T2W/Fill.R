
for (i in 1:nrow(travel2work_mat2)) {
  
  from_commune <- as.character(travel2work_mat2[i, "COMMUNE"])
  to_commune <- as.character(travel2work_mat2[i, "DCLT"])
  the_way <- as.integer(travel2work_mat2[i, "TRANS"])
  
  
  if (!from_commune %in% rownames(commune_df)) { ## rows are from
    if (from_commune %in% com_codes_maps){
      from_commune <- "00001"
    }
    else if (!from_commune %in% com_codes_maps) { ## rows are from
      from_commune <- "00000"
    }
  }
  

  if (!to_commune %in% colnames(commune_df)) { ## cols are to
    if (to_commune %in% com_codes_maps){
      to_commune <- "00001"
    }
    else if (!to_commune %in% com_codes_maps) { ## cols are to
      to_commune <- "00000"
    }
  }

  commune_df[from_commune, to_commune] <- commune_df[from_commune, to_commune] + 1
  
  if (is.na(the_way)) {
    the_way = 10
  }
  if (the_way < 3) {
    commune_df_walk[from_commune, to_commune] <- commune_df_walk[from_commune, to_commune] +1
    commune_df_walk[from_commune, "Count"] <- commune_df_walk[from_commune, "Count"] + 1
    commune_df_walk["Count", to_commune] <- commune_df_walk["Count", to_commune] + 1
    
  } else if (the_way > 3 && the_way < 6) {
    commune_df_car[from_commune, to_commune] <- commune_df_car[from_commune, to_commune] +1
    commune_df_car[from_commune, "Count"] <- commune_df_car[from_commune, "Count"] + 1
    commune_df_car["Count", to_commune] <- commune_df_car["Count", to_commune] + 1
    
  } else if (the_way == 6) {
    commune_df_bus[from_commune, to_commune] <- commune_df_bus[from_commune, to_commune] +1
    commune_df_bus[from_commune, "Count"] <- commune_df_bus[from_commune, "Count"] + 1
    commune_df_bus["Count", to_commune] <- commune_df_bus["Count", to_commune] + 1
    
  }
  
  commune_df[from_commune, "Count"] <- commune_df[from_commune, "Count"] + 1
  commune_df["Count", to_commune] <- commune_df["Count", to_commune] + 1
}


for (i in 1:nrow(commune_df)) {
  for (j in 1:ncol(commune_df)) {
    count_com <- as.integer(commune_df[i,j])
    bus_way <- as.integer(commune_df_bus[i,j])
    car_way <- as.integer(commune_df_car[i,j])
    walk_way <- as.integer(commune_df_walk[i,j])
    
    bus_percent <- ifelse(count_com != 0, round(bus_way / count_com * 100), 0)
    car_percent <- ifelse(count_com != 0, round(car_way / count_com * 100), 0)
    walk_percent <- ifelse(count_com != 0, round(walk_way / count_com * 100), 0)
    
    commune_df_all[i, j] <- paste("t:",count_com , " b:", bus_percent, "%", " c:", car_percent, "%")
    commune_df_car_per[i, j] <- paste(car_percent, "%")
    commune_df_bus_per[i, j] <- paste(bus_percent, "%")
    commune_df_walk_per[i, j] <- paste(walk_percent, "%")
    
  }
}


for (i in 1:nrow(travel2work_mat2)) {
  from_commune <- as.character(travel2work_mat2[i, "COMMUNE"])
  to_commune <- as.character(travel2work_mat2[i, "DCLT"])
  
  if (!from_commune %in% rownames(commune_df_maps)) {
    from_commune <- "00000"
  }
  
  if (!to_commune %in% colnames(commune_df_maps)) {
    to_commune <- "00000"
  }
  
  commune_df_maps[from_commune, to_commune] <- commune_df_maps[from_commune, to_commune] + 1
}
