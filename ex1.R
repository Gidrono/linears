
data=read.csv("/home/hanoch/Desktop/econometrics/ex1.csv", header = TRUE)
View(data)
data$sugar
hist(data$sugar,2)
hist(data$sugar, 5)
hist(data$sugar, 3)
plot(data$sugar)
mean(data$sugar)
median(data$sugar)
quantile(data$sugar, probs=c(10/100))

quantile(data$sugar, probs=c(90/100))
range(data$sugar)
max(data$sugar)-min(data$sugar)
IQR(data$sugar)
var(data$sugar)
sd(data$sugar)
data_air=datasets::airquality
plot(data_air$Wind, data_air$Temp)
cor(data_air$Wind, data_air$Temp)
abline(lm(Wind~Temp, data=data_air), col="blue")
