-- Inserting Values:

-- 1. BRANCH:
INSERT INTO BRANCH VALUES ('B001', 'Hamra HD Branch', '+96119876543', 
'hamra@healerdealer.com', 'Hamra Street', 'Beirut', 'Rami Haddad', NULL);
INSERT INTO BRANCH VALUES ('B002', 'Bliss HD Branch', '+96119987654', 
'bliss@healerdealer.com', 'Bliss St', 'Beirut', 'Hassan Amin', NULL);
INSERT INTO BRANCH VALUES ('B003', 'Achrafieh HD Branch', '+96117123456', 
'achrafieh@healerdealer.com', 'Achrafieh St', 'Beirut', 'Samir Khalil', NULL);

-- 2. EMPLOYEE:
INSERT INTO EMPLOYEE VALUES ('123456789', 'Rami', 'Haddad', TO_DATE('12/02/1985', 
'DD/MM/YYYY'), 'M', 'Manager', NULL, 2000.00, '+96112345678', 'rami.haddad@healerdealer.com', 
'Beirut', 1, 'Hamra St', 3, 'B001', TO_DATE('01/01/2022', 'DD/MM/YYYY'), NULL, 40);
INSERT INTO EMPLOYEE VALUES ('987654321', 'Noura', 'Elia', TO_DATE('05/06/1990', 
'DD/MM/YYYY'), 'F', 'Cashier', NULL, 1200.00, '+96176345678', 'noura.elia@healerdealer.com', 
'Beirut', 5, 'Verdan St', 5, 'B002', TO_DATE('15/07/2022', 'DD/MM/YYYY'), NULL, 35);
INSERT INTO EMPLOYEE VALUES ('112233445', 'Fadi', 'Kassem', TO_DATE('23/08/1980', 
'DD/MM/YYYY'), 'M', 'Accountant', NULL, 2500.00, '+96171234567', 'fadi.kassem@healerdealer.com', 
'Beirut', 10, 'Achrafieh St', 3, 'B003', TO_DATE('01/02/2023', 'DD/MM/YYYY'), NULL, 45);
INSERT INTO EMPLOYEE VALUES ('223344556', 'Layla', 'Zein', TO_DATE('16/12/1987', 
'DD/MM/YYYY'), 'F', 'Pharmacist', 'PH654321', 1800.00, '+96174567890', 
'layla.zein@healerdealer.com', 'Beirut', 50, 'Karatina St', 4, 'B001', TO_DATE('05/03/2022', 
'DD/MM/YYYY'), NULL, 40);
INSERT INTO EMPLOYEE VALUES ('334455667', 'Hassan', 'Amin', TO_DATE('25/09/1992', 
'DD/MM/YYYY'), 'M', 'Manager', NULL, 3000.00, '+96180567890', 'hassan.amin@healerdealer.com', 
'Beirut', 10, 'Verdan St', 5, 'B002', TO_DATE('01/07/2022', 'DD/MM/YYYY'), NULL, 50);
INSERT INTO EMPLOYEE VALUES ('445566778', 'Maya', 'Saad', TO_DATE('14/03/1991', 
'DD/MM/YYYY'), 'F', 'Cashier', NULL, 1100.00, '+96170654321', 'maya.saad@healerdealer.com', 
'Beirut', 75, 'Sin El Fil St', 6, 'B003', TO_DATE('11/08/2022', 'DD/MM/YYYY'), NULL, 30);
INSERT INTO EMPLOYEE VALUES ('556677889', 'Ali', 'Jaber', TO_DATE('03/05/1988', 
'DD/MM/YYYY'), 'M', 'Cleaner', NULL, 800.00, '+96195543210', 'ali.jaber@healerdealer.com', 'Beirut', 
1, 'Hamra St', 7, 'B001', TO_DATE('20/09/2022', 'DD/MM/YYYY'), NULL, 40);
INSERT INTO EMPLOYEE VALUES ('667788990', 'Rita', 'Daher', TO_DATE('20/07/1989', 
'DD/MM/YYYY'), 'F', 'Pharmacist', 'PH789123', 2200.00, '+96191567890', 'rita.daher@healerdealer.com', 
'Beirut', 10, 'Achrafieh St', 8, 'B002', TO_DATE('12/06/2022', 'DD/MM/YYYY'), NULL, 42);
INSERT INTO EMPLOYEE VALUES ('778899001', 'Samir', 'Khalil', TO_DATE('09/11/1993', 
'DD/MM/YYYY'), 'M', 'Manager', NULL, 1000.00, '+96173567890', 'samir.khalil@healerdealer.com', 
'Beirut', 75, 'Sin El Fil St', 9, 'B003', TO_DATE('19/05/2022', 'DD/MM/YYYY'), NULL, 38);
INSERT INTO EMPLOYEE VALUES ('889900112', 'Zeinab', 'Fakhoury', TO_DATE('02/01/1986', 
'DD/MM/YYYY'), 'F', 'Accountant', NULL, 2700.00, '+96182567890', 
'zeinab.fakhoury@healerdealer.com', 'Beirut', 30, 'Monot St', 10, 'B001', TO_DATE('09/08/2022', 
'DD/MM/YYYY'), NULL, 45);

