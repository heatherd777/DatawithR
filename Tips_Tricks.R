#RStudio tips and tricks

#fold part of the R code ----
data <- normalized
dim(auto)
head(data)
# stop here ----

#Use the filter to clear only some of the environment variables
#Use rm() to clear only some of hte environment variables
#Command + Option + down arrow to duplicate a line
# save your plots
p1
dev.print(tiff, "name.tiff", compression = "lzw", res=300, height=10, width=10, 
          units = "cm")
dev.print(png, "name.png",  res=300, height=10, width=10, units="cm")   

#get the file path of what you are doing
getwd()
