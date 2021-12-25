install.packages("mlbench")
data=data("PimaIndiansDiabetes2", package="mlbench")
data <- na.omit(PimaIndiansDiabetes2)
model <- glm(diabetes~glucose, data=data, family = binomial)
summary(model)$coef
glucose=data$glucose
model1 <- glm(diabetes~pregnant+glucose+pressure+mass+pedigree,
             data=data, family = binomial)
summary(model1)$coef
#probit
glm(formula=diabetes~glucose, family = binomial(link="probit"),data=data)
glm(formula=diabetes~glucose, family = binomial(link="probit"),data = data)
plot(model1)

