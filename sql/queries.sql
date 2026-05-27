INSERT INTO Stores VALUES ('E05EE01', 'N/A', 'I002', TO_DATE('01/10/2022', 'DD/MM/YYYY'), 
TO_DATE('01/10/2023', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('A01AA01', 'N/A', 'I001', TO_DATE('01/10/2020', 'DD/MM/YYYY'), 
TO_DATE('01/10/2023', 'DD/MM/YYYY'));

SELECT 
 M.MedicineID, M.Name AS Medicine_Name, S.Expiry, I.InventoryID, 
 (SELECT B.Name FROM BRANCH B WHERE B.BranchID = I.B_ID) AS Branch_Name
FROM 
 MEDICINE M, STORES S, INVENTORY I
WHERE 
 M.MedicineID = S.mID
 AND S.inID = I.InventoryID
 AND S.Expiry < SYSDATE;

SELECT 
 Su.Name AS Supplier_Name, Su.Email AS Supplier_Email, 
 M.MedicineID, M.Name AS Medicine_Name
FROM 
 SUPPLIER Su, MEDICINE M, Supplies S
WHERE 
 Su.SupplierID = S.SID
AND S.MID= M.MedicineID
AND M.MedicineID IN (
 SELECT M.MedicineID
 FROM MEDICINE M, STORES S
 WHERE M.MedicineID = S.mID AND S.Expiry < SYSDATE
 );

DELETE FROM STORES S 
WHERE S.mID IN ( 
SELECT M.MedicineID FROM MEDICINE M WHERE M.MedicineID = S.mID AND S.Expiry < 
SYSDATE );

ALTER TABLE CUSTOMER DROP CONSTRAINT PK_CUSTOMER ; 
ALTER TABLE CUSTOMER MODIFY Bill_ID INT NULL;
INSERT INTO CUSTOMER VALUES ('Evelyn', 'Harper', NULL, '+96111100000', 
TO_DATE('05/05/2000', 'DD/MM/YYYY'));

INSERT INTO BILLING_INVOICE VALUES (22, '123456789', TO_DATE('06/11/2024', 
'DD/MM/YYYY'), 20.00, 'paid', 'Evelyn', 'Harper', 15.00);
UPDATE CUSTOMER
SET Bill_ID = 22
WHERE Fname = 'Evelyn' AND Lname ='Harper';
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (Fname, Lname, 
Bill_ID);

INSERT INTO Item_ID VALUES (22, 'SC1001');
INSERT INTO Payment_method VALUES (22, 'Cash');
INSERT INTO Includes Values(22,'N/A','SC1001');

ALTER TABLE CUSTOMER DROP CONSTRAINT PK_CUSTOMER ;
INSERT INTO CUSTOMER VALUES ('Omar', 'Farouq', NULL, '+96170250430', 
TO_DATE('05/05/2000', 'DD/MM/YYYY'));
INSERT INTO BILLING_INVOICE VALUES (23, '123456789', TO_DATE('08/11/2024', 
'DD/MM/YYYY'), 9.00, 'paid', 'Omar', 'Farouq', 9.00);
UPDATE CUSTOMER
SET Bill_ID = 23
WHERE Fname = 'Omar' AND Lname ='Farouq';
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (Fname, Lname, 
Bill_ID);

INSERT INTO PRESCRIPTION VALUES (22, TO_DATE('12/12/2024', 'DD/MM/YYYY'), 2, 
TO_DATE('12/02/2025', 'DD/MM/YYYY'), '+96111234576', 'Dr. Hassan', 'DL65432', 30, 'Omar', 
'Farouq');

INSERT INTO contains2 VALUES (22, 'I09II01');

INSERT INTO Item_ID VALUES (23, 'I09II01');
INSERT INTO Payment_method VALUES (23, 'Cash');
INSERT INTO includes VALUES (23, 'I09II01', 'N/A');

SELECT 
 E.Fname, 
 E.Lname, 
 B.Name AS Branch_Name
FROM 
 EMPLOYEE E, 
 Branch B
WHERE 
 E.B_id = B.BranchID;

SELECT 
 M.Name, 
 (SELECT COUNT(*) * M.Price 
 FROM INCLUDES I
 WHERE I.mID = M.MedicineID) AS Total_Sales
FROM 
 MEDICINE M;

INSERT INTO EMPLOYEE VALUES ('660099009', 'Hamad', 'Awada', TO_DATE('05/03/1980', 
'DD/MM/YYYY'), 'M', 'Manager', NULL, 7000.00, '+96180456890', 'johndoe@healerdealer.com', 
'Bakaata',00, 'Souq Bakaata St', 101, NULL, TO_DATE('01/01/2024', 'DD/MM/YYYY'), NULL, 0);

INSERT INTO Branch VALUES ('B004', 'Zalka Branch', '+96155667788', 'zalka@healerdealer.com', 
'Zalka Hwy', 'Mount Lebanon', 'Hamad Awada', '660099009');

UPDATE EMPLOYEE
SET B_id= 'B004'
WHERE SSN= '660099009'

INSERT INTO Dosage_Instructions (PrescriptionID, Dosage_instruction)
VALUES (1, 'Take 1 tablet every 6 hours for 3 days');

SELECT 
 C.Fname,
 C.Lname,
 M.Name,
 D.Dosage_Instruction
FROM 
 Dosage_Instructions D,
 CUSTOMER C,
 MEDICINE M,
 PRESCRIPTION P,
 CONTAINS2 CT
WHERE 
 P.CF_name = C.Fname
 AND P.CL_name = C.Lname
 AND P.PrescriptionID = D.PrescriptionID
 AND CT.PID = P.PrescriptionID
 AND CT.mid = M.MedicineID
 AND C.Lname = 'Jaber'
 AND C.Fname = 'Ali';

SELECT 
 C.Fname, 
 C.Lname, 
 C.Phone_number, 
 M.Name AS Medicine, 
 B.Date_issued
FROM 
 CUSTOMER C, 
 BILLING_INVOICE B, 
 INCLUDES I, 
 MEDICINE M, 
 SUPPLIES S
WHERE 
 C.Bill_ID = B.InvoiceID
 AND B.InvoiceID = I.bID
 AND I.mID = M.MedicineID
 AND M.MedicineID = S.mID
 AND M.MedicineID = 'G07GG01'
 AND S.supply_date IN TO_DATE('05/12/2024', 'DD/MM/YYYY');

SELECT 
 S.Name AS Supplier, 
 P.Payment_term, 
 SUM(SU.Quantity_supplied * SU.Price_per_unit) AS Total_Payment
FROM 
 SUPPLIER S, 
 SUPPLIES SU, 
 Payment_term P
WHERE 
 S.SupplierID = SU.sID
 AND S.SupplierID = P.SupplierID
 AND SU.Supply_date BETWEEN TO_DATE('01/11/2024', 'DD/MM/YYYY') AND 
TO_DATE('20/12/2024', 'DD/MM/YYYY')
GROUP BY 
 S.SupplierID, S.Name, P.Payment_term;

INSERT INTO MEDICINE VALUES ('J01JJ01', 'Oxycodone', 'Pain reliever', 'T', 20.00, 'PharmaLeb');
INSERT INTO MEDICINE VALUES ('K02KK01', 'Hydromorphone', 'Pain reliever', 'T', 25.00, 'Medico');
INSERT INTO MEDICINE VALUES ('L03LL01', 'Fentanyl', 'Pain reliever', 'T', 30.00, 'HealthPlus');
INSERT INTO MEDICINE VALUES ('M04MM01', 'Methadone', 'Opioid analgesic', 'T', 22.00, 
'PharmaLeb');
INSERT INTO MEDICINE VALUES ('N05NN01', 'Lorazepam', 'Benzodiazepine', 'T', 18.00, 'Medico');

INSERT INTO PRESCRIPTION VALUES (11, TO_DATE('05/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('05/12/2024', 'DD/MM/YYYY'), '123456789', 'Dr. Fadi Kassem', 'DR12345', 30, 'Sami', 
'Haddad');
INSERT INTO PRESCRIPTION VALUES (12, TO_DATE('10/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('10/12/2024', 'DD/MM/YYYY'), '123456789', 'Dr. Fadi Kassem', 'DR12345', 30, 'Sami', 
'Haddad');
INSERT INTO PRESCRIPTION VALUES (13, TO_DATE('15/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('15/12/2024', 'DD/MM/YYYY'), '123456789', 'Dr. Fadi Kassem', 'DR12345', 30, 'Sami', 
'Haddad');
INSERT INTO PRESCRIPTION VALUES (14, TO_DATE('20/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('20/12/2024', 'DD/MM/YYYY'), '123456789', 'Dr. Fadi Kassem', 'DR12345', 30, 'Sami', 
'Haddad');

INSERT INTO PRESCRIPTION VALUES (15, TO_DATE('12/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('12/12/2024', 'DD/MM/YYYY'), '987654321', 'Dr. Hassan Amin', 'DR98765', 15, 'Rita', 
'Khalil');
INSERT INTO PRESCRIPTION VALUES (16, TO_DATE('17/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('17/12/2024', 'DD/MM/YYYY'), '987654321', 'Dr. Hassan Amin', 'DR98765', 15, 'Rita', 
'Khalil');
INSERT INTO PRESCRIPTION VALUES (17, TO_DATE('20/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('20/12/2024', 'DD/MM/YYYY'), '987654321', 'Dr. Hassan Amin', 'DR98765', 15, 'Rita', 
'Khalil');

INSERT INTO PRESCRIPTION VALUES (18, TO_DATE('22/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('22/12/2024', 'DD/MM/YYYY'), '112233445', 'Dr. Layla Zein', 'DR23456', 30, 'Fadi', 
'Kassem');
INSERT INTO PRESCRIPTION VALUES (19, TO_DATE('24/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('24/12/2024', 'DD/MM/YYYY'), '112233445', 'Dr. Layla Zein', 'DR23456', 30, 'Fadi', 
'Kassem');
INSERT INTO PRESCRIPTION VALUES (20, TO_DATE('25/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('25/12/2024', 'DD/MM/YYYY'), '112233445', 'Dr. Layla Zein', 'DR23456', 30, 'Fadi', 
'Kassem');
INSERT INTO PRESCRIPTION VALUES (21, TO_DATE('28/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('28/12/2024', 'DD/MM/YYYY'), '112233445', 'Dr. Layla Zein', 'DR23456', 30, 'Fadi', 
'Kassem');

INSERT INTO BILLING_INVOICE VALUES (11, '123456789', TO_DATE('05/11/2024', 
'DD/MM/YYYY'), 20.00, 'paid', 'Sami', 'Haddad', 20.00);
INSERT INTO BILLING_INVOICE VALUES (12, '123456789', TO_DATE('10/11/2024', 
'DD/MM/YYYY'), 20.00, 'paid', 'Sami', 'Haddad', 20.00);
INSERT INTO BILLING_INVOICE VALUES (13, '123456789', TO_DATE('15/11/2024', 
'DD/MM/YYYY'), 20.00, 'paid', 'Sami', 'Haddad', 20.00);
INSERT INTO BILLING_INVOICE VALUES (14, '123456789', TO_DATE('20/11/2024', 
'DD/MM/YYYY'), 20.00, 'paid', 'Sami', 'Haddad', 20.00);

INSERT INTO BILLING_INVOICE VALUES (15, '987654321', TO_DATE('12/11/2024', 
'DD/MM/YYYY'), 25.00, 'paid', 'Rita', 'Khalil', 25.00);
INSERT INTO BILLING_INVOICE VALUES (16, '987654321', TO_DATE('17/11/2024', 
'DD/MM/YYYY'), 25.00, 'paid', 'Rita', 'Khalil', 25.00);
INSERT INTO BILLING_INVOICE VALUES (17, '987654321', TO_DATE('20/11/2024', 
'DD/MM/YYYY'), 25.00, 'paid', 'Rita', 'Khalil', 25.00);

INSERT INTO BILLING_INVOICE VALUES (18, '112233445', TO_DATE('22/11/2024', 
'DD/MM/YYYY'), 30.00, 'paid', 'Fadi', 'Kassem', 30.00);
INSERT INTO BILLING_INVOICE VALUES (19, '112233445', TO_DATE('24/11/2024', 
'DD/MM/YYYY'), 30.00, 'paid', 'Fadi', 'Kassem', 30.00);
INSERT INTO BILLING_INVOICE VALUES (20, '112233445', TO_DATE('25/11/2024', 
'DD/MM/YYYY'), 30.00, 'paid', 'Fadi', 'Kassem', 30.00);
INSERT INTO BILLING_INVOICE VALUES (21, '112233445', TO_DATE('28/11/2024', 
'DD/MM/YYYY'), 30.00, 'paid', 'Fadi', 'Kassem', 30.00);

INSERT INTO contains2 VALUES (11, 'J01JJ01'); 
INSERT INTO contains2 VALUES (12,'J01JJ01');
INSERT INTO contains2 VALUES (13, 'K02KK01');
INSERT INTO contains2 VALUES (14, 'K02KK01'); 

INSERT INTO contains2 VALUES (15, 'K02KK01'); 
INSERT INTO contains2 VALUES (16, 'L03LL01'); 
INSERT INTO contains2 VALUES (17, 'N05NN01');

INSERT INTO contains2 VALUES (18, 'N05NN01');
INSERT INTO contains2 VALUES (19, 'K02KK01');
INSERT INTO contains2 VALUES (20, 'L03LL01'); 
INSERT INTO contains2 VALUES (21, 'N05NN01'); 

SELECT 
 C.Fname, 
 C.Lname, 
 C.Phone_number, 
 COUNT(P.PrescriptionID) AS Prescription_Count, 
 MAX(B.Date_issued) AS Last_Purchase_Date
FROM 
 CUSTOMER C, 
 PRESCRIPTION P, 
 BILLING_INVOICE B, 
 MEDICINE M, 
 contains2 CT
WHERE 
 C.Fname = P.CF_name
 AND C.Lname = P.CL_name
 AND P.PrescriptionID = CT.pID
 AND CT.mID = M.MedicineID
 AND M.Prescription_required = 'T'
 AND B.InvoiceID = C.Bill_ID
 AND B.Date_issued > (CURRENT_DATE - INTERVAL '30' DAY)
GROUP BY 
 C.Fname, C.Lname, C.Phone_number
HAVING 
 COUNT(P.PrescriptionID) > 3
ORDER BY 
 Last_Purchase_Date DESC;
