CREATE TABLE Employee( 
    Employee_ID VARCHAR(12), 
    FirstName TEXT, 
    LastName TEXT, 
    Phone_Number VARCHAR(12), 
    Employee_Type INT,  -- 1 = Full Time & 0 = Part Time
    Job_Description VARCHAR(255), 
    Street VARCHAR(255), 
    City VARCHAR(255), 
    State VARCHAR(255), 
    Zipcode VARCHAR(10), 
   PRIMARY KEY(Employee_ID) 
); 
CREATE TABLE FullTime( 
    Employee_ID VARCHAR(12), 
    Salary INT, 
    PRIMARY KEY(Employee_ID), 
    FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID) 
); 
CREATE TABLE PartTime( 
    Employee_ID VARCHAR(12), 
    Hourly_Wage INT, 
    Composite_Hours INT, 
    PRIMARY KEY(Employee_ID), 
    FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID) 
); 
CREATE TABLE Assignment( 
    Assignment_ID VARCHAR(12), 
    Assignment_Description VARCHAR(255), 
    PRIMARY KEY(Assignment_ID) 
); 
CREATE TABLE Equipment( 
    Equipment_ID VARCHAR(12), 
    Equipment_Description VARCHAR(255), 
    PRIMARY KEY(Equipment_ID) 
); 
CREATE TABLE Tee_Time( 
    Tee_Time_ID VARCHAR(12), 
    Date DATE, 
    Start_Time TIME, 
    Cart VARCHAR(12), 
    Num_Players INT, 
    PRIMARY KEY(Tee_Time_ID) 
); 
CREATE TABLE Customer( 
    Customer_ID VARCHAR(12), 
    Phone_Number VARCHAR(12), 
    FirstName TEXT, 
    LastName TEXT, 
    Customer_Type INT, -- 1 = Member & 0 = Guest 
    PRIMARY KEY(Customer_ID) 
); 
CREATE TABLE Member( 
    Customer_ID VARCHAR(12),
    Member_Price DECIMAL(10, 2), -- Assuming a decimal type for Member_Price 
    PRIMARY KEY(Customer_ID), 
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID) 
);  
CREATE TABLE Guest( 
    Customer_ID VARCHAR(12), 
    Guest_Price DECIMAL(10, 2), -- Assuming a decimal type for Guest_Price 
    PRIMARY KEY(Customer_ID),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID) 
);
CREATE TABLE Has( 
    Tee_Time_ID VARCHAR(12), 
    Customer_ID VARCHAR(12), 
    PRIMARY KEY(Tee_Time_ID, Customer_ID), 
    FOREIGN KEY(Tee_Time_ID) REFERENCES Tee_Time(Tee_Time_ID), 
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID) 
); 
CREATE TABLE Uses( 
    Equipment_ID VARCHAR(12), 
    Tee_Time_ID VARCHAR(12), 
    PRIMARY KEY(Equipment_ID, Tee_Time_ID), 
    FOREIGN KEY(Equipment_ID) REFERENCES Equipment(Equipment_ID), 
    FOREIGN KEY(Tee_Time_ID) REFERENCES Tee_Time(Tee_Time_ID) 
); 
CREATE TABLE Used_By( 
    Assignment_ID VARCHAR(12), 
    Equipment_ID VARCHAR(12), 
    PRIMARY KEY(Assignment_ID, Equipment_ID), 
    FOREIGN KEY(Assignment_ID) REFERENCES Assignment(Assignment_ID), 
    FOREIGN KEY(Equipment_ID) REFERENCES Equipment(Equipment_ID) 
); 
CREATE TABLE Works_On( 
    Assignment_ID VARCHAR(12), 
    Employee_ID VARCHAR(12), 
    PRIMARY KEY(Assignment_ID, Employee_ID), 
    FOREIGN KEY(Assignment_ID) REFERENCES Assignment(Assignment_ID), 
    FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID) 
); 
CREATE TABLE Manages( 
    Employee_ID VARCHAR(12), 
    TeeTime_ID VARCHAR(12), 
    PRIMARY KEY(Employee_ID, TeeTime_ID), 
    FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID), 
    FOREIGN KEY(TeeTime_ID) REFERENCES Tee_Time(Tee_Time_ID) 
); 
-- Begin Inserting Raw Data into Each Table
INSERT INTO Employee (Employee_ID, FirstName, LastName, Phone_Number, Employee_Type, Job_Description, Street, City, State, Zipcode)
VALUES('001', 'Ryan', 'Smith', '555-123-4567', 1, 'Employee', 'Maple Street', 'West Lafayette', 'IN', '47920'),('002', 'James', 'Johnson', '555-234-5678', 1, 'Manager', 'Oak Avenue', 'West Lafayette', 'IN', '47920'),('003', 'Joel', 'Williams', '555-345-6789', 1, 'Employee', 'Elm Road', 'West Lafayette', 'IN', '47920'),
    ('004', 'Lisa', 'Jones', '555-456-7890', 1, 'Manager', 'Cedar Lane', 'West Lafayette', 'IN', '47920'),('005', 'Frank', 'Brown', '555-567-8901', 1, 'Employee', 'Pine Boulevard', 'West Lafayette', 'IN', '47920'),('006', 'Sloan', 'Davis', '555-678-9012', 1, 'Manager', 'Birch Lane', 'West Lafayette', 'IN', '47920'),('007', 'David', 'Miller', '555-789-0123', 1, 'Employee', 'Willow Court', 'West Lafayette', 'IN', '47920'),
    ('008', 'Colby', 'Wilson', '555-890-1234', 1, 'Employee', 'Cherry Lane', 'West Lafayette', 'IN', '47920'),('009', 'Danny', 'Moore', '555-901-2345', 1, 'Employee', 'Sycamore Street', 'West Lafayette', 'IN', '47920'),('010', 'Brody', 'Taylor', '555-012-3456', 1, 'Employee', 'Ash Avenue', 'West Lafayette', 'IN', '47920'),('011', 'Joel', 'Anderson', '555-210-9876', 0, 'Employee', 'Cypress Road', 'West Lafayette', 'IN', '47920'),
    ('012', 'Joe', 'Thomas', '555-321-8765', 0, 'Employee', 'Poplar Drive', 'West Lafayette', 'IN', '47920'),('013', 'Mark', 'Jackson', '555-432-7654', 0, 'Employee', 'Walnut Street', 'West Lafayette', 'IN', '47920'),('014', 'Grace', 'White', '555-543-6543', 0, 'Employee', 'Spruce Lane', 'West Lafayette', 'IN', '47920'),('015', 'Meredith', 'Harris', '555-654-5432', 0, 'Employee', 'Chestnut Avenue', 'West Lafayette', 'IN', '47920'),
    ('016', 'Maddie', 'Martin', '555-765-4321', 0, 'Employee', 'Magnolia Boulevard', 'West Lafayette', 'IN', '47920'),('017', 'Kasie', 'Thompson', '555-876-3210', 0, 'Employee', 'Juniper Court', 'West Lafayette', 'IN', '47920'),('018', 'Ken', 'Garcia', '555-987-2109', 0, 'Employee', 'Hawthorn Lane', 'West Lafayette', 'IN', '47920'),('019', 'Luke', 'Martinez', '555-098-1098', 0, 'Employee', 'Locust Street', 'West Lafayette', 'IN', '47920'),('020', 'Garrett', 'Robinson', '555-109-8109', 0, 'Employee', 'Alder Avenue', 'West Lafayette', 'IN', '47920');
    
