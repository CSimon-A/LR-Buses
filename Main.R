
library(sf)
library(ggplot2)
library(dplyr)
library(patchwork)
library(tidyr)
library(ggrepel)
library(tidyverse)
library(chorddiag)
library(RColorBrewer)
library(igraph)
library(networkD3)
library(rmarkdown)
library(heatmaply)
library(htmlwidgets)
library(foreign)
library(sp)
library(gridExtra)
library(MASS)
library(reshape2)
library(scales)
library(htmlwidgets)

rm(list= ls()[!(ls() %in% c('map','b_stop','b_route', 'b_trip', 'b_stop_time', 
                            'train_time', 'code_com',  'insee', 'travel2work',
                            'sirene','naf2008', 'naf2003', 'naf1993', 'naf1973',
                            'nafdef2008', 'nafdef2003', 'nafdef1993'))])

#__EXT__________________________________________________________________________

#source("1-Extract/Load_All.R")
source("1-Extract/Bus_Line_Setup.R")
source("1-Extract/AutoBus_Stops.R")

#__TRA__________________________________________________________________________

source("2-Transform/Filter_Codes.R")
source("2-Transform/Filtered_Data.R")

#__ANA__________________________________________________________________________

source("3-Analyze/Dataf/Bus_Stop_Count.R")

source("3-Analyze/Dataf/T2W/Setup.R")
source("3-Analyze/Dataf/T2W/Fill.R")
source("3-Analyze/Dataf/T2W/Rename.R")


source("3-Analyze/Dataf/LR_Calc.R")
source("3-Analyze/Dataf/Local_Calc.R")

source("3-Analyze/Sirene/Distance_bus.R")
source("3-Analyze/Sirene/Distance_bus_all.R")


#__GRA__________________________________________________________________________

source("3-Analyze/Chord/All_Chord.R")
source("3-Analyze/Heat/All_Heat.R")


source("3-Analyze/Bar/Histogram.R")

source("3-Analyze/Map/Basic_Map.R")
source("3-Analyze/Map/Other_Maps.R")
source("3-Analyze/Map/T2W_Map.R")
source("3-Analyze/Map/Final_Stops.R")
source("3-Analyze/Map/Sirene_Count.R")
source("3-Analyze/Map/Sirene_Map.R")

source("5-Widgets/Export.R")

source("7-IE/Export.R")

source("4-Data_Image/Export.R")





#______________________________________________________________________________

print(map_plot_grad)

bus_lines_auto_5$stop_long
print(map_plot_500m_a)
View(bus_lines_auto_5)
View(bus_lines_auto_5_a)

print(map_plot_f)
print(map_plot_s)
print(map_plot2_s)
print(map_plot2_s_pop)

View(result4)
View(commune_df_OG)

View(Transport20_filter_detail)
View(commune_df_car_OG)
View(commune_df_bus_OG)

print(chord_commune)
print(chord_commune_log)

#dendrogram = "none",scale = "column"
print(heat_commune_den)
print(heat_commune_den_col)
print(heat_commune)
 
#heat with car bus (need to make a new df with percentages)

#__NEW__________________________________________________________________________