-- To avoid the error with the referential integrity constraint caused by foreign key Manager_SSN having
-- nothing to refer to, we inserted Manager_SSN as a NULL value.
-- Then, we updated them to reference the primary key values of EMPLOYEE after inserting EMPLOYEE values:
UPDATE BRANCH
SET Manager_SSN = '123456789'
WHERE BranchID = 'B001';
UPDATE BRANCH
SET Manager_SSN = '334455667'
WHERE BranchID = 'B002';
UPDATE BRANCH
SET Manager_SSN = '778899001'
WHERE BranchID = 'B003';

-- 3. INVENTORY:
INSERT INTO INVENTORY VALUES ('I001', 100, 'Hamra St', 'Beirut', 'B001');
INSERT INTO INVENTORY VALUES ('I002', 200, 'Bliss St', 'Beirut', 'B002');
INSERT INTO INVENTORY VALUES ('I003', 150, 'Achrafieh St', 'Beirut', 'B003');

-- 4. SUPPLIER:
INSERT INTO SUPPLIER VALUES ('30012345678', 'Beirut Pharma Solutions', 'Joseph Atallah', 
'Monthly', 'contact@pharmaleb.com', '+96130123456', 'Jal el-Dib Street', 'Metn');
INSERT INTO SUPPLIER VALUES ('30087654321', 'Cedars Medical Supply Co.', 'Samir Bassil', 
'Weekly', 'info@medico.com', '+96130876543', 'Zalka Main Street', 'Metn');
INSERT INTO SUPPLIER VALUES ('30011223344', 'LebHealth Pharmaceuticals', 'Rania Daher', 
'Yearly', 'sales@healthplus.com', '+96130456789', 'Chiah Street', 'Beirut');
INSERT INTO SUPPLIER VALUES ('30044556677', 'Mount Lebanon Drug Distributors', 'Kassem Faris', 
'Weekly', 'medleben@med.com', '+96131234567', 'Maameltein Street', 'Jounieh');
INSERT INTO SUPPLIER VALUES ('30099887766', 'Phoenicia Medica', 'Yasmin Akram', 'Monthly', 
'biopharma@bph.com', '+96133234567', 'Riad el-Solh Street', 'Beirut');
INSERT INTO SUPPLIER VALUES ('30022334455', 'MedCare Solutions Lebanon'
, 'Khaled Taha', 'Yearly', 'info@lebmed.com', '+96135098765', 'Beirut Souks Street', 'Beirut');
INSERT INTO SUPPLIER VALUES ('30055667788', 'Cedar Valley Pharma', 'Maya Shamas', 'Monthly', 
'contact@careplus.com', '+96134356789', 'Hamra Street', 'Beirut');
INSERT INTO SUPPLIER VALUES ('30066778899', 'Lebanese Life Sciences Supply'
, 'Rami Saba', 'Weekly', 'info@healthcareco.com', '+96136457890', 'City Centre', 'Beirut');
INSERT INTO SUPPLIER VALUES ('30077889900', 'Sahha Pharma Distributors', 'Zahra Harb', 
'Weekly', 'sales@medicare.com', '+96137548901', 'Ain Mreisseh Street', 'Beirut');
INSERT INTO SUPPLIER VALUES ('30088990011', 'AlphaMed Lebanon', 'Jad Khoury', 'Monthly', 
'contact@pharmamed.com', '+96138765012', 'Rue de Verdun', 'Beirut');

