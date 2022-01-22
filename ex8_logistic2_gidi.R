install.packages("mlbench")
data=data("PimaIndiansDiabetes2", package="mlbench")
data <- na.omit(PimaIndiansDiabetes2)
#logistic regression is better than linear,
#because we want to measure probability to be 1 (diabetic) or 0

data$age_bin=1*(data$age>40)
data

model <- glm(data$diabetes~data$glucose+data$age_bin, data=data, family = binomial)
summary(model)$coef
prob_pos_high=exp(-6.09 + 0.04*data$glucose)
plot(data$glucose,prob_pos_high)
prob_pos_low=exp(-6.09+ 0.04*data$glucose + 1.24*data$age_bin)
plot(data$glucose,prob_pos_low, col=4)
lines(data$glucose,prob_pos_high,type = "p")
title("Logistic Regression Model, blue:age<40,black:age>40")
#researcher was right as we can see from plot


