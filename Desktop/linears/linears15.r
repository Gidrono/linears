data=read.csv("wages.csv",header=TRUE)
data$wage=data$ן..wage
model<-lm(data$lwage~data$educ, data = data)
model
summary(model)
model<-lm(data$lwage~data$educ+data$IQ, data = data)
model
summary(model)
model<-lm(data$IQ~data$educ, data = data)
model
model<-lm(data$lwage~data$educ+data$exper+data$tenure+data$black)
model
tsls1<-lm(data$educ~data$sibs)
summary(tsls1)
cov(data$educ,data$sibs)
install.packages("ivreg", dependencies = TRUE)
model1<-ivreg::ivreg(data$lwage ~ data$educ+data$exper+data$tenure+data$black|data$exper+data$tenure+data$black+data$sibs,data = data)
model1
summary(model1)
step1=lm(data$educ~data$sibs+data$exper+data$tenure+data$black, data = data)
data$predict_educ=predict(step1)
step2=lm(data$lwage~data$predict_educ+data$exper+data$tenure+data$black, data = data)
summary(step2)

