library(tidyverse)
library(cowplot)

#Load data
data_fluorescence <- read_csv("data/data.csv")
data_bioluminescence <- read_csv("data/data_luciferases.csv")

#Tidy data
data_fluorescence_tidy_B <- gsub(c("N.D."), "1", data_fluorescence$Brightness)
data_fluorescence_tidy <- mutate(data_fluorescence, Brightness = as.numeric(data_fluorescence_tidy_B))

#Plot ggplot
graph <- ggplot(data_fluorescence_tidy, 
                aes(x=Ex, y=Em, colour = Class, size = Brightness)) + 
  geom_point() +
  geom_vline(data = data_bioluminescence, aes(xintercept = Emission, 
             color = Group, size=4, alpha = 0.3)) +
  labs(title="", x = "Excitation (nm)", y = "Emission (nm)") +
  ylim(300, 800) +
  xlim(300, 800)
graph