INSERT INTO FullTime (Employee_ID, Salary)
VALUES('001', 50000),('002', 60000),('003', 50000),('004', 60000),('005', 50000),('006', 60000),('007', 50000),('008', 50000),('009', 50000),('010', 50000);

INSERT INTO PartTime (Employee_ID, Hourly_Wage, Composite_Hours)
VALUES ('011', 12, 20), ('012', 12, 30), ('013', 12, 14), ('014', 12, 24), ('015', 12, 20),('016', 12, 20), ('017', 12, 20), ('018', 12, 30), ('019', 15, 30), ('020', 15, 30);

INSERT INTO Equipment (Equipment_ID, Equipment_Description) VALUES 
(400, 'Rake'), (401, 'Leaf Blow'), (402, 'Mower'), (403, 'Mower'), (404, 'Golf Balls'), 
(405, 'Shovel'), (406, 'Ball Washer'), (407, 'Hose'), (408, 'Scorecard'), (409, 'Gloves'), 
(410, 'Towels'), (411, 'Hats'), (412, 'Mats'), (413, 'Divot Tool'), (414, 'Pathway Markers'), 
(415, 'Waste Bin'), (416, 'Hazard Markers'), (417, 'Shaping Tool'), (418, 'Fertilizer'), 
(419, 'Flags');
       
