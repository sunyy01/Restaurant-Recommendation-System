/* Initialize Tables and Instances*/

drop table R_Postedby_BO;
drop table R_Receive_RV;
drop table C_Follow_R;
drop table R_is_DS;
drop table C_Comment_F;
drop table C_Search_T;
drop table C_Search_F;
drop table C_Search_DS;
drop table R_has_F;
drop table R_Include_T;
drop table R_offer_price;
drop table C_Reserve_R1;
drop table C_Reserve_R3;
drop table C_Reserve_R4;

drop table Customer;
drop table Price;
drop table Feature;
drop table Dish_Style;
drop table Restaurant;
drop table R_got_rating;
drop table Business_Owner;
drop table RType;
drop table Reservation;
drop table C_give_rating;

CREATE TABLE Business_Owner (
    Email varchar(50),
    ID varchar(50),
    pwd varchar(18),
    PRIMARY KEY (Email, ID)
);
grant select on Business_Owner to public;


CREATE TABLE Customer (
    Email varchar(50),
    ID varchar(50),
    pwd varchar(18),
    address varchar(50),
    PRIMARY KEY (Email, ID)
);
grant select on Customer to public;


CREATE TABLE Price (
    priceID varchar(50),
    price_range varchar(50),
    PRIMARY KEY (priceID)
);
grant select on Price to public;


CREATE TABLE RType (
    RTypeID varchar(50),
    Rtypename varchar(50),
    PRIMARY KEY (RTypeID)
);
grant select on RType to public;


CREATE TABLE Feature (
    FeatureID varchar(50),
    description varchar(50),
    PRIMARY KEY (FeatureID)
);
grant select on Feature to public;


CREATE TABLE Dish_Style (
    StyleID varchar(50),
    DS_name varchar(50),
    PRIMARY KEY (StyleID)
);
grant select on Dish_Style to public;


CREATE TABLE Reservation (
    Address varchar(50),
    Name varchar(50),
    Confirm_No char(50),
    PRIMARY KEY (Confirm_No)
);
grant select on Reservation to public;


CREATE TABLE R_Postedby_BO (
    r_Address varchar(50),
    r_Name varchar(50),
    Email varchar(50) NOT NULL,
    ID varchar(50) NOT NULL,
    Time Date,
    PRIMARY KEY (r_Address, r_Name, Email, ID),
    FOREIGN KEY (Email, ID) 
        REFERENCES Business_Owner (Email, ID)
        ON DELETE CASCADE
);
grant select on R_Postedby_BO to public;


CREATE TABLE R_Receive_RV (
    r_Address varchar(50),
    r_Name varchar(50),
    confirm_No char(50),
    PRIMARY KEY (r_Address, r_Name, confirm_No)
);
grant select on R_Receive_RV to public;


CREATE TABLE C_Follow_R (
    c_Email varchar(50),
    c_ID varchar(50),
    r_Address varchar(50),
    r_Name varchar(50),
    PRIMARY KEY (c_Email, c_ID, r_Address, r_Name),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID)
);
grant select on C_Follow_R to public;


CREATE TABLE R_is_DS (
    r_Address varchar(50),
    r_Name varchar(50),
    styleID varchar(50) NOT NULL,
    PRIMARY KEY (r_Address, r_Name, styleID),
    FOREIGN KEY (styleID) REFERENCES Dish_Style (StyleID)
);
grant select on R_is_DS to public;


CREATE TABLE C_Comment_F (
    c_Email varchar(50),
    c_ID varchar(50),
    featureID varchar(50),
    Time date,
    PRIMARY KEY (c_Email, c_ID, featureID),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID),
    FOREIGN KEY (featureID) REFERENCES Feature (FeatureID)
);
grant select on C_Comment_F to public;


CREATE TABLE C_Search_T (
    c_Email varchar(50),
    c_ID varchar(50),
    RtypeID varchar(50),
    PRIMARY KEY (c_Email, c_ID, RtypeID),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID),
    FOREIGN KEY (RtypeID) REFERENCES RType (RtypeID)
);
grant select on C_Search_T to public;


CREATE TABLE C_Search_F (
    c_Email varchar(50),
    c_ID varchar(50),
    featureID varchar(50),
    PRIMARY KEY (c_Email, c_ID, featureID),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID),
    FOREIGN KEY (featureID) REFERENCES Feature (FeatureID)
);
grant select on C_Search_F to public;


