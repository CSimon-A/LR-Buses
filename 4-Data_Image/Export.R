
#save.image(file = "4-Data_Image/Bus_Project_Backup.RData")

all_objects <- ls()
exclude_objects <- c('map','b_stop','b_route', 'b_trip', 'b_stop_time', 
                     'train_time', 'code_com',  'insee', 'travel2work',
                     'sirene','naf2008', 'naf2003', 'naf1993', 'naf1973',
                     'nafdef2008', 'nafdef2003', 'nafdef1993')

objects_to_save <- setdiff(all_objects, exclude_objects)
save(list = objects_to_save, file = "4-Data_Image/Bus_Project_short.RData")