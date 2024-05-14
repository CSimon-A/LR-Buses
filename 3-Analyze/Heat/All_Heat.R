

heat_commune <- heatmaply(commune_mat, dendrogram = "none",margins = c(60,100,40,20),
          labCol = colnames(commune_mat),labRow = rownames(commune_mat),
          heatmap_layers = theme(axis.line=element_blank())
)

heat_commune_sca <- heatmaply(commune_mat, dendrogram = "none",scale = "column",margins = c(60,100,40,20),
                          labCol = colnames(commune_mat),labRow = rownames(commune_mat),
                          heatmap_layers = theme(axis.line=element_blank())
)

heat_commune_den <- heatmaply(commune_mat, margins = c(60,100,40,20),labCol = colnames(commune_mat),
          labRow = rownames(commune_mat),heatmap_layers = theme(axis.line=element_blank())
)

heat_commune_den_col <- heatmaply(commune_mat, scale = "column",margins = c(60,100,40,20),labCol = colnames(commune_mat),
          labRow = rownames(commune_mat),heatmap_layers = theme(axis.line=element_blank())
)
