data=read.csv("wages.csv",header=TRUE)
data$wage=data$ן..wage

###QUESTION_1###
model<-lm(data$lwage~data$educ, data = data)
model
summary(model)
#b1 = 0.05984
model<-lm(data$lwage~data$educ+data$IQ, data = data)
model
summary(model)
#a1 = 0.039120, a2 = 0.005863
#I would trust a1 more, because we have isolated IQ so it wont
#interfere with education (they might correlate)
model<-lm(data$IQ~data$educ, data = data)
model
#mathematical relation is:
#a2*π1+a1=b1
#0.03912+3.3534*0.005863=0.05984

###QUESTION_2###
model<-lm(data$lwage~data$educ+data$exper+data$tenure+data$black)
model
cov(data$educ,data$sibs)
#sibs can use as Instrumental variables estimation, for cov(educ,sibs)!=0
#we would use siblings to make sure cov(educ) is not influenced by wage
install.packages("ivreg", dependencies = TRUE)
model1<-ivreg::ivreg(data$lwage ~ data$educ+data$exper+data$tenure+data$black|data$exper+data$tenure+data$black+data$sibs,data = data)
model1
summary(model1)
step1=lm(data$educ~data$sibs+data$exper+data$tenure+data$black, data = data)
data$predict_educ=predict(step1)
step2=lm(data$lwage~data$predict_educ+data$exper+data$tenure+data$black, data = data)
summary(step2)

###QUESTION_3###
#Wage=x1+x2Educ+x3IQ+x4Friends^2-x5Female-x2Educ*Female+u
