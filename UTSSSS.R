#Read in your Data
library(readxl)
setwd("C:/archive")
Data = read.csv("StudentsPerformance.csv", header = TRUE , sep = ",")
Data

#check the packaging
install.packages("ggplot2")
install.packages("dplyr")

#Look at the Top and the Bottom of Your Data
head(Data)
tail(Data)

#Check Your “n”s
nrow(Data)
ncol(Data)
str(Data)

#make a plot
library(ggplot2)
ggplot(Data, aes(x = `math.score`)) +
  geom_histogram(bins = 10, fill = "blue", alpha = 0.7) +
  labs(title = "Distribusi Nilai Matematika", x = "Nilai Matematika", y = "Frekuensi") +
  theme_minimal()

#Try the Easy Solution First
mean_scores=colMeans(Data[, c("math.score", "reading.score", "writing.score")])
median_scores=apply(Data[, c("math.score", "reading.score", "writing.score")], 2, median)

mean_scores
median_scores

#Follow Up
ggplot(Data, aes(x = gender, y = `math.score`)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Perbandingan Nilai Matematika Berdasarkan Jenis Kelamin", x = "Jenis Kelamin", y = "Nilai Matematika") +
  theme_minimal()

