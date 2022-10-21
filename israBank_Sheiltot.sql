//1 .כתבו שאילתה המחזירה את ת.ז, שם ושם משפחה של כל הלקוחות
הוותיקים של בנק הפועלים, לקוח ותיק הוא לקוח שגילו מעל 75//
select CID , FName_W, LName_W
FROM Clients C, Bank B, AccountHolders A, Falial F
WHERe  B.NumBank = F.NumBank and A.FNum = F.FNum and A.Ac_CID=C.CID AND B.name = 'DISKONT' and YEAR(C.DateOfBirth) < 1947



//2 .כתבו שאילתה המחזירה את מספרי כל החשבונות שנמצאות ביתרת חובה
גדולה מ 10000( ₪ כלומר פחות מ 10000 )-בבנק לאומי.//
select NumAccount
FROM Account A, Bank B
WHERE A.NumBank = B.NumBank and B.name = 'benLeumi' AND A.CurrentAccountBalance < -10000



//3 .כתבו שאילתה המחזירה עבור כל סניף בבנק דיסקונט כמה חשבונות
קיימים בו.//
select COUNT(*)
FROM Account A,Bank B, falial F
WHERE B.NumBank = F.NumBank and F.FNum = A.FNum AND A.NumBank = F.NumBank and
B.name = 'DISKONT'
GROUP BY(F.FNum)



//4 .בנק לאומי חוגג יום הולדת 70 בתאריך.4.15 ומעוניין לחלק מתנות לכל
לקוחות הבנק שחוגגים יום הולדת באותו התאריך. כתבו שאילתה המחשבת
כמה מתנות צריך להזמין.//
select COUNT(CID),FName_W
FROM  Clients C, Bank B, AccountHolders A
WHERE B.name = 'benleumi' and B.NumBank = A.NumBank AND A.Ac_CID = C.CID and C.DateOfBirth LIKE ('_%04/15')




//5 .כתוב שאילתה המחזירה את ת.ז והשם של כל הלקוחות בני פחות מ 18
שנים בכל הבנקים, ללא כפילויות.//
SELECT DISTINCT (C.FName_W ),CID   
FROM Clients C, accountholders A 
WHERE A.Ac_CID = C.CID AND YEAR(C.DateOfBirth) > 2004



//6 .אשתו של מנהל הסניף בבנק דיסקונט סניף מספר 52 מחפשת שם ייחודי
לבן\לבת שלה, היא מבקשת מבעלה להביא רשימת שמות של כל לקוחות
הסניף על מנת לבחור שם. אנא צרו רשימת שמות ללא כפילויות של כל
הלקוחות בסניף זה.//
 SELECT  DISTINCT (C.FName_W)
FROM Clients C, AccountHolders A,Bank B
WHERE C.CID = A.Ac_CID and A.FNum = 1 AND A.NumBank = 10





//7.החזירו את ת.ז של הלקוחות שמנהלים חשבון גם בבנק לאומי וגם בבנק
פועלים//
SELECT C.CID
FROM Clients C, AccountHolders AH1,AccountHolders AH2, Bank B1 , Bank B2
WHERE  C.CID=AH1.Ac_CID 
       AND AH1.NumBank= B1.NumBank 
       AND B1.Name='benleumi' 
       AND C.CID=AH2.Ac_CID 
	   AND AH2.NumBank= B2.NumBank 
	   AND B2.Name='hapoalim'

			
//8 .החזירו את מספר החשבון של כל הלקוחות בסניף 13 בבנק הבינלאומי//
SELECT A.NumAccount
FROM Bank b, Falial F, Account A
WHERE b.name= 'benleumi' and F.FNum= 1
      AND b.NumBank= F.NumBank 
	  AND F.NumBank = A.NumBank 
	  AND F.FNum = A.Fnum
	  AND  A.CurrentAccountBalance>5000 and A.CurrentAccountBalance<15000

//9.החזירו את השם ומספר ת.ז של הלקוחות שמנהלים יותר מחשבון בנק אחד//

SELECT *
FROM  Bank b, Falial F, Clients C, AccountHolders Ac
WHERE b.NumBank = F.NumBank
      AND F.NumBank = Ac.NumBank
	  AND F.FNum = Ac.FNum
	  AND Ac.Ac_CID = C.CID 
      HAVING COUNT( Ac.Ac_CID)>1


//10//

SELECT C.FName_W
FROM AccountHolders AH , Clients C , Account A
WHERE C.CID=AH.Ac_CID AND AH.NumAccount=A.NumAccount AND A.CurrentAccountBalance>15000 
UNION
SELECT C.FName_W
FROM AccountHolders AH , Clients C , Account A
WHERE C.CID=AH.Ac_CID AND AH.NumAccount=A.NumAccount AND (A.BalanceDepositsAndSavings>15000)

//11.//

SELECT B.name, F.FNum, F.ID_Maneger, M.FName_W, M.LName_W
FROM Bank B, Falial F , Manager M
WHERE B.NumBank = F.NumBank AND M.ID_Maneger = F.ID_Maneger

/*12  error having count cant translate*/

SELECT B.NumBank, F.FNum
FROM   Bank B, Falial F , AccountHolders AH, Clients C
WHERE B.NumBank = F.NumBank
      AND F.NumBank = AH.NumBank
      AND F.FNum = AH.FNum
      AND AH.Ac_CID = C.CID
      AND AH.NumAccount = C.NumAccount
      HAVING COUNT (C.CID)>2	  

