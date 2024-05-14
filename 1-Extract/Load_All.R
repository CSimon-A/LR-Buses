
map <- st_read("0-OG_Data/Iris_CA_LR.geojson")

b_stop <- read.csv("0-OG_Data/bus_stop.csv")
b_route <- read.csv("0-OG_Data/bus_routes.csv")
b_trip <- read.csv("0-OG_Data/bus_trips.csv")
b_stop_time <- read.csv("0-OG_Data/bus_stop_time.csv")

train_time <- read.csv("0-OG_Data/train_timetable.csv")

code_com <- read.csv("0-OG_Data/code_commune.csv")

insee <- read.csv("0-OG_Data/dossier_complet.csv", sep = ";")
travel2work <- read.csv("0-OG_Data/Place_work.csv", sep = ";")

sirene <- read.csv("0-OG_Data/Sirene_17.csv")

naf2008 <- read.dbf("0-OG_Data/naf2008_5_niveaux.dbf", as.is = F)
naf2003 <- read.dbf("0-OG_Data/naf2003_5_niveaux.dbf", as.is = F)
naf1993 <- read.dbf("0-OG_Data/naf1993_5_niveaux.dbf", as.is = F)
naf1973 <- read.csv("0-OG_Data/NAP1973.csv")

nafdef2008 <- read.csv("0-OG_Data/naf2008_liste_n1.csv")
nafdef2003 <- read.csv("0-OG_Data/naf2003_liste_n1.csv")
nafdef1993 <- read.csv("0-OG_Data/naf1993_liste_n1.csv")



save.image(file = "4-Data_Image/Bus_Project_Data.RData")

