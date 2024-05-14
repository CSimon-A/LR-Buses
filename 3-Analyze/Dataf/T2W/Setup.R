
unique_dep <- unique(travel2work_mat$COMMUNE)
unique_arr <- unique(travel2work_mat$DCLT)

commune_df_maps <- data.frame(matrix(0, nrow = length(com_codes_maps), ncol = length(com_codes_maps), dimnames = list(com_codes_maps, com_codes_maps)))

commune_df <- data.frame(matrix(0, nrow = length(com_codes_LR), ncol = length(com_codes_LR)))
colnames(commune_df) <- com_codes_LR
rownames(commune_df) <- com_codes_LR

commune_df_maps <- data.frame(matrix(0, nrow = length(com_codes_maps), ncol = length(com_codes_maps)))
colnames(commune_df_maps) <- com_codes_maps
rownames(commune_df_maps) <- com_codes_maps

# Create a new commune code for 'other communes'
commune_code_outside <- "00000"
commune_code_LR <- "00001"


# Add a row and column with 'other communes' to the data frames
commune_df[commune_code_LR, ] <- 0
commune_df[, commune_code_LR] <- 0

commune_df[commune_code_outside, ] <- 0
commune_df[, commune_code_outside] <- 0

commune_df["Count", ] <- 0
commune_df[, "Count"] <- 0


commune_df_maps[commune_code_outside, ] <- 0
commune_df_maps[, commune_code_outside] <- 0

commune_df_car <- as.data.frame(commune_df)
commune_df_walk <- as.data.frame(commune_df)
commune_df_bus <- as.data.frame(commune_df)
commune_df_all <- as.data.frame(commune_df)
commune_df_car_per <- as.data.frame(commune_df)
commune_df_walk_per <- as.data.frame(commune_df)
commune_df_bus_per <- as.data.frame(commune_df)


