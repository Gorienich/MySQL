
// החזירו את שמות כל הלקוחות ששמם מתחיל באות B.
SELECT C.name
FROM customers C
WHERE C.name LIKE "B%" OR C.name LIKE "b%"

// אורכים גם בתל אביב גם בירושלים
SELECT C.name 
FROM Customers C, Hotels H1,Reserves R1 , Hotels H2 , Reserves R2
Where C.cid=R1.cid and R1.hid=H1.hid and H1.city='Jerusalim' 
and C.cid=R2.cid and R2.hid=H2.hid and H2.city='Tel aviv'

// לקוחות באילת אבל לא ב holidayIn
select 
C.name
from 
customers C, Reserves R, Hotels H
WHERE 
C.cid = R.cid and H.hid = R.hid and H.city = "eilat"
and C.cid not in( 
SELECT C.cid
FROM
customers C, Reserves R, Hotels H
WHERE
C.cid = R.cid and H.hid = R.hid and H.city = "eilat" and H.name = "HlidayIn");

// לקוחות באילת שהזמינו פחות מ1000 ויותר מ 2000
select *
from 
customers C, Reserves R, Hotels H
WHERE
C.cid = R.cid and H.hid = R.hid and H.city = "eilat" and (H.price<1000 OR H.price>2000);

// שמות כל הלקוחות שהזמינו חופשה משפחתית, הזמנתם
כללה חדר שבו שוהים לפחות 3 אנשים
SELECT C.name
FROM customers C, Reserves R
WHERE
C.cid = R.cid and R.numOfPeople>3;

// החזירו את שמות הלקוחשלא הזמינו חופשה בתאריך 2019.4.1
SELECT C.name
FROM Customers C , Reserves R 	
WHERE C.cid = R.cid AND  R.startDate ='01/04/19';

// החזירו את שמות הלקוחות שלא הזמינו חופשה בתאריך 2019.4.1
SELECT C.name
FROM Customers C , Reserves R 	
WHERE C.cid = R.cid AND  R.startDate !='01/04/19';

/*החזירו את שמות הלקוחות שהזמינו לפחות חופשה אחת במלון באילת' HolidayIn*/

SELECT C.name
FROM Customers C , Reserves R, Hotels H	
WHERE NOT UNIQUE (SELECT C.cid
FROM R.hid = H.hid  
WHERE H.city = "Eilat")

/*ב מלון ספיציפי לקוחות שהזמינו יותר מהזמנה 1*/
SELECT *
FROM Customers C , Reserves R, Hotels H	
WHERE R.hid = H.hid  AND H.name = "holidayIn" and H.city = "Eilat"  HAVING COUNT(R.cid) >1

/*החזירו את שמות הלקוחות שלא הזמינו חופשה במלון ' Isrotel
Agamim 'באילת.*/
select C.name
FROM Customers C , Reserves R, Hotels H	
WHERE C.cid = R.cid AND R.hid = H.hid  AND H.name != "Isrotel Agamim"

/*➢החזירו את שמות המלונות שדירוגם גדול יותר מהדירוג של אחד
ממלונות ישרוטל ברחבי הארץ*/
SELECT H.name, H.city
from  Hotels H
WHERE H.stars>3

/*החזירו את שמות המלונות שדירוגם גדול יותר מהדירוג של כל מלונות
ישרוטל ברחבי הארץ.*/
SELECT H.name, H.city
from  Hotels H
WHERE H.stars > (H.name = "GuestHouse" AND H.city = "Haifa")

		
SELECT H.name 	
FROM Hotels H 	
WHERE H.stars>ANY(SELECT H2.stars 
                 FROM Hotels H2
                 WHERE H2.name = 'GuestHouse')
			
/*➢החזירו עבור כל עיר כמה מלונות בעלות דירוג הגבוה מ-4 יש בה*/
SELECT COUNT(H.city),H.city
FROM Hotels H
WHERE H.rank>4
GROUP BY H.city	

		
/* החזירו עבור כל מלון את שם המלון ואת המחיר המקסימלי לחדר שנגבה
בו, המחיר המקסימלי יוחזר רק במידה והיו 2 עסקאות ומעלה שבוצעו
באותו המלון*/
➢ 	
// לא הבנתי איך לסדר לפי חדר מקסימלי אם אין מחיר של החדר
SELECT H.name , MAX(R.price)
FROM Hotels H , Reserves R, Rooms Ro 
WHERE COUNT(R.hid = H.hid AND R.rid = Ro.rid) > 1

// רוב הפונקציות לא נקלתות בתוכנה כמו:
union UNIQUE EXISTS DISTINCT
			 
