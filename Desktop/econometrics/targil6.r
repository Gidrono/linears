data=read.csv("/home/WAGE2.CSV",header=TRUE)
hist(data$wage)
#התפלגות לא סימטרית והדבר נראה סביר כי יש מעט אנשים עם משכורות מאוד גבוהות
data$lwage = log(data$wage)
hist(data$lwage)
model<-lm(data$wage~data$educ+data$exper+data$IQ+data$age, data = data)
model
#בהנחה שאנחנו בודקים את הקשר בין חינוך לשכר, המקדם בטא1 מודד את השפעת משתנה הטיפול (חינוך)
#יתר הבטאות (למעט בטא 0) הם מקדמי משתני הבקרה
summary(model)
#אף אחד, כולם בין אפס לבין אחוז
model_1<-lm(data$educ~data$exper+data$IQ+data$age, data = data)
model_1
data$e_educ=resid(model_1)
model_2=lm(data$lwage~data$e_educ, data = data)
model_2
#שאלה 2:
#ההשלכה מהקבוצה ההומוגנית של הורות הילדות היא שקיימת הטיית בחירה
#הסוקר היה צריך להשתמש בהקצאה מקרית כך שלא כל התצפיות יהיו חלק מאותה קבוצה
#באמצעות דגימת קבוצות נוספות (הכללה)