INSERT INTO Tee_Time (Tee_Time_ID, Date, Start_Time, Cart, Num_Players)
VALUES 
    (1001, '2024-05-27', '10:30', 'Yes', 4), 
    (1002, '2024-05-28', '10:30', 'No', 3), 
    (1003, '2024-05-29', '10:30', 'Yes', 1), 
    (1004, '2024-05-30', '10:30', 'No', 1), 
    (1005, '2024-05-31', '08:00', 'Yes', 2), 
    (1006, '2024-06-01', '07:30', 'Yes', 3), 
    (1007, '2024-06-02', '06:15', 'Yes', 4), 
    (1008, '2024-06-03', '09:15', 'Yes', 4), 
    (1009, '2024-06-04', '08:45', 'Yes', 4), 
    (1010, '2024-06-05', '11:00', 'Yes', 4), 
    (1011, '2024-06-06', '11:30', 'Yes', 4), 
    (1012, '2024-06-07', '09:45', 'Yes', 4), 
    (1013, '2024-06-08', '15:30', 'Yes', 3), 
    (1014, '2024-06-09', '14:10', 'Yes', 2), 
    (1015, '2024-06-10', '13:50', 'Yes', 2), 
    (1016, '2024-06-11', '13:15', 'Yes', 2), 
    (1017, '2024-06-12', '16:00', 'Yes', 1), 
    (1018, '2024-06-13', '17:30', 'Yes', 4), 
    (1019, '2024-06-14', '15:45', 'Yes', 4), 
    (1020, '2024-06-15', '14:45', 'No', 2);
    
