library(tidyverse)
library(ggrepel)
library(readr)

theme_set(theme_bw())

#Import Data
data <- normalized
view(data)
dim(data)
head(data)

p1<- ggplot(data, aes(x=LogFC, y= -log(p_value, 10))) +
  geom_point() +
  xlab(expression("log"[2]*"FC")) +
  ylab(expression("-log"[10]*"FDR"))

p1


data <- data %>%
  mutate(Expression = dplyr::case_when(LogFC>= 0 & p_value<= .05 ~ "Up-regulated", 
                                       LogFC<= 0 & p_value<= .05 ~ "Down-regulated",
                                       TRUE ~ "Unchanged"))
  
p2<- ggplot(data, aes(x=LogFC, y= -log(p_value, 10))) +
  geom_point(aes(color = Expression)) +
  xlab(expression("log"[2]*"FC")) +
  ylab(expression("-log"[10]*"FDR")) +
  scale_color_manual(values = c("green", "grey50", "firebrick"))
  
p2
  
top_genes<- data %>%
  filter(Expression == "Up-regulated" | Expression == "Down-regulated" )

p3<- p2 + 
  geom_label_repel(data=top_genes, label=top_genes$Genes, size = 2,
                   label.size=NA, fill=NA)
p3
  
  
  
  