CREATE TABLE C_Search_DS (
    c_Email varchar(50),
    c_ID varchar(50),
    styleID varchar(50),
    PRIMARY KEY (c_Email, c_ID, styleID),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID),
    FOREIGN KEY (styleID) REFERENCES Dish_Style (StyleID)
);
grant select on C_Search_DS to public;


CREATE TABLE R_has_F (
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    featureID VARCHAR(50) NOT NULL,
    PRIMARY KEY (r_Address, r_Name, featureID),
    FOREIGN KEY (featureID) REFERENCES Feature(FeatureID)
);
grant select on R_has_F to public;


CREATE TABLE R_Include_T (
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    RtypeID VARCHAR(50) NOT NULL,
    PRIMARY KEY (r_Address, r_Name, RtypeID),
    FOREIGN KEY (RtypeID) REFERENCES RType(RtypeID)
);
grant select on R_Include_T to public;


CREATE TABLE R_offer_price (
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    priceID VARCHAR(50) NOT NULL,
    PRIMARY KEY (r_Address, r_Name, priceID),
    FOREIGN KEY (priceID) REFERENCES Price(priceID)
);
grant select on R_offer_price to public;


CREATE TABLE Restaurant (
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    Location VARCHAR(50),
    Open_hour varchar(50),
    Max_allowance INTEGER,
    PRIMARY KEY (r_Address, r_Name)
);
grant select on Restaurant to public;


CREATE TABLE C_Reserve_R1 (
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    confirm_No CHAR(50),
    c_ID VARCHAR(50),
    c_Email VARCHAR(50),
    PRIMARY KEY (r_Address, r_Name, confirm_No),
    FOREIGN KEY (r_Address, r_Name) REFERENCES Restaurant(r_Address, r_Name),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID)
);
grant select on C_Reserve_R1 to public;


CREATE TABLE C_Reserve_R3 (
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    confirm_No CHAR(50),
    reserveTime TIMESTAMP,
    PRIMARY KEY (r_Address, r_Name, confirm_No),
    FOREIGN KEY (r_Address, r_Name) REFERENCES Restaurant(r_Address, r_Name)
);
grant select on C_Reserve_R3 to public;


CREATE TABLE C_Reserve_R4 (
    c_Email VARCHAR(50),
    c_ID VARCHAR(50),
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    confirm_No CHAR(50),
    PRIMARY KEY (c_Email, r_Address, r_Name, confirm_No),
    FOREIGN KEY (r_Address, r_Name) REFERENCES Restaurant (r_Address, r_Name),
    FOREIGN KEY (c_Email, c_ID) REFERENCES Customer (Email, ID)
);
grant select on C_Reserve_R4 to public;


CREATE TABLE C_give_rating (
    ratingID VARCHAR(50),
    c_Email VARCHAR(50),
    c_ID VARCHAR(50),
    stars INTEGER,
    PRIMARY KEY (c_Email, c_ID, ratingID)
);
grant select on C_give_rating to public;


CREATE TABLE R_got_rating (
    ratingID VARCHAR(50),
    stars INTEGER,
    r_Address VARCHAR(50),
    r_Name VARCHAR(50),
    c_Email VARCHAR(50),
    c_ID VARCHAR(50),
    PRIMARY KEY (r_Address, r_Name, ratingID),
    FOREIGN KEY (c_Email, c_ID, ratingID) 
        REFERENCES C_give_rating(c_Email, c_ID, ratingID)
); 
grant select on R_got_rating to public;



INSERT INTO Business_Owner (Email, ID, pwd) VALUES 
('johndoe@gmail.com', 'JD123', '12345');
INSERT INTO Business_Owner (Email, ID, pwd) VALUES 
('janedoe@gmail.com', 'JD456', '12345');
INSERT INTO Business_Owner (Email, ID, pwd) VALUES  
('bobsmith@gmail.com', 'BS789', '12345');
INSERT INTO Business_Owner (Email, ID, pwd) VALUES 
('amandajones@gmail.com', 'AJ012', '12345');
INSERT INTO Business_Owner (Email, ID, pwd) VALUES  
('peterparker@gmail.com', 'PP345', '12345');

