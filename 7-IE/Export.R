write.csv(bus_lines_auto_all, file = "7-IE/Bus_Business_Count.csv", row.names = FALSE)
write.csv(b_all_data, file = "7-IE/Bus_Schedules.csv", row.names = FALSE)
write.csv(b_data_17, file = "7-IE/Bus17_Schedule.csv", row.names = FALSE)
write.csv(b_data_18, file = "7-IE/Bus18_Schedule.csv", row.names = FALSE)
write.csv(b_data_19, file = "7-IE/Bus19_Schedule.csv", row.names = FALSE)

write.csv(train_time, file = "7-IE/Train_Schedule.csv", row.names = FALSE)

write.csv(Pop_workers, file = "7-IE/Worker_Count_INSEE.csv", row.names = FALSE)
write.csv(Pop_workers_t2w, file = "7-IE/Worker_Count_T2W.csv", row.names = FALSE)