INSERT INTO Customer (Customer_ID, Phone_Number, FirstName, LastName, Customer_Type)
VALUES 
    (901, '555-987-6543', 'Emily', 'Smith', 1), (902, '333-456-7890', 'Liam', 'Johnson', 1), 
    (903, '777-123-4567', 'Olivia', 'Williams', 1), (904, '888-555-1212', 'Noah', 'Jones', 1), 
    (905, '444-777-8888', 'Ava', 'Brown', 1), (906, '666-234-5678', 'Ethan', 'Davis', 0), 
    (907, '222-890-1234', 'Isabella', 'Miller', 0), (908, '999-345-6789', 'Oliver', 'Wilson', 0), 
    (909, '111-678-9012', 'Sophia', 'Moore', 0), (910, '777-987-6543', 'Mason', 'Taylor', 0), 
    (911, '333-456-7890', 'Mia', 'Anderson', 0), (912, '555-123-4321', 'Elijah', 'Thomas', 0), 
    (913, '888-345-6789', 'Amelia', 'Jackson', 0), (914, '222-654-9876', 'James', 'White', 0), 
    (915, '444-890-1234', 'Harper', 'Harris', 0), (916, '666-567-8901', 'Alexander', 'Martin', 1), 
    (917, '111-789-0123', 'Charlotte', 'Thompson', 0), (918, '999-432-1098', 'Benjamin', 'Garcia', 0), 
    (919, '777-890-5678', 'Evelyn', 'Martinez', 0), (920, '333-678-2109', 'William', 'Robinson', 0);
    
    INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8001, 'Manage Pro Shop inventory'), (8002, 'Coordinate tee time reservations'), 
    (8003, 'Organize golf tournaments'), (8004, 'Oversee golf equipment maintenance'), 
    (8005, 'Conduct golf lessons for beginners'), (8006, 'Maintain golf course landscaping'), 
    (8007, 'Manage golf course website/social media'), (8008, 'Handle customer inquiries and complaints'), 
    (8009, 'Assist in organizing charity golf events'), (8010, 'Conduct daily course setup'), 
    (8011, 'Manage golf cart fleet'), (8012, 'Organize junior golf programs'), 
    (8013, 'Assist in food and beverage service at the clubhouse'), (8014, 'Conduct golf club fittings'), 
    (8015, 'Provide caddying services'), (8016, 'Coordinate golf course events calendar'), 
    (8017, 'Conduct on-course player assistance'), (8018, 'Monitor pace of play on the course'), 
    (8019, 'Supervise driving range operations'), (8020, 'Conduct pro shop sales');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8021, 'Coordinate golf course maintenance schedule'), 
    (8022, 'Administer handicap systems'), 
    (8023, 'Manage tournament scoring'), 
    (8024, 'Oversee golf course safety protocols'), 
    (8025, 'Conduct golf course marketing campaigns'), 
    (8026, 'Coordinate golf course promotions'), 
    (8027, 'Manage golf course memberships'), 
    (8028, 'Assist in golf course financial planning'), 
    (8029, 'Provide golf etiquette guidance'), 
    (8030, 'Conduct on-course golf etiquette checks');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8031, 'Organize golf club repair services'), 
    (8032, 'Coordinate golf course sponsorships'), 
    (8033, 'Manage golf course partnerships'), 
    (8034, 'Conduct golf course environmental sustainability initiatives'), 
    (8035, 'Assist in golf course rules enforcement'), 
    (8036, 'Coordinate golf course employee training'), 
    (8037, 'Oversee golf course cleanliness and sanitation'), 
    (8038, 'Conduct twilight golf events'), 
    (8039, 'Manage golf course special events'), 
    (8040, 'Assist in golf course equipment purchases');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8041, 'Coordinate golf course vendor relationships'), 
    (8042, 'Conduct golf course inventory audits'), 
    (8043, 'Oversee beverage cart service on the course'), 
    (8044, 'Coordinate golf course volunteer programs'), 
    (8045, 'Conduct golf course course marshaling'), 
    (8046, 'Oversee golf course technology upgrades'), 
    (8047, 'Coordinate golf course expansion projects'), 
    (8048, 'Manage golf course access control systems'), 
    (8049, 'Organize golf course maintenance equipment purchases'), 
    (8050, 'Coordinate golf course photography/videography');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8051, 'Conduct golf course player feedback surveys'), 
    (8052, 'Oversee golf course data analysis and reporting'), 
    (8053, 'Coordinate golf course junior memberships'), 
    (8054, 'Assist in golf course banquet coordination'), 
    (8055, 'Conduct golf course staff evaluations'), 
    (8056, 'Oversee golf course irrigation systems'), 
    (8057, 'Manage golf course waste management'), 
    (8058, 'Coordinate golf course pro-am tournaments'), 
    (8059, 'Assist in golf course capital improvement projects'), 
    (8060, 'Organize golf course social events');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8061, 'Oversee golf course clubhouse rentals'), 
    (8062, 'Manage golf course loyalty programs'), 
    (8063, 'Coordinate golf course charity fundraisers'), 
    (8064, 'Conduct golf course equipment demonstrations'), 
    (8065, 'Oversee golf course safety training programs'), 
    (8066, 'Coordinate golf course promotional merchandise'), 
    (8067, 'Manage golf course special discount programs'), 
    (8068, 'Conduct golf course player clinics'), 
    (8069, 'Oversee golf course player appreciation events'), 
    (8070, 'Coordinate golf course entertainment programs');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8071, 'Manage golf course tee box signage'), 
    (8072, 'Assist in golf course equipment trade-ins'), 
    (8073, 'Oversee golf course VIP member services'), 
    (8074, 'Coordinate golf course software upgrades'), 
    (8075, 'Conduct golf course product sampling events'), 
    (8076, 'Oversee golf course lost and found'), 
    (8077, 'Manage golf course sponsorship signage'), 
    (8078, 'Coordinate golf course loyalty reward programs'), 
    (8079, 'Organize golf course team-building events'), 
    (8080, 'Conduct golf course course condition assessments');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8081, 'Oversee golf course handicap tournaments'), 
    (8082, 'Manage golf course community outreach programs'), 
    (8083, 'Coordinate golf course merchandise displays'), 
    (8084, 'Conduct golf course charity auctions'), 
    (8085, 'Oversee golf course instruction programs'), 
    (8086, 'Manage golf course employee recognition programs'), 
    (8087, 'Coordinate golf course customer appreciation events'), 
    (8088, 'Assist in golf course seasonal promotions'), 
    (8089, 'Oversee golf course player development programs'), 
    (8090, 'Conduct golf course guest speaker series');

INSERT INTO Assignment (Assignment_ID, Assignment_Description)
VALUES 
    (8091, 'Coordinate golf course course renovation projects'), 
    (8092, 'Manage golf course special membership offers'), 
    (8093, 'Organize golf course networking events'), 
    (8094, 'Conduct golf course holiday events'), 
    (8095, 'Oversee golf course charity partnerships'), 
    (8096, 'Coordinate golf course environmental cleanup events'), 
    (8097, 'Manage golf course on-course signage'), 
    (8098, 'Assist in golf course event sponsorships'), 
    (8099, 'Oversee golf course customer feedback programs'), 
    (8100, 'Coordinate golf course strategic planning initiatives');
    
