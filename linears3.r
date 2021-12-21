install.packages("datarium")
data("marketing", package="datarium")
head(marketing, 4)
cor(marketing$youtube, marketing$sales)
plot(marketing$youtube, marketing$sales)
model<-lm(sales~youtube, data=marketing)
model 
abline(lm(marketing$sales~marketing$youtube), col="blue")
#y=8.43911+0.04754x
#8.43911+4.754=13.19311
#המקדם של יוטיוב משמעותו כמה דולרים יש להשקיע בשיווק ביוטיוב על מנת להתקדם במכירה אחת
summary(model)
#R^2 = 0.6119
#הוא מציג קורולציה סבירה בין השקעה ביוטיוב לשיווק, אך סביר להניח שככל שאשקיע בשיווק כך יעלו המכירות, עדיף מודל שמשווה בין מתאם יוטיוב~שיווק לאמצעי פרסום אחרים
#highest R^2 to lowest: A, C, B, D