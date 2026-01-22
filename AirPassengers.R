install.packages("rlang")
install.packages(c("vctrs", "scales", "lifecycle"))
# --------------------------------------------------
# Load AirPassengers dataset
# --------------------------------------------------
data(AirPassengers)

# Verify the dataset
?AirPassengers
class(AirPassengers)
View(AirPassengers)

# --------------------------------------------------
# Convert the dataset to Data Frame
# --------------------------------------------------
ap_df <- data.frame(
  year = as.numeric(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)
ap_df

# --------------------------------------------------
# Data Frame with Year and Month separately
# --------------------------------------------------
ap_df_months <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(AirPassengers),
  passengers = as.numeric(AirPassengers)
)
ap_df_months

# --------------------------------------------------
# Basic Time Series Plot (Base R)
# --------------------------------------------------
plot(AirPassengers)

# --------------------------------------------------
# Plot with Title, Axis labels, and Color
# --------------------------------------------------
plot(
  AirPassengers,
  type = "l",
  main = "AirPassengers Trend Analysis",
  xlab = "Months",
  ylab = "Number of Passengers",
  col = "red"
)

# --------------------------------------------------
# Plot with Increased Line Width
# --------------------------------------------------
plot(
  AirPassengers,
  type = "l",
  lwd = 1.5,
  main = "AirPassengers Trend Analysis",
  xlab = "Months",
  ylab = "Number of Passengers",
  col = "red"
)

# --------------------------------------------------
# Plot with Points and Grid
# --------------------------------------------------
plot(
  AirPassengers,
  type = "l",
  pch = 16,
  col = "blue"
)
grid()

# --------------------------------------------------
# Using ggplot2 Library
# --------------------------------------------------
install.packages("ggplot2")
library(ggplot2)

# --------------------------------------------------
# ggplot2 Time Series Visualization
# --------------------------------------------------
ggplot(ap_df, aes(x = year, y = passengers)) +
  geom_line(color = "darkgreen", linewidth = 0.6) +
  geom_point(color = "red", size = 0.6) +
  geom_smooth(se = FALSE, color = "orange") +
  labs(
    title = "Trend Analysis of Air Passengers",
    subtitle = "From 1949 to 1960",
    caption = "Source: Built-in AirPassengers Dataset",
    x = "Year",
    y = "Number of Passengers"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 10)
  )