INSERT INTO Has (Tee_Time_ID, Customer_ID)
VALUES 
    (1001, 914), (1002, 912), (1003, 909), (1004, 915), (1005, 920),
    (1006, 913), (1007, 910), (1008, 902), (1009, 905), (1010, 907),
    (1011, 910), (1012, 903), (1013, 917), (1014, 916), (1015, 911),
    (1016, 919), (1017, 919), (1018, 908), (1019, 918), (1020, 901);

INSERT INTO Manages (TeeTime_ID, Employee_ID)
VALUES 
    (1001, '011'), (1002, '011'), (1003, '011'), (1004, '011'), (1005, '011'),
    (1006, '011'), (1007, '011'), (1008, '012'), (1009, '012'), (1010, '012'),
    (1011, '012'), (1012, '012'), (1013, '012'), (1014, '012'), (1015, '012'),
    (1016, '013'), (1017, '013'), (1018, '013'), (1019, '013'), (1020, '013');

INSERT INTO Uses (Tee_Time_ID, Equipment_ID) VALUES 
(1001, 402), (1002, 409), (1003, 403), (1004, 407), (1005, 405), 
(1006, 413), (1007, 400), (1008, 401), (1009, 419), (1010, 408), 
(1011, 416), (1012, 414), (1013, 410), (1014, 412), (1015, 415), 
(1016, 411), (1017, 406), (1018, 404), (1019, 417), (1020, 418);


INSERT INTO Member (Customer_ID, Member_Price)
VALUES 
    (901, 10.50), (902, 15.50), (903, 15.50), (904, 15.50), (905, 5.50), (916, 16.50);

INSERT INTO Guest (Customer_ID, Guest_Price)
VALUES 
    (906, 27.5), (907, 25.5), (908, 26.5), (909, 22.5), (910, 23.5),
    (911, 18.5), (912, 18.5), (913, 25.5), (914, 25.5), (915, 25.5),
    (917, 36.5), (918, 30.5), (919, 30.5), (920, 29.5);

INSERT INTO Used_By (Assignment_ID, Equipment_ID) VALUES 
(8009, 402), (8010, 409), (8011, 403), (8012, 407), (8013, 405), 
(8014, 413), (8015, 400), (8016, 401), (8017, 419), (8018, 408), 
(8019, 416), (8020, 414), (8021, 410), (8022, 412), (8023, 415), (8024, 411);


INSERT INTO Works_On (Assignment_ID, Employee_ID) VALUES
    (8001, '005'), (8002, '008'), (8003, '012'), (8004, '017'), (8005, '013'), (8006, '004'), (8007, '016'), (8008, '011'), (8009, '009'), (8010, '020'),
    (8011, '018'), (8012, '006'), (8013, '015'), (8014, '007'), (8015, '003'), (8016, '010'), (8017, '014'), (8018, '002'), (8019, '019'), (8020, '005'),
    (8021, '012'), (8022, '013'), (8023, '008'), (8024, '016'), (8025, '020'), (8026, '004'), (8027, '017'), (8028, '011'), (8029, '009'), (8030, '018'),
    (8031, '007'), (8032, '015'), (8033, '006'), (8034, '003'), (8035, '010'), (8036, '014'), (8037, '002'), (8038, '019'), (8039, '005'), (8040, '008'),
    (8041, '012'), (8042, '017'), (8043, '013'), (8044, '004'), (8045, '016'), (8046, '011'), (8047, '009'), (8048, '020'), (8049, '018'), (8050, '006'),
    (8051, '015'), (8052, '007'), (8053, '003'), (8054, '010'), (8055, '014'), (8056, '002'), (8057, '019'), (8058, '005'), (8059, '008'), (8060, '012'),
    (8061, '017'), (8062, '013'), (8063, '004'), (8064, '016'), (8065, '011'), (8066, '009'), (8067, '020'), (8068, '018'), (8069, '006'), (8070, '015'),
    (8071, '007'), (8072, '003'), (8073, '010'), (8074, '014'), (8075, '002'), (8076, '019'), (8077, '005'), (8078, '008'), (8079, '012'), (8080, '017'),
    (8081, '013'), (8082, '004'), (8083, '016'), (8084, '011'), (8085, '009'), (8086, '020'), (8087, '018'), (8088, '006'), (8089, '015'), (8090, '007'),
    (8091, '003'), (8092, '010'), (8093, '014'), (8094, '002'), (8095, '019'), (8096, '005'), (8097, '008'), (8098, '012'), (8099, '017'), (8100, '013');

