
result1_LR <- t2w_LR_detail_filter %>%
  group_by(TRANS) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarise("Transport 1none 2walk 3bike 4moto 5car _6bus" = list(unique(TRANS)))

result2_LR <- t2w_LR_detail_filter %>%
  group_by(ILT) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarise("ILT 1memecommune 2diffcommune 3diffdepartement 4hors" = list(unique(ILT)))

result3_LR <- t2w_LR_detail_filter %>%
  group_by(DCLT) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarize(DCLT = toString(unique(DCLT)))

result4_LR <- t2w_LR_detail_filter %>%
  group_by(COMMUNE) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarize(COMMUNE = toString(unique(COMMUNE)))