-- 5. CUSTOMER:
-- Since CUSTOMER and BILLING_INVOICE have foreign keys that refer to each other,
-- there are a few extra steps we must follow, as with EMPLOYEE and BRANCH.
-- We first get the constraint name that prevents primary key Bill_ID from being NULL,
-- and drop it later to make Bill_ID nullable:
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'CUSTOMER';

-- Drop primary key constraint to make Bill_ID nullable:
ALTER TABLE CUSTOMER DROP CONSTRAINT SYS_C007488;
ALTER TABLE CUSTOMER MODIFY Bill_ID INT NULL;

-- Then insert CUSTOMER values with null Bill_ID:
INSERT INTO CUSTOMER VALUES ('Sami', 'Haddad', NULL, '+96111111111', 
TO_DATE('05/05/1995', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Rita', 'Khalil', NULL, '+96122222222', TO_DATE('10/10/1985', 
'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Maya', 'Saad', NULL, '+96133333333', TO_DATE('08/02/1990', 
'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Ali', 'Jaber', NULL, '+96144444444', TO_DATE('14/03/1987', 
'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Zeinab', 'Fakhoury', NULL, '+96155555555', 
TO_DATE('20/04/1992', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Fadi', 'Kassem', NULL, '+96166666666', 
TO_DATE('12/07/1980', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Samir', 'Khalil', NULL, '+96177777777', 
TO_DATE('22/09/1989', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Hassan', 'Amin', NULL, '+96188888888', 
TO_DATE('05/06/1993', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Layla', 'Zein', NULL, '+96199999999', TO_DATE('13/08/1986', 
'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES ('Rami', 'Haddad', NULL, '+96110000000', 
TO_DATE('17/11/1984', 'DD/MM/YYYY'));

-- 6. BILLING_INVOICE:
-- Then we insert BILLING_INVOICE values:
INSERT INTO BILLING_INVOICE VALUES (1, '123456789', TO_DATE('02/11/2024', 
'DD/MM/YYYY'), 15.00, 'paid', 'Sami', 'Haddad', 15.00);
INSERT INTO BILLING_INVOICE VALUES (2, '987654321', TO_DATE('16/11/2024', 
'DD/MM/YYYY'), 20.00, 'pending', 'Rita', 'Khalil', 10.00);
INSERT INTO BILLING_INVOICE VALUES (3, '112233445', TO_DATE('19/11/2024', 
'DD/MM/YYYY'), 30.00, 'paid', 'Maya', 'Saad', 30.00);
INSERT INTO BILLING_INVOICE VALUES (4, '223344556', TO_DATE('21/11/2024', 
'DD/MM/YYYY'), 40.00, 'pending', 'Ali', 'Jaber', 10.00);
INSERT INTO BILLING_INVOICE VALUES (5, '334455667', TO_DATE('23/11/2024', 
'DD/MM/YYYY'), 50.00, 'paid', 'Fadi', 'Kassem', 50.00);
INSERT INTO BILLING_INVOICE VALUES (6, '445566778', TO_DATE('25/11/2024', 
'DD/MM/YYYY'), 60.00, 'pending', 'Samir', 'Khalil', 30.00);
INSERT INTO BILLING_INVOICE VALUES (7, '556677889', TO_DATE('26/11/2024', 
'DD/MM/YYYY'), 70.00, 'paid', 'Zeinab', 'Fakhoury', 70.00);
INSERT INTO BILLING_INVOICE VALUES (8, '667788990', TO_DATE('28/11/2024', 
'DD/MM/YYYY'), 80.00, 'pending', 'Layla', 'Zein', 40.00);
INSERT INTO BILLING_INVOICE VALUES (9, '778899001', TO_DATE('30/11/2024', 
'DD/MM/YYYY'), 90.00, 'paid', 'Hassan', 'Amin', 90.00);
INSERT INTO BILLING_INVOICE VALUES (10, '889900112', TO_DATE('01/12/2024', 
'DD/MM/YYYY'), 100.00, 'pending', 'Rami', 'Haddad', 50.00);

-- Now that we added BILLING_INVOICE values, we have the primary key InvoiceID
-- to refer to in the foreign key Bill_ID of CUSTOMER:
UPDATE CUSTOMER
SET Bill_ID = 1
WHERE Fname = 'Sami' AND Lname ='Haddad';
UPDATE CUSTOMER
SET Bill_ID = 2
WHERE Fname = 'Rita' AND Lname ='Khalil';
UPDATE CUSTOMER
SET Bill_ID = 3
WHERE Fname = 'Maya' AND Lname= 'Saad';
UPDATE CUSTOMER
SET Bill_ID = 4
WHERE Fname = 'Ali' AND Lname='Jaber';
UPDATE CUSTOMER
SET Bill_ID = 5
WHERE Fname = 'Fadi' AND Lname= 'Kassem';
UPDATE CUSTOMER
SET Bill_ID = 6
WHERE Fname = 'Samir' AND Lname= 'Khalil';
UPDATE CUSTOMER
SET Bill_ID = 7
WHERE Fname = 'Zeinab' AND Lname= 'Fakhoury';
UPDATE CUSTOMER
SET Bill_ID = 8
WHERE Fname = 'Layla' AND Lname= 'Zein';
UPDATE CUSTOMER
SET Bill_ID = 9
WHERE Fname = 'Hassan' AND Lname ='Amin'';
UPDATE CUSTOMER 
SET Bill_ID = 10
WHERE Fname = 'Rami' AND Lname = 'Haddad';

-- Finally, we re-establish the constraints of CUSTOMER:
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (Fname, Lname, 
Bill_ID);

-- 7. DEPENDENT:
INSERT INTO DEPENDENT VALUES ('Lila', 'Haddad', '123456789', 'F', TO_DATE('10/10/2012', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Nadim', 'Haddad', '123456789', 'M', TO_DATE('15/05/2010', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Maya', 'Amin', '334455667', 'F', TO_DATE('22/06/2015', 
'DD/MM/YYYY'), 'Spouse');
INSERT INTO DEPENDENT VALUES ('Samir', 'Saad', '445566778', 'M', TO_DATE('30/09/2012', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Tariq', 'Jaber', '556677889', 'M', TO_DATE('02/02/2014', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Rania', 'Zein', '667788990', 'F', TO_DATE('10/11/2013', 
'DD/MM/YYYY'), 'Spouse');
INSERT INTO DEPENDENT VALUES ('Layla', 'Saad', '778899001', 'F', TO_DATE('14/04/2013', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Fadi', 'Kassem', '889900112', 'M', TO_DATE('25/03/2016', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Zeinab', 'Fakhoury', '889900112', 'F', TO_DATE('28/07/2011', 
'DD/MM/YYYY'), 'Child');
INSERT INTO DEPENDENT VALUES ('Rami', 'Haddad', '123456789', 'M', TO_DATE('02/05/2009', 
'DD/MM/YYYY'), 'Spouse');

-- 8. Payment_term:
INSERT INTO Payment_term VALUES ('30012345678', 'Monthly');
INSERT INTO Payment_term VALUES ('30087654321', 'Weekly');
INSERT INTO Payment_term VALUES ('30011223344', 'Yearly');
INSERT INTO Payment_term VALUES ('30044556677', 'Monthly');
INSERT INTO Payment_term VALUES ('30099887766', 'Weekly');
INSERT INTO Payment_term VALUES ('30022334455', 'Yearly');
INSERT INTO Payment_term VALUES ('30055667788', 'Monthly');
INSERT INTO Payment_term VALUES ('30066778899', 'Weekly');
INSERT INTO Payment_term VALUES ('30077889900', 'Monthly');
INSERT INTO Payment_term VALUES ('30088990011', 'Yearly');

-- 9. MEDICINE:
INSERT INTO MEDICINE VALUES ('A01AA01', 'Paracetamol', 'Pain reliever', 'T', 5.00, 'PharmaLeb');
INSERT INTO MEDICINE VALUES ('B02BC01', 'Ibuprofen', 'Anti-inflammatory', 'T', 10.00, 'Medico');
INSERT INTO MEDICINE VALUES ('C03CC01', 'Aspirin', 'Blood thinner', 'T', 7.00, 'HealthPlus');
INSERT INTO MEDICINE VALUES ('D04DC01', 'Loratadine', 'Antihistamine', 'T', 8.50, 'PharmaLeb');
INSERT INTO MEDICINE VALUES ('E05EE01', 'Cetirizine', 'Antihistamine', 'T', 6.50, 'Medico');
INSERT INTO MEDICINE VALUES ('F06FF01', 'Hydrocortisone', 'Steroid', 'T', 12.00, 'HealthPlus');
INSERT INTO MEDICINE VALUES ('G07GG01', 'Ciprofloxacin', 'Antibiotic', 'T', 15.00, 'PharmaLeb');
INSERT INTO MEDICINE VALUES ('H08HH01', 'Clindamycin', 'Antibiotic', 'T', 13.00, 'Medico');
INSERT INTO MEDICINE VALUES ('I09II01', 'Amoxicillin', 'Antibiotic', 'T', 9.00, 'HealthPlus');
INSERT INTO MEDICINE VALUES ('J10JJ01', 'Omeprazole', 'Acid reducer', 'T', 10.50, 'PharmaLeb');
INSERT INTO MEDICINE VALUES('N/A', 'N/A', 'N/A', 'F', 0, 'N/A');

-- We inserted a 'N/A' tuple that represents no medicine.
-- This accounts for instances where the customer buys only products and no medicine,
-- since some ternary relationships merge products and medicine primary keys
-- as the ternary relation’s composite key.

-- 10. SELF_CARE_HYGIENE_PRODUCT:
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1001', 'Toothpaste', 'Mint flavor', 
'Dental', 3.00, 'OralB');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1002', 'Shampoo', 'For dry hair', 
'Hair Care', 8.00, 'Dove');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1003', 'Body Lotion', 'Moisturizing', 
'Skin Care', 5.50, 'Nivea');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1004', 'Face Wash', 'For sensitive 
skin', 'Skin Care', 6.00, 'Neutrogena');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1005', 'Conditioner', 'For curly hair', 
'Hair Care', 7.00, 'Pantene');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1006', 'Hand Soap', 'Lavender 
scent', 'Personal Care', 2.50, 'Lifebuoy');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1007', 'Shaving Cream', 'Sensitive 
skin', 'Personal Care', 4.00, 'Gillette');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1008', 'Shower Gel', 'For men', 'Skin 
Care', 6.50, 'Old Spice');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1009', 'Lip Balm', 'Nourishing', 
'Personal Care', 2.00, 'ChapStick');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES ('SC1010', 'Deodorant', 'Fresh scent', 
'Personal Care', 3.50, 'Dove');
INSERT INTO SELF_CARE_HYGIENE_PRODUCT VALUES('N/A', 'N/A', 'N/A', 'F', 0, 'N/A');

-- We inserted a 'N/A' tuple that represents no products.
-- This accounts for instances where the customer buys only medicines and no products,
-- since some ternary relationships merge products and medicine primary keys
-- as the ternary relation’s composite key.

-- 11. PRESCRIPTION:
INSERT INTO PRESCRIPTION VALUES (1, TO_DATE('01/11/2024', 'DD/MM/YYYY'), 2, 
TO_DATE('01/02/2025', 'DD/MM/YYYY'), '+96111234567', 'Dr. Mansour', 'DL12345', 10, 'Sami', 
'Haddad');
INSERT INTO PRESCRIPTION VALUES (2, TO_DATE('15/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('15/12/2024', 'DD/MM/YYYY'), '+96111234568', 'Dr. Akl', 'DL54321', 15, 'Rita', 'Khalil');
INSERT INTO PRESCRIPTION VALUES (3, TO_DATE('20/11/2024', 'DD/MM/YYYY'), 3, 
TO_DATE('20/02/2025', 'DD/MM/YYYY'), '+96111234569', 'Dr. George', 'DL67890', 20, 'Maya', 'Saad');
INSERT INTO PRESCRIPTION VALUES (4, TO_DATE('22/11/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('22/12/2024', 'DD/MM/YYYY'), '+96111234570', 'Dr. Samir', 'DL23456', 30, 'Ali', 'Jaber');
INSERT INTO PRESCRIPTION VALUES (5, TO_DATE('25/11/2024', 'DD/MM/YYYY'), 2, 
TO_DATE('25/02/2025', 'DD/MM/YYYY'), '+96111234571', 'Dr. Ziad', 'DL34567', 25, 'Fadi', 'Kassem');
INSERT INTO PRESCRIPTION VALUES (6, TO_DATE('30/11/2024', 'DD/MM/YYYY'), 0, 
TO_DATE('30/12/2024', 'DD/MM/YYYY'), '+96111234572', 'Dr. Akl', 'DL98765', 5, 'Samir', 'Khalil');
INSERT INTO PRESCRIPTION VALUES (7, TO_DATE('02/12/2024', 'DD/MM/YYYY'), 1, 
TO_DATE('02/01/2025', 'DD/MM/YYYY'), '+96111234573', 'Dr. Layla', 'DL67891', 18, 'Zeinab', 
'Fakhoury');
INSERT INTO PRESCRIPTION VALUES (8, TO_DATE('05/12/2024', 'DD/MM/YYYY'), 0, 
TO_DATE('05/01/2025', 'DD/MM/YYYY'), '+96111234574', 'Dr. Faris', 'DL45678', 8, 'Sami', 'Haddad');
INSERT INTO PRESCRIPTION VALUES (9, TO_DATE('10/12/2024', 'DD/MM/YYYY'), 4, 
TO_DATE('10/02/2025', 'DD/MM/YYYY'), '+96111234575', 'Dr. Rania', 'DL56789', 40, 'Layla', 'Zein');
INSERT INTO PRESCRIPTION VALUES (10, TO_DATE('12/12/2024', 'DD/MM/YYYY'), 2, 
TO_DATE('12/02/2025', 'DD/MM/YYYY'), '+96111234576', 'Dr. Hassan', 'DL65432', 20, 'Ali', 'Jaber');

-- 12. Contains2:
INSERT INTO contains2 VALUES (1, 'A01AA01');
INSERT INTO contains2 VALUES (2, 'B02BC01');
INSERT INTO contains2 VALUES (3, 'C03CC01');
INSERT INTO contains2 VALUES (4, 'D04DC01');
INSERT INTO contains2 VALUES (5, 'E05EE01');
INSERT INTO contains2 VALUES (6, 'F06FF01');
INSERT INTO contains2 VALUES (7, 'G07GG01');
INSERT INTO contains2 VALUES (8, 'H08HH01');
INSERT INTO contains2 VALUES (9, 'I09II01');
INSERT INTO contains2 VALUES (10, 'J10JJ01');

-- 13. Payment_method:
INSERT INTO Payment_method VALUES (1, 'Card');
INSERT INTO Payment_method VALUES (2, 'Cash');
INSERT INTO Payment_method VALUES (3, 'Card');
INSERT INTO Payment_method VALUES (4, 'Cash');
INSERT INTO Payment_method VALUES (5, 'Card');
INSERT INTO Payment_method VALUES (6, 'Cash');
INSERT INTO Payment_method VALUES (7, 'Card');
INSERT INTO Payment_method VALUES (8, 'Cash');
INSERT INTO Payment_method VALUES (9, 'Card');
INSERT INTO Payment_method VALUES (10, 'Cash');

-- 14. Item_ID:
INSERT INTO Item_ID VALUES (1, 'SC1001');
INSERT INTO Item_ID VALUES (1, 'A01AA01');
INSERT INTO Item_ID VALUES (2, 'B02BC01');
INSERT INTO Item_ID VALUES (2, 'C03CC01');
INSERT INTO Item_ID VALUES (5, 'D04DC01');
INSERT INTO Item_ID VALUES (6, 'E05EE01');
INSERT INTO Item_ID VALUES (1, 'F06FF01');
INSERT INTO Item_ID VALUES (8, 'G07GG01');
INSERT INTO Item_ID VALUES (9, 'H08HH01');
INSERT INTO Item_ID VALUES (10, 'I09II01');

-- 15. Dosage_Instructions:
INSERT INTO Dosage_Instructions VALUES (1, 'Take 1 tablet daily');
INSERT INTO Dosage_Instructions VALUES (1, 'Take 2 tablets daily');
INSERT INTO Dosage_Instructions VALUES (3, 'Take 1 tablet every 6 hours');
INSERT INTO Dosage_Instructions VALUES (4, 'Take 1 tablet twice a day');
INSERT INTO Dosage_Instructions VALUES (5, 'Apply cream to affected area twice a day');
INSERT INTO Dosage_Instructions VALUES (6, 'Take 1 tablet before meals');
INSERT INTO Dosage_Instructions VALUES (6, 'Take 2 tablets at bedtime');
INSERT INTO Dosage_Instructions VALUES (8, 'Take 1 tablet in the morning and evening');
INSERT INTO Dosage_Instructions VALUES (9, 'Take 1 tablet every 8 hours');
INSERT INTO Dosage_Instructions VALUES (10, 'Take 1 tablet as needed');

-- 16. Supplies:
INSERT INTO Supplies VALUES ('A01AA01', '30012345678', 'SC1001', 3.50, TO_DATE('01/11/2024', 
'DD/MM/YYYY'), 50);
INSERT INTO Supplies VALUES ('B02BC01', '30087654321', 'SC1002', 7.00, TO_DATE('10/11/2024', 
'DD/MM/YYYY'), 100);
INSERT INTO Supplies VALUES ('C03CC01', '30011223344', 'SC1003', 5.50, TO_DATE('15/11/2024', 
'DD/MM/YYYY'), 75);
INSERT INTO Supplies VALUES ('D04DC01', '30044556677', 'SC1004', 8.00, TO_DATE('20/11/2024', 
'DD/MM/YYYY'), 60);
INSERT INTO Supplies VALUES ('E05EE01', '30099887766', 'SC1005', 6.00, TO_DATE('25/11/2024', 
'DD/MM/YYYY'), 90);
INSERT INTO Supplies VALUES ('F06FF01', '30022334455', 'SC1006', 3.00, TO_DATE('30/11/2024', 
'DD/MM/YYYY'), 120);
INSERT INTO Supplies VALUES ('G07GG01', '30055667788', 'SC1007', 4.50, TO_DATE('05/12/2024', 
'DD/MM/YYYY'), 150);
INSERT INTO Supplies VALUES ('H08HH01', '30066778899', 'SC1008', 7.50, TO_DATE('10/12/2024', 
'DD/MM/YYYY'), 200);
INSERT INTO Supplies VALUES ('I09II01', '30077889900', 'SC1009', 2.50, TO_DATE('15/12/2024', 
'DD/MM/YYYY'), 180);
INSERT INTO Supplies VALUES ('J10JJ01', '30088990011', 'SC1010', 5.00, TO_DATE('20/12/2024', 
'DD/MM/YYYY'), 160)

-- 17. Includes:
INSERT INTO Includes VALUES (1, 'A01AA01', 'SC1001');
INSERT INTO Includes VALUES (2, 'B02BC01', 'SC1002');
INSERT INTO Includes VALUES (3, 'C03CC01', 'SC1003');
INSERT INTO Includes VALUES (4, 'D04DC01', 'SC1004');
INSERT INTO Includes VALUES (5, 'E05EE01', 'SC1005');
INSERT INTO Includes VALUES (6, 'F06FF01', 'SC1006');
INSERT INTO Includes VALUES (7, 'G07GG01', 'SC1007');
INSERT INTO Includes VALUES (8, 'H08HH01', 'SC1008');
INSERT INTO Includes VALUES (9, 'I09II01', 'SC1009');
INSERT INTO Includes VALUES (10, 'J10JJ01', 'SC1010');

-- 18. Stores:
INSERT INTO Stores VALUES ('A01AA01', 'SC1001', 'I001', TO_DATE('01/10/2024', 
'DD/MM/YYYY'), TO_DATE('01/10/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('B02BC01', 'SC1002', 'I002', TO_DATE('10/10/2024', 
'DD/MM/YYYY'), TO_DATE('10/10/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('C03CC01', 'SC1003', 'I003', TO_DATE('15/10/2024', 
'DD/MM/YYYY'), TO_DATE('15/10/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('D04DC01', 'SC1004', 'I001', TO_DATE('20/10/2024', 
'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('E05EE01', 'SC1005', 'I002', TO_DATE('25/10/2024', 
'DD/MM/YYYY'), TO_DATE('25/10/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('F06FF01', 'SC1006', 'I003', TO_DATE('30/10/2024', 'DD/MM/YYYY'), 
TO_DATE('30/10/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('G07GG01', 'SC1007', 'I001', TO_DATE('05/11/2024', 
'DD/MM/YYYY'), TO_DATE('05/11/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('H08HH01', 'SC1008', 'I002', TO_DATE('10/11/2024', 
'DD/MM/YYYY'), TO_DATE('10/11/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('I09II01', 'SC1009', 'I003', TO_DATE('15/11/2024', 'DD/MM/YYYY'), 
TO_DATE('15/11/2025', 'DD/MM/YYYY'));
INSERT INTO Stores VALUES ('J10JJ01', 'SC1010', 'I001', TO_DATE('20/11/2024', 'DD/MM/YYYY'), 
TO_DATE('20/11/2025', 'DD/MM/YYYY'));