INSERT INTO Customer(Email, ID, pwd, address) VALUES
('alice@example.com', '111111', 'pass123', '123 Main St.');
INSERT INTO Customer(Email, ID, pwd, address) VALUES
('bob@example.com', '222222', 'pass456', '456 Second St.');
INSERT INTO Customer(Email, ID, pwd, address) VALUES
('charlie@example.com', '333333','pass789', '789 Third St.');
INSERT INTO Customer(Email, ID, pwd, address) VALUES
('diana@example.com', '444444', 'pass012', '012 Fourth St.');
INSERT INTO Customer(Email, ID, pwd, address) VALUES
('eric@example.com', '555555', 'pass345', '345 Fifth St.');
INSERT INTO Customer(Email, ID, pwd, address) VALUES 
('apple@example.com', '666666', 'pass123', '123 Main St.');
INSERT INTO Customer(Email, ID, pwd, address)  VALUES 
('banana@example.com', '777777', 'pass123', '100 Main St.');
INSERT INTO Customer(Email, ID, pwd, address)  VALUES 
('peach@example.com', '888888', 'pass123', '154 Main St.');
INSERT INTO Customer(Email, ID, pwd, address)  VALUES 
('grape@example.com', '999999', 'pass123', '897 Main St.');


INSERT INTO Restaurant (r_Address, r_Name, Location, Open_hour, Max_allowance) VALUES
('123 Main St', 'The Rusty Spoon', 'Downtown', '10am - 10pm', 50);
INSERT INTO Restaurant (r_Address, r_Name, Location, Open_hour, Max_allowance) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'Kitsilano', '11am - 9pm', 30);
INSERT INTO Restaurant (r_Address, r_Name, Location, Open_hour, Max_allowance) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'West End', '9am - 11pm', 70);
INSERT INTO Restaurant (r_Address, r_Name, Location, Open_hour, Max_allowance) VALUES
('321 Elm St', 'The Cheesy Grin', 'Yaletown', '12pm - 10pm', 40);
INSERT INTO Restaurant (r_Address, r_Name, Location, Open_hour, Max_allowance) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'Gastown', '11am - 11pm', 50);
INSERT INTO Restaurant (r_Address, r_Name, Location, Open_hour, Max_allowance) VALUES
('123 Robson St', 'The Pretty Knife', 'Downtown', '5pm - 10pm', 100);


INSERT INTO Price(priceID, price_range) VALUES
('P001', 'Under $10');
INSERT INTO Price(priceID, price_range) VALUES
('P002', '$10 - $50');
INSERT INTO Price(priceID, price_range) VALUES
('P003', '$50 - $30');
INSERT INTO Price(priceID, price_range) VALUES
('P004', '$30 - $40');
INSERT INTO Price(priceID, price_range) VALUES
('P005', 'Over $40');

INSERT INTO RType(RtypeID, Rtypename) VALUES
('T001', 'Hot pot');
INSERT INTO RType(RtypeID, Rtypename) VALUES
('T002', 'Pizza');
INSERT INTO RType(RtypeID, Rtypename) VALUES
('T003', 'Tacos');
INSERT INTO RType(RtypeID, Rtypename) VALUES
('T004', 'Seafood');
INSERT INTO RType(RtypeID, Rtypename) VALUES
('T005', 'Burger');


INSERT INTO Feature(FeatureID, description) VALUES
('F001', 'Outdoor Seating');
INSERT INTO Feature(FeatureID, description) VALUES
('F002', 'Vegetarian Options');
INSERT INTO Feature(FeatureID, description) VALUES
('F003', 'Gluten-free Options');
INSERT INTO Feature(FeatureID, description) VALUES
('F004', 'Live Music');
INSERT INTO Feature(FeatureID, description) VALUES
('F005', 'Happy Hour');


INSERT INTO Dish_Style(StyleID, DS_name) VALUES
('DS001', 'Chinese');
INSERT INTO Dish_Style(StyleID, DS_name) VALUES
('DS002', 'Italian');
INSERT INTO Dish_Style(StyleID, DS_name) VALUES
('DS003', 'Mexican');
INSERT INTO Dish_Style(StyleID, DS_name) VALUES
('DS004', 'Japanese');
INSERT INTO Dish_Style(StyleID, DS_name) VALUES
('DS005', 'American');


INSERT INTO Reservation(Address, Name, Confirm_No) VALUES
('123 Main St', 'The Rusty Spoon', 'ABC123');
INSERT INTO Reservation(Address, Name, Confirm_No) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'DEF456');
INSERT INTO Reservation(Address, Name, Confirm_No) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'GHI789');
INSERT INTO Reservation(Address, Name, Confirm_No) VALUES
('321 Elm St', 'The Cheesy Grin', 'JKL012');
INSERT INTO Reservation(Address, Name, Confirm_No) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'MNO345');


