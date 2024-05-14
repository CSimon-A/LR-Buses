
commune_df_crop <- commune_df[1:(nrow(commune_df) - 1), 1:(ncol(commune_df) - 1)]

commune_mat <- as.matrix(commune_df_crop)
#commune_mat <- t(commune_mat)

commune_mat_OG <- commune_mat
commune_mat <- t(commune_mat)

commune_mat[9:11, 9:11] <- 0

log_commune_mat <- log(commune_mat_OG + 1)  # Adding 1 to avoid issues with log(0)

groupColors <- brewer.pal(12, "Paired")

# Create the chord diagram
chord_commune_OG <- chorddiag(commune_mat_OG, groupColors = groupColors, groupnamePadding = 20)

chord_commune <- chorddiag(commune_mat,margin = 130, groupColors = groupColors, groupnamePadding = 30, tickInterval = 5)

chord_commune_log <- chorddiag(log_commune_mat, ,margin = 110, groupColors = groupColors, groupnamePadding = 5, tickInterval = 0)

