
map_filter <- map %>% filter(com_code %in% com_codes)  %>% mutate(com_code = as.character(com_code))

#{ "lon": -0.947698, "lat": 46.140835 }
map_filter <- map_filter %>%
  mutate(geo_point_2d_mod = gsub('\\{ "lon": ', "", geo_point_2d)) %>%
  mutate(geo_point_2d_mod = gsub(', "lat":', "", geo_point_2d_mod)) %>%
  mutate(geo_point_2d_mod = gsub(" \\}", "", geo_point_2d_mod))
map_filter <- map_filter %>%
  separate(geo_point_2d_mod, into = c("label_lon", "label_lat"), sep = " ")

map_filter$year <- as.numeric(map_filter$year)
map_filter$label_lon <- as.numeric(map_filter$label_lon)
map_filter$label_lat <- as.numeric(map_filter$label_lat)

map_filter <- st_make_valid(map_filter)
com_codes_maps <- unique(map$com_code)

map_filter$year <- as.numeric(map_filter$year)
map_filter$label_lon <- as.numeric(map_filter$label_lon)
map_filter$label_lat <- as.numeric(map_filter$label_lat)

map <- map %>% mutate(com_code = as.character(com_code))

#_______________________________________________________________________________

insee_filter_noname <- insee %>% filter(CODGEO %in% com_codes_LR)
insee_filter <- insee_filter_noname %>% left_join(map_filter, by = c("CODGEO" = "com_code"))

insee_filter$com_name <- as.character(insee_filter$com_name)

Pop_detail_filter <- insee_filter %>% dplyr::select(all_of(Pop_detail_code)) 
Pop20_filter <- insee_filter %>% dplyr::select(all_of(Pop20_code)) 
Pop14_filter <- insee_filter %>% dplyr::select(all_of(Pop14_code)) 
Pop09_filter <- insee_filter %>% dplyr::select(all_of(Pop09_code)) 
Couple_filter <- insee_filter %>% dplyr::select(all_of(Couple_code)) 
Work20_filter <- insee_filter %>% dplyr::select(all_of(Work20_code)) 
Work14_filter <- insee_filter %>% dplyr::select(all_of(Work14_code)) 
Transport20_filter <- insee_filter %>% dplyr::select(all_of(Transport20_code)) 
Transport20_filter_detail <- insee_filter %>% dplyr::select(all_of(Transport20_code_detail)) 
Transport14_filter <- insee_filter %>% dplyr::select(all_of(Transport14_code)) 
Revenue_filter <- insee_filter %>% dplyr::select(all_of(Revenue_code)) 
Tourism_filter <- insee_filter %>% dplyr::select(all_of(Tourism_code)) 

joined_data <- left_join(map, insee, by = c("com_code" = "CODGEO"))
joined_data2 <- left_join(map_filter, insee_filter, by = c("com_code" = "CODGEO"))

#_______________________________________________________________________________

travel2work_filter <- travel2work %>% filter(COMMUNE %in% com_codes_LR) # | DCLT %in% com_codes)
t2w_detail_filter <- travel2work_filter %>% dplyr::select(all_of(T2w_code)) 

travel2work_LR_filter <- travel2work %>% filter(COMMUNE %in% com_codes_maps) # | DCLT %in% com_codes_maps)
t2w_LR_detail_filter <- travel2work_LR_filter %>% dplyr::select(all_of(T2w_code)) 

travel2work_mat <- travel2work %>% filter(COMMUNE %in% com_codes_LR | DCLT %in% com_codes_LR) #only communes study
travel2work_mat2 <- travel2work %>% filter(COMMUNE %in% com_codes_maps | DCLT %in% com_codes_maps) #all LR


T2W_map <- left_join(map_filter, t2w_detail_filter, by = c("com_code" = "COMMUNE"))

#_______________________________________________________________________________

naf1993_n <- left_join(naf1993, nafdef1993, by = c("N_17" = "Code"))
naf2003_n <- left_join(naf2003, nafdef2003, by = c("N_17" = "Code"))
naf2008_n <- left_join(naf2008, nafdef2008, by = c("NIV1" = "Code"))

sirene_f <- sirene %>%   filter(latitude > 46 & latitude <= 46.25 & longitude < -0.9 & longitude >= -1.25)

sirene_f_red <- sirene_f %>% dplyr::select(1, (ncol(sirene_f) - 11):ncol(sirene_f))
sirene_f_red <- sirene_f_red %>% dplyr::select(-ncol(sirene_f_red))

naf1973$NAP600 <- as.character(naf1973$NAP600)

