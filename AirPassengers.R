#Load AirPassengers dataset
data(AirPassengers)

#Verify the dataset
?AirPassengers
class(AirPassengers)
View(AirPassengers)

#Convert the datset to DataFrame
ap_df <- data.frame(
  year <- time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)
ap_df

#Data Frame with Years and months seperately
ap_df_months <- data.frame(
  year= floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)
ap_df_months

#Basic Plot
plot(AirPassengers)

# Plot with Tutle, Axis labels and color
plot(AirPassengers,
     type = 'l',
     main = "AirPassengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "red"
     )
# Changing the line width and point of contact
plot(AirPassengers,
     type = 'l',
     lwd = 1.5,
     main = "AirPassengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "red"
)

plot(AirPassengers,
     type = 'l',
     pch = 16,
     col = "blue"
)
grid()

# USing GGPLOT2 Library
#Importing the library ggplot2
library(ggplot2)

# A basic grid with x & y axis
ggplot(ap_df,
       aes(x=year, y=passenger))+
  geom_line(color='darkgreen',linewidth = 0.5)+
  labs(
        title = 'Trend Analysis of Air Passengers',
        subtitle = 'From 1940 - 1960',
        caption = 'Using Built-in Air Passengers dataset',
        x = 'Months',
        y = 'No.of Pssengeres')+
  geom_point(color = 'red',size = 0.5)+
  geom_smooth(se = FALSE,color = 'orange')+
  theme_minima()+
  theme(
    plot.title = element_text(face="bold",size = 14),
    plot.subtitle = element_text(size = 10))
