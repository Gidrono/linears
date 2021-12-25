data=read.csv("ex8minwage.csv",header=TRUE)
data
PA1 = mean(data$fte[data$period==1&data$state==0])
NJ1 = mean(data$fte[data$period==1&data$state==1])
PA2 = mean(data$fte[data$period==2&data$state==0])
NJ2 = mean(data$fte[data$period==2&data$state==1])
PA1-PA2
NJ1-NJ2
(PA1-PA2)-(NJ1-NJ2)
#III: gap is the differences in wages between periods in both states added
#IV: in condition that there was no other difference between states
#who might have caused the gap
PA1 = mean(data$dfte[data$period==1&data$state==0])
NJ1 = mean(data$dfte[data$period==1&data$state==1])
PA2 = mean(data$dfte[data$period==2&data$state==0])
NJ2 = mean(data$dfte[data$period==2&data$state==1])
PA1-PA2
NJ1-NJ2
(PA1-PA2)-(NJ1-NJ2)
#I repeated for dfte, result is 0 as expected, because dfte is the gap

data$treat=1*(data$state==1)
data$post=1*(data$period==2)
data$treat_post=1*(data$treat*data$post)
model <- lm(data$wage_st~data$treat+data$post+data$treat_post, data=data)
summary(model)$coef
model <- lm(data$wage_st~data$treat+data$post+data$treat_post+data$co_owned, data=data)
summary(model)$coef
#model didnt dramatically changed after we added co_owned variable
#I didnt expect it to change because it was good to supervise
#how good is the prediction.

