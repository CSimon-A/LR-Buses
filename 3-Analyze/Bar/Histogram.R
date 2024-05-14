
bar_Transport20 <- insee_filter %>%
  pivot_longer(
    cols = c(P20_ACTOCC15P_ILT1, P20_ACTOCC15P_ILT2P, P20_ACTOCC15P_VOITURE),
    names_to = "Variable",
    values_to = "Value")

bar_plot <- ggplot(data = bar_Transport20, aes(x = com_name, fill = Variable)) +
  geom_bar(aes(y = Value), position = "dodge", stat = "identity") +
  labs(x = "Town Name", y = "Variable") +
  ggtitle("Transport 2020") +
  theme_minimal() +
  scale_fill_manual(values = c("blue", "red", "green", "purple", "orange"))

#print(bar_plot)