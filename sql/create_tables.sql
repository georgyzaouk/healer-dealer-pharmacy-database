-- CREATE TABLES
-- To create our tables in the Oracle database server, we use the CREATE TABLE command
-- and include the relation name, attributes, data types, primary keys, foreign keys, and constraints.

-- 1- BRANCH:
CREATE TABLE BRANCH (
 BranchID VARCHAR(5) PRIMARY KEY,
 Name VARCHAR(50) NOT NULL,
 Phone VARCHAR(15),
 Email VARCHAR(100) CHECK (Email LIKE '%@healerdealer.com'),
 Street VARCHAR(100),
 City VARCHAR(50),
 Manager_name VARCHAR(50),
 Manager_SSN VARCHAR(9)
);

-- Note: Manager_SSN is a foreign key referencing the primary key of EMPLOYEE.
-- However, there is a circular dependency because EMPLOYEE also has B_ID referencing BRANCH.
-- To avoid this issue, Manager_SSN is not declared as a foreign key during table creation.
-- It is added later using ALTER TABLE.

-- 2- EMPLOYEE:
CREATE TABLE EMPLOYEE (
 SSN VARCHAR(9) NOT NULL,
 Fname VARCHAR(15) NOT NULL,
 Lname VARCHAR(15) NOT NULL,
 Dob DATE,
 Sex CHAR NOT NULL CHECK(Sex IN ('F', 'M')),
 Position VARCHAR(15),
 License_number VARCHAR(20) DEFAULT NULL, 
 Salary DECIMAL(10, 2),
 Phone_number VARCHAR(15) NOT NULL,
 Email VARCHAR(40) CHECK (Email LIKE '%@healerdealer.com'),
 City VARCHAR(30),
 Street_nb INT,
 Street_name VARCHAR(30),
 Apartment_number INT,
 B_ID VARCHAR(5),
 Start_date DATE,
 End_date DATE,
 Hours_worked INT,
 PRIMARY KEY (SSN),
 FOREIGN KEY (B_ID) REFERENCES BRANCH(BranchID)
);

-- 3- SUPPLIER:
CREATE TABLE SUPPLIER (
 SupplierID CHAR(11) NOT NULL PRIMARY KEY, 
 Name VARCHAR(100) NOT NULL,
 Contact_person VARCHAR(50),
 Delivery_term VARCHAR(30) CHECK(Delivery_term IN ('Weekly', 'Monthly', 'Yearly')),
 Email VARCHAR(40) NOT NULL,
 Phone_number VARCHAR(15),
 Street VARCHAR(30),
 City VARCHAR(30) NOT NULL
);

-- 4- BILLING_INVOICE:
CREATE TABLE BILLING_INVOICE (
 InvoiceID INT PRIMARY KEY, 
 ESSN VARCHAR(9) NOT NULL,
 Date_issued DATE NOT NULL,
 Total_amount NUMBER(10, 2) NOT NULL,
 Payment_status VARCHAR(20) NOT NULL,
 CF_name VARCHAR(15) NOT NULL,
 CL_name VARCHAR(15) NOT NULL,
 Amount_paid NUMBER(10, 2) NOT NULL,
 FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);

-- Note: CF_name and CL_name are foreign keys that refer to CUSTOMER.
-- However, because of the circular dependency issue, this constraint is omitted here
-- and added later using ALTER TABLE.

-- 5- INVENTORY:
CREATE TABLE INVENTORY (
 InventoryID CHAR(5) PRIMARY KEY,
 Quantity INT NOT NULL CHECK (Quantity >= 0),
 Street VARCHAR(100),
 City VARCHAR(50),
 B_ID VARCHAR(5) NOT NULL,
 FOREIGN KEY (B_ID) REFERENCES BRANCH(BranchID)
);

-- 6- CUSTOMER:
CREATE TABLE CUSTOMER (
 Fname VARCHAR(30),
 Lname VARCHAR(30),
 Bill_ID INT,
 Phone_number VARCHAR(15),
 Dob DATE,
 PRIMARY KEY (Fname, Lname, Bill_ID),
 CONSTRAINT unique_fname_lname UNIQUE (Fname, Lname),
 FOREIGN KEY (Bill_ID) REFERENCES BILLING_INVOICE(InvoiceID)
);

-- 7- MEDICINE:
CREATE TABLE MEDICINE (
 MedicineID VARCHAR(7) PRIMARY KEY, 
 Name VARCHAR(50) NOT NULL,
 Description VARCHAR(100),
 Prescription_required CHAR(1) CHECK (Prescription_required IN ('T', 'F')) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL,
 Manufacturer VARCHAR(100)
);

-- 8- SELF_CARE_HYGIENE_PRODUCT:
CREATE TABLE SELF_CARE_HYGIENE_PRODUCT (
 ProductID VARCHAR(20) PRIMARY KEY, 
 Name VARCHAR(25) NOT NULL,
 Description VARCHAR(100), 
 Category VARCHAR(50),
 Price DECIMAL(10, 2) NOT NULL,
 Manufacturer VARCHAR(100)
);

