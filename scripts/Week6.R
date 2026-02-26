# Load & Understand the Data Set
library(ggplot2)
data(diamonds)
install.packages("ggplot2")  
library(ggplot2)
str(diamonds)
dim(diamonds)
?diamonds

# Very Basic Scatter
plot(diamonds$carat, diamonds$price)

# Improved Scatter
plot(diamonds$carat, diamonds$price,
     col = rgb(0,0,1,0.1),
     pch = 16,
     main = "Scatter Plot : Carat vs Price")

# Hexbin using Base R
install.packages("hexbin")   
library(hexbin)

hb <- hexbin(diamonds$carat, diamonds$price, xbins = 40)
plot(hb, main = "Hexbin plot")

# Basic Hexbin using ggplot2
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex()
# Labeled Hexbin Plot
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  labs(title="Hexagon Bining:Diamond Strucure",x="carat",y="price")+
  theme_minimal()

# Control Hexagon Density
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=40)+
  scale_fill_gradient(low="lightgreen",high="red")+
  theme_minimal()

# Color Meaning
# Light-> Fewer Diamonds
# Dark -> dense Region

#Professional Palette (Virdis)
ggplot(diamonds,aes(carat,price))+geom_hex(bins=35)+scale_fill_viridis_c()+
  theme_minimal()
