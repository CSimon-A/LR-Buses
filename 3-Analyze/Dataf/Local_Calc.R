
result <- t2w_detail_filter %>%
  group_by(TRANS) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarise("Transport 1none 2walk 3bike 4moto 5car _6bus" = list(unique(TRANS)))

result2 <- t2w_detail_filter %>%
  group_by(ILT) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarise("ILT 1memecommune 2diffcommune 3diffdepartement 4hors" = list(unique(ILT)))

result3 <- t2w_detail_filter %>%
  group_by(DCLT) %>%
  summarize(count = n()) %>%
  group_by(count) %>%
  summarize(DCLT = toString(unique(DCLT)))

result4 <- t2w_detail_filter %>% ##ONLY FROM OUR COMMUNES
  group_by(COMMUNE) %>%
  summarize(count = n()) #%>%
#  group_by(count) %>%
#  summarize(COMMUNE = toString(unique(COMMUNE)))

colnames(result4) <- c("Commune_id", "Count_Travelers_T2W")
result4_merge <- merge(result4, code_com, by.x = "Commune_id", all.x = TRUE)
result4_merge <- result4_merge[, c("Commune", "Count_Travelers_T2W")]

# Calculate the percentage of each zipcode compared to the total count
Pop_workers_t2w <- result4_merge %>%
  mutate(Percentage = Count_Travelers_T2W / sum(Count_Travelers_T2W) * 100)

# Add a row at the bottom representing the sum of the count
Pop_workers_t2w <- Pop_workers_t2w %>%
  summarise(Commune = "Total", Count_Travelers_T2W = sum(Count_Travelers_T2W), Percentage = sum(Percentage)) %>%
  bind_rows(Pop_workers_t2w, .)
