#PCA plot script

setwd("~/vcf_project_week3/step3_analysis/RESULTS/")
#load required packages
library(ggplot2)
library(plotly)

#read plink2 eigenvector file
rk_df <- read.table("pca_redknots.txt")

#check dimensions
dim(rk_df)
#rename dataframe as it has no header...
colnames(rk_df) = c("FID", "IID", paste("PC", seq(10), sep = ""), "Population")
#extract the most informative PCAs
pca_df <- rk_df[c(3,4,5,13)]
#plot the data using ggplot2, use different colors for different populations, use rainbow() color code
#creates interactive 2D plot of the data with coordinates and population popping up when hovering over the plot with the cursor
gg1 <- ggplot(as.data.frame(pca_df), aes(x=PC1, y=PC2, fill=Population))
gg1 <- gg1  + geom_point(aes(colour=factor(Population)))
gg1 <- gg1 + scale_color_manual(name="Population", values=rainbow(8)) 
ggplotly(gg1, ani.width= 1000, ani.height=520)
#creates interactive 3D plot of the data using the 3 most relevant PCAs
p <- plot_ly(pca_df, x = ~PC1, y = ~PC2, z = ~PC3, colors = rainbow(8), text = rk_df[,13]) %>% # Again the symbol "%>%" is the equivalent of the pipe in bash. You can use the option "text" to define the option that will be displayed on each point (when you bring the mouse cursor close to it)
  add_markers() %>% 
  layout(scene = list(xaxis = list(title = 'PC1'), # Add the name of the axes
                      yaxis = list(title = 'PC2'),
                      zaxis = list(title = 'PC3')))
p
