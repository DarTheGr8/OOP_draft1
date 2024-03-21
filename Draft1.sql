create database gym_system if not exists


--MEMBER TABLE STRING BASI MEMBER INFORMATION
CREATE TABLE Member (
    memberID INT PRIMARY KEY AUTO_INCREMENT,
    memberName VARCHAR(255) NOT NULL,
    memberPhoneNumber VARCHAR(20),
    memberAddress VARCHAR(255),
    memberEmail VARCHAR(255),
    dob DATE,
    gender ENUM('Male', 'Female'),
    membershipStartDate DATE,
    membershipEndDate DATE,
    height DECIMAL(5,2),
    weight DECIMAL(5,2)
);

CREATE TABLE Administration (
    administrationId INT PRIMARY KEY AUTO_INCREMENT,    --?doublecheck
    username VARCHAR(50) -- PRIMARY KEY,
    password VARCHAR(50),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    Phone VARCHAR(20),
    email VARCHAR(255)
);

--Admin table accesses all the fucntionalities available for the system and is probably 
CREATE TABLE Admin (
    adminId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(50),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    Phone VARCHAR(20),
    email VARCHAR(255),
    FOREIGN KEY (username) REFERENCES Administration(username)
);

CREATE TABLE User (
    name VARCHAR(255),
    userID INT,
    adminID INT,
    employeeID INT,
    userType ENUM('Admin', 'Employee')
FOREIGN KEY (name) REFERENCES Member(memberName)    
);

CREATE TABLE Payment (
    paymentID INT PRIMARY KEY AUTO_INCREMENT,
    memberID INT,
    paymentDate DATE,
    paymentMethod ENUM('Cash', 'Card'),
    totalFee DECIMAL(10, 2),
    paymentStatus ENUM('Paid', 'Owing', 'Half Paid'),
    outstandingBalance DECIMAL(10, 2),
    FOREIGN KEY (memberID) REFERENCES Member(memberID)
);


CREATE TABLE Plan (
    PlanID INT PRIMARY KEY AUTO_INCREMENT,
    memberID INT,
    planDuration INT,
    planPrice DECIMAL(10, 2),
    planName VARCHAR(255),
    planDescription VARCHAR(255),
    planBenefits VARCHAR(255),
    planEndDate DATE,
    planStartDate DATE
);


--link member and plan linking table
CREATE TABLE MemberPlan (
    memberID INT,
    PlanID INT,
    PRIMARY KEY (memberID, PlanID),
    FOREIGN KEY (memberID) REFERENCES Member(memberID),
    FOREIGN KEY (PlanID) REFERENCES Plan(PlanID)
);