-- 9- PRESCRIPTION:
CREATE TABLE PRESCRIPTION (
 PrescriptionID INT PRIMARY KEY, 
 Date_issued DATE NOT NULL, 
 Refill_count INT DEFAULT 0, 
 Expiry DATE NOT NULL, 
 Dr_phone_nb VARCHAR(15), 
 Dr_name VARCHAR(100), 
 Dr_license_number VARCHAR(50), 
 Refills_frequency INT, 
 CF_name VARCHAR(15) NOT NULL, 
 CL_name VARCHAR(15) NOT NULL,
 FOREIGN KEY (CF_name, CL_name) REFERENCES CUSTOMER(Fname, Lname)
);

-- 10- DEPENDENT:
CREATE TABLE DEPENDENT (
 Fname VARCHAR(30),
 Lname VARCHAR(30),
 ESSN VARCHAR(9) NOT NULL,
 Sex CHAR NOT NULL CHECK (Sex IN ('F', 'M')),
 Dob DATE,
 Relationship VARCHAR(20) NOT NULL CHECK (Relationship IN ('Spouse','Child','Parent','other')),
 PRIMARY KEY (Fname, Lname, ESSN),
 FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);

-- 11- Payment_term:
CREATE TABLE Payment_term (
 SupplierID CHAR(11) NOT NULL,
 Payment_term VARCHAR(30) NOT NULL,
 PRIMARY KEY (SupplierID, Payment_term),
 FOREIGN KEY (SupplierID) REFERENCES SUPPLIER(SupplierID)
);

-- 12- contains2:
CREATE TABLE contains2 (
 pID INT NOT NULL,
 mID VARCHAR(7),
 PRIMARY KEY (pID, mID),
 FOREIGN KEY (mID) REFERENCES MEDICINE(MedicineID),
 FOREIGN KEY (pID) REFERENCES PRESCRIPTION(PrescriptionID)
);

-- 13- Payment_method:
CREATE TABLE Payment_method (
 InvoiceID INT NOT NULL,
 Payment_method VARCHAR(20),
 PRIMARY KEY (InvoiceID, Payment_method),
 FOREIGN KEY (InvoiceID) REFERENCES BILLING_INVOICE(InvoiceID)
);

-- 14- Item_ID:
CREATE TABLE Item_ID (
 InvoiceID INT NOT NULL,
 ItemID VARCHAR(10),
 PRIMARY KEY (InvoiceID, ItemID),
 FOREIGN KEY (InvoiceID) REFERENCES BILLING_INVOICE(InvoiceID)
);

-- 15- Dosage_Instructions:
CREATE TABLE Dosage_Instructions (
 PrescriptionID INT NOT NULL,
 Dosage_instruction VARCHAR(100),
 PRIMARY KEY (PrescriptionID, Dosage_instruction),
 FOREIGN KEY (PrescriptionID) REFERENCES PRESCRIPTION(PrescriptionID)
);

-- 16- Supplies:
CREATE TABLE Supplies (
 mID VARCHAR(7), 
 sID CHAR(11) NOT NULL,
 prID VARCHAR(20),
 Price_per_unit DECIMAL(10, 2) NOT NULL, 
 Supply_date DATE NOT NULL, 
 Quantity_supplied INT NOT NULL,
 PRIMARY KEY (mID, sID, prID),
 FOREIGN KEY (mID) REFERENCES MEDICINE(MedicineID),
 FOREIGN KEY (prID) REFERENCES SELF_CARE_HYGIENE_PRODUCT(ProductID),
 FOREIGN KEY (sID) REFERENCES SUPPLIER(SupplierID)
);

-- 17- Includes:
CREATE TABLE Includes (
 bID INT NOT NULL,
 mID VARCHAR(7),
 prID VARCHAR(20),
 PRIMARY KEY (bID, mID, prID),
 FOREIGN KEY (bID) REFERENCES BILLING_INVOICE(InvoiceID),
 FOREIGN KEY (mID) REFERENCES MEDICINE(MedicineID),
 FOREIGN KEY (prID) REFERENCES SELF_CARE_HYGIENE_PRODUCT(ProductID)
);

-- 18- Stores:
CREATE TABLE Stores (
 mID VARCHAR(7), 
 prID VARCHAR(20), 
 inID CHAR(5) NOT NULL, 
 Restock_date DATE, 
 Expiry DATE NOT NULL, 
 PRIMARY KEY (mID, prID, inID),
 FOREIGN KEY (mID) REFERENCES MEDICINE(MedicineID),
 FOREIGN KEY (prID) REFERENCES SELF_CARE_HYGIENE_PRODUCT(ProductID),
 FOREIGN KEY (inID) REFERENCES INVENTORY(InventoryID)
);

-- ALTER command:
-- Some referential integrity constraints cannot be added directly during table creation
-- because the primary key they reference may not have been created yet.
-- Due to circular dependencies, this cannot be solved only by reordering table creation.
-- Therefore, ALTER TABLE is used after all required tables are created.

ALTER TABLE BRANCH ADD (FOREIGN KEY (Manager_SSN) REFERENCES EMPLOYEE(SSN));

ALTER TABLE BILLING_INVOICE ADD( FOREIGN KEY (CF_name, CL_name) REFERENCES 
CUSTOMER(Fname, Lname));