INSERT INTO R_Postedby_BO (r_Address, r_Name, Email, ID, Time) VALUES
('123 Main St', 'The Rusty Spoon', 'johndoe@gmail.com', 'JD123', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO R_Postedby_BO (r_Address, r_Name, Email, ID, Time) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'janedoe@gmail.com', 'JD456', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO R_Postedby_BO (r_Address, r_Name, Email, ID, Time) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'bobsmith@gmail.com', 'BS789', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO R_Postedby_BO (r_Address, r_Name, Email, ID, Time) VALUES
('321 Elm St', 'The Cheesy Grin', 'amandajones@gmail.com', 'AJ012', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO R_Postedby_BO (r_Address, r_Name, Email, ID, Time) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'peterparker@gmail.com', 'PP345', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO R_Receive_RV (r_Address, r_Name, Confirm_No) VALUES
('123 Main St', 'The Rusty Spoon', 'ABC123');
INSERT INTO R_Receive_RV (r_Address, r_Name, Confirm_No) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'DEF456');
INSERT INTO R_Receive_RV (r_Address, r_Name, Confirm_No) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'GHI789');
INSERT INTO R_Receive_RV (r_Address, r_Name, Confirm_No) VALUES
('321 Elm St', 'The Cheesy Grin', 'JKL012');
INSERT INTO R_Receive_RV (r_Address, r_Name, Confirm_No) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'MNO345');

INSERT INTO C_Follow_R (c_Email, c_ID, r_Address, r_Name) VALUES
('alice@example.com', '111111', '123 Main St', 'The Rusty Spoon');
INSERT INTO C_Follow_R (c_Email, c_ID, r_Address, r_Name) VALUES
('bob@example.com', '222222', '456 Oak St', 'The Hungry Wolf');
INSERT INTO C_Follow_R (c_Email, c_ID, r_Address, r_Name) VALUES
('charlie@example.com', '333333', '789 Pine St', 'The Gourmet Kitchen');
INSERT INTO C_Follow_R (c_Email, c_ID, r_Address, r_Name) VALUES
('diana@example.com', '444444', '321 Elm St', 'The Cheesy Grin');
INSERT INTO C_Follow_R (c_Email, c_ID, r_Address, r_Name) VALUES
('eric@example.com', '555555', '654 Cedar Ave', 'The Spicy Bite');
 

INSERT INTO R_is_DS (r_Address, r_Name, StyleID) VALUES
('123 Main St', 'The Rusty Spoon', 'DS001');
INSERT INTO R_is_DS (r_Address, r_Name, StyleID) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'DS002');
INSERT INTO R_is_DS (r_Address, r_Name, StyleID) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'DS003');
INSERT INTO R_is_DS (r_Address, r_Name, StyleID) VALUES
('321 Elm St', 'The Cheesy Grin', 'DS004');
INSERT INTO R_is_DS (r_Address, r_Name, StyleID) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'DS005');