sirene_f_red_all <- sirene_f_red %>%
  left_join(naf1973, by = c("activitePrincipaleEtablissement" = "NAP600")) %>%
  left_join(naf1993_n, by = c("activitePrincipaleEtablissement" = "N_700")) %>%
  left_join(naf2003_n, by = c("activitePrincipaleEtablissement" = "N_700")) %>%
  left_join(naf2008_n, by = c("activitePrincipaleEtablissement" = "NIV5"))

sirene_f_short <- sirene_f_red_all %>%
  dplyr::select(-c(8, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 25, 26, 27, 28, 30, 31, 32, 33))

current_colnames <- colnames(sirene_f_short)
new_colnames <- c(current_colnames[1:(length(current_colnames) - 4)], "NAF_73_Name", "NAF_93_Name", "NAF_03_Name", "NAF_08_Name")
colnames(sirene_f_short) <- new_colnames

sirene_f_short$Code_Name <- ifelse(!is.na(sirene_f_short$NAF_73_Name), sirene_f_short$NAF_73_Name,
                                 ifelse(!is.na(sirene_f_short$NAF_03_Name), sirene_f_short$NAF_03_Name,
                                        ifelse(!is.na(sirene_f_short$NAF_93_Name), sirene_f_short$NAF_93_Name, sirene_f_short$NAF_08_Name)))

sirene_all <- sirene_f_short %>% dplyr::select(c(1, 4, 5, 6, 7, 8, 13))

sirene_all_f <- sirene_all %>% filter(grepl("O", caractereEmployeurEtablissement)) # établissement employeur 

sirene_all_r <- sirene_all_f %>%
  group_by(Code_Name) %>%
  summarize(count = n()) 

#_______________________________________________________________________________

b_trip_filter <- b_trip %>% filter(route_id %in% bus_trip_code)
b_trip_filter_det <- b_trip_filter %>% dplyr::select(-c(2,5,7,8,9))

b_stop_time_filter <- b_stop_time %>%
  group_by(trip_id) %>%
  mutate(min_order = min(stop_sequence),
         max_order = max(stop_sequence)) %>%
  filter(stop_sequence == min_order | stop_sequence == max_order) 

b_stop_time_filter_det <- b_stop_time_filter %>% dplyr::select(-c(6,7,8,9,10,11,12))
b_stop_det <- b_stop %>% dplyr::select(c(1,3))

b_merged_time_stop <- merge(b_stop_time_filter_det,b_stop_det, by = "stop_id", all.x = TRUE)

b_merged_all <- merge(b_merged_time_stop,b_trip_filter_det, by = "trip_id", all.y = TRUE)
b_merged_all_det <- b_merged_all %>% dplyr::select(-c(3,8,9))
b_merged_all_det_sort <- b_merged_all_det[order(b_merged_all_det$trip_id, b_merged_all_det$stop_sequence), ]

b_combined_data <- aggregate(. ~ trip_id, b_merged_all_det_sort, FUN = function(x) if(is.numeric(x)) x else unique(x))
b_all_data <- data.frame(lapply(b_combined_data, function(x) if(is.matrix(x)) unname(x) else x))

b_all_data <- b_all_data %>% dplyr::select(-c(1,2,3,6,7))

new_col_names <- c("departure", "arrival", "origin", "destination", "route_id")
colnames(b_all_data) <- new_col_names
index <- c(5,3,4,1,2)
b_all_data <- b_all_data[,index]

b_all_data_split <- split(b_all_data, b_all_data$route_id)

b_data_17 <- b_all_data_split[["L17"]]
b_data_18 <- b_all_data_split[["L18"]]
b_data_19 <- b_all_data_split[["L19"]]

#_______________________________________________________________________________

Pop_workers_filter <- insee_filter %>% dplyr::select(all_of(worker_pop_codes)) 
colnames(Pop_workers_filter) <- c("Commune_id", "Count_Travelers_P20_ACT1564")
Pop_workers_merge <- merge(Pop_workers_filter, code_com, by.x = "Commune_id", all.x = TRUE)
Pop_workers_merge <- Pop_workers_merge[, c("Commune", "Count_Travelers_P20_ACT1564")]

# Calculate the percentage of each zipcode compared to the total count
Pop_workers <- Pop_workers_merge %>%
  mutate(Percentage = Count_Travelers_P20_ACT1564 / sum(Count_Travelers_P20_ACT1564) * 100)

# Add a row at the bottom representing the sum of the count
Pop_workers <- Pop_workers %>%
  summarise(Commune = "Total", Count_Travelers_P20_ACT1564 = sum(Count_Travelers_P20_ACT1564), Percentage = sum(Percentage)) %>%
  bind_rows(Pop_workers, .)