INSERT INTO C_Comment_F (c_Email, c_ID, FeatureID, Time) VALUES
('alice@example.com', '111111', 'F001', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_Comment_F (c_Email, c_ID, FeatureID, Time) VALUES
('bob@example.com', '222222', 'F002', TO_DATE('2020-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_Comment_F (c_Email, c_ID, FeatureID, Time) VALUES
('charlie@example.com', '333333', 'F003', TO_DATE('2023-02-19', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_Comment_F (c_Email, c_ID, FeatureID, Time) VALUES
('diana@example.com', '444444', 'F004', TO_DATE('2021-06-16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_Comment_F (c_Email, c_ID, FeatureID, Time) VALUES
('eric@example.com', '555555', 'F005', TO_DATE('2022-06-16', 'YYYY-MM-DD HH24:MI:SS'));


-- INSERT INTO C_Search_T (c_Email, c_ID, RTypeID) VALUES
-- ('alice@example.com', '111111', 'T001');
-- INSERT INTO C_Search_T (c_Email, c_ID, RTypeID) VALUES
-- ('bob@example.com', '222222', 'T002');
-- INSERT INTO C_Search_T (c_Email, c_ID, RTypeID) VALUES
-- ('charlie@example.com', '333333', 'T003');
-- INSERT INTO C_Search_T (c_Email, c_ID, RTypeID) VALUES
-- ('diana@example.com', '444444', 'T004');
-- INSERT INTO C_Search_T (c_Email, c_ID, RTypeID) VALUES
-- ('eric@example.com', '555555', 'T005');


-- INSERT INTO C_Search_F (c_Email, c_ID, featureID) VALUES
-- ('alice@example.com', '111111', 'F001');
-- INSERT INTO C_Search_F (c_Email, c_ID, featureID) VALUES
-- ('bob@example.com', '222222', 'F002');
-- INSERT INTO C_Search_F (c_Email, c_ID, featureID) VALUES
-- ('charlie@example.com', '333333', 'F003');
-- INSERT INTO C_Search_F (c_Email, c_ID, featureID) VALUES
-- ('diana@example.com', '444444', 'F001');
-- INSERT INTO C_Search_F (c_Email, c_ID, featureID) VALUES
-- ('eric@example.com', '555555', 'F004');


-- INSERT INTO C_Search_DS (c_Email, c_ID, styleID) VALUES
-- ('alice@example.com', '111111', 'DS001');
-- INSERT INTO C_Search_DS (c_Email, c_ID, styleID) VALUES
-- ('bob@example.com', '222222', 'DS005');
-- INSERT INTO C_Search_DS (c_Email, c_ID, styleID) VALUES
-- ('charlie@example.com', '333333', 'DS004');
-- INSERT INTO C_Search_DS (c_Email, c_ID, styleID) VALUES
-- ('diana@example.com', '444444', 'DS003');
-- INSERT INTO C_Search_DS (c_Email, c_ID, styleID) VALUES
-- ('eric@example.com', '555555', 'DS002');


INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('123 Main St', 'The Rusty Spoon', 'F001');
INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'F003');
INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'F002');
INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('321 Elm St', 'The Cheesy Grin', 'F003');
INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'F005');
INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'F001');
INSERT INTO R_has_F (r_Address, r_Name, featureID) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'F002');


INSERT INTO R_Include_T (r_Address, r_Name, RtypeID) VALUES
('123 Main St', 'The Rusty Spoon', 'T001');
INSERT INTO R_Include_T (r_Address, r_Name, RtypeID) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'T002');
INSERT INTO R_Include_T (r_Address, r_Name, RtypeID) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'T003');
INSERT INTO R_Include_T (r_Address, r_Name, RtypeID) VALUES
('321 Elm St', 'The Cheesy Grin', 'T004');
INSERT INTO R_Include_T (r_Address, r_Name, RtypeID) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'T001');


INSERT INTO R_offer_price (r_Address, r_Name, priceID) VALUES
('123 Main St', 'The Rusty Spoon', 'P001');
INSERT INTO R_offer_price (r_Address, r_Name, priceID) VALUES
('456 Oak Ave', 'The Hungry Wolf', 'P002');
INSERT INTO R_offer_price (r_Address, r_Name, priceID) VALUES
('789 Pine St', 'The Gourmet Kitchen', 'P003');
INSERT INTO R_offer_price (r_Address, r_Name, priceID) VALUES
('321 Elm St', 'The Cheesy Grin', 'P002');
INSERT INTO R_offer_price (r_Address, r_Name, priceID) VALUES
('654 Cedar Ave', 'The Spicy Bite', 'P001');



INSERT INTO C_Reserve_R1 (r_Address, r_Name, confirm_No, c_ID) VALUES
('123 Main St', 'The Rusty Spoon', '1234abcd', '111111');
INSERT INTO C_Reserve_R1 (r_Address, r_Name, confirm_No, c_ID) VALUES
('456 Oak Ave', 'The Hungry Wolf', '5678efgh', '222222');
INSERT INTO C_Reserve_R1 (r_Address, r_Name, confirm_No, c_ID) VALUES
('789 Pine St', 'The Gourmet Kitchen', '901202ijkl', '333333');
INSERT INTO C_Reserve_R1 (r_Address, r_Name, confirm_No, c_ID) VALUES
('321 Elm St', 'The Cheesy Grin', '3456mnop', '444444');
INSERT INTO C_Reserve_R1 (r_Address, r_Name, confirm_No, c_ID) VALUES
('654 Cedar Ave', 'The Spicy Bite', '7890qrst', '555555');


INSERT INTO C_Reserve_R3 (r_Address, r_Name, confirm_No, reserveTime) VALUES 
('123 Main St', 'The Rusty Spoon', 'ABC12345', TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO C_Reserve_R3 (r_Address, r_Name, confirm_No, reserveTime) VALUES 
('456 Oak Ave', 'The Hungry Wolf', 'DEF67890', TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO C_Reserve_R3 (r_Address, r_Name, confirm_No, reserveTime) VALUES 
('789 Pine St', 'The Gourmet Kitchen', 'GHI12345', TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO C_Reserve_R3 (r_Address, r_Name, confirm_No, reserveTime) VALUES 
('321 Elm St', 'The Cheesy Grin', 'JKL67890', TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO C_Reserve_R3 (r_Address, r_Name, confirm_No, reserveTime) VALUES 
('654 Cedar Ave', 'The Spicy Bite', 'MNO12345', TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));


INSERT INTO C_Reserve_R4 (c_Email, r_Address, r_Name, confirm_No) VALUES 
('johnsmith@gmail.com', '123 Main St','The Rusty Spoon', 'ABC12345');
INSERT INTO C_Reserve_R4 (c_Email, r_Address, r_Name, confirm_No) VALUES 
('janedoe@gmail.com',  '456 Oak Ave', 'The Hungry Wolf', 'DEF67890');
INSERT INTO C_Reserve_R4 (c_Email, r_Address, r_Name, confirm_No) VALUES 
('johndoe@gmail.com', '789 Pine St', 'The Gourmet Kitchen', 'GHI12345');
INSERT INTO C_Reserve_R4 (c_Email, r_Address, r_Name, confirm_No) VALUES 
('janesmith@gmail.com',  '456 Oak Ave', 'The Hungry Wolf', 'JKL67890');
INSERT INTO C_Reserve_R4 (c_Email, r_Address, r_Name, confirm_No) VALUES 
('bobsmith@gmail.com', '123 Main St', 'The Rusty Spoon', 'MNO12345');


INSERT INTO C_give_rating (ratingID, c_Email, c_ID, stars) VALUES 
('R001', 'alice@example.com', '111111', 2);
INSERT INTO C_give_rating (ratingID, c_Email, c_ID, stars) VALUES 
('R002', 'bob@example.com', '222222', 3);
INSERT INTO C_give_rating (ratingID, c_Email, c_ID, stars) VALUES 
('R003', 'charlie@example.com', '333333', 4);
INSERT INTO C_give_rating (ratingID, c_Email, c_ID, stars) VALUES 
('R004', 'diana@example.com', '444444', 2);
INSERT INTO C_give_rating (ratingID, c_Email, c_ID, stars) VALUES 
('R005', 'eric@example.com', '555555', 5);

INSERT INTO C_give_rating (ratingID, c_Email, c_ID) VALUES 
('R006', 'apple@example.com', '666666');
INSERT INTO C_give_rating (ratingID, c_Email, c_ID) VALUES 
('R007', 'banana@example.com', '777777');
INSERT INTO C_give_rating (ratingID, c_Email, c_ID) VALUES 
('R008', 'peach@example.com', '888888');
INSERT INTO C_give_rating (ratingID, c_Email, c_ID) VALUES 
('R009', 'grape@example.com', '999999');
INSERT INTO C_give_rating (ratingID, c_Email, c_ID) VALUES 
('R0010', 'grape@example.com', '999999');


INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R001', 2, '789 Pine St', 'The Gourmet Kitchen','alice@example.com', '111111');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R002', 3, '456 Oak Ave', 'The Hungry Wolf','bob@example.com', '222222');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R003', 4, '654 Cedar Ave', 'The Spicy Bite', 'charlie@example.com', '333333');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R004', 2, '321 Elm St', 'The Cheesy Grin', 'diana@example.com', '444444');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R005', 5, '123 Main St', 'The Rusty Spoon','eric@example.com', '555555');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R006', 5, '123 Main St', 'The Rusty Spoon','apple@example.com', '666666');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R007', 5, '123 Main St', 'The Rusty Spoon','banana@example.com', '777777');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R008', 5, '123 Main St', 'The Rusty Spoon','peach@example.com', '888888');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R009', 5, '123 Main St', 'The Rusty Spoon','grape@example.com', '999999');
INSERT INTO R_got_rating (ratingID, stars, r_Address, r_Name, c_Email, c_ID) VALUES 
('R0010', 1, '123 Robson St', 'The Pretty Knife','grape@example.com', '999999');


commit work;