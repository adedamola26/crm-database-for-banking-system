--Branch
use NextGenDB;

-- create system tables
CREATE TABLE Branch (
    BranchID INT IDENTITY(101, 1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Manager VARCHAR(100)
);


--Customer
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1001, 1)PRIMARY KEY,
    BranchID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(6) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    RiskProfile VARCHAR(20) NOT NULL,
    EmploymentStatus VARCHAR(50),
    AnnualIncome DECIMAL(15,2),
    CONSTRAINT fk_customer_branch FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);



--Account
CREATE TABLE Account (
    AccountID INT IDENTITY(10001, 1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountType VARCHAR(15) NOT NULL,
    Balance DECIMAL(15,2),
    OpenDate DATE NOT NULL,
    CloseDate DATE,
    Status VARCHAR(15) NOT NULL,
    CONSTRAINT fk_account_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


--Channel
CREATE TABLE Channel (
    ChannelID INT PRIMARY KEY,
    ChannelName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL
);


--Service Request
CREATE TABLE ServiceRequest (
    RequestID INT PRIMARY KEY,
    ChannelID INT NOT NULL,
    CustomerID INT NOT NULL,
    RequestDate DATE NOT NULL,
    Description VARCHAR(200) NOT NULL,
    Status VARCHAR(15),
    CONSTRAINT fk_servicerequest_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID),
    CONSTRAINT fk_servicerequest_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--transaction
CREATE TABLE TransactionTable (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    ChannelID INT,
    Type VARCHAR(20),
    Description VARCHAR(200),
    TimeStamp DATETIME NOT NULL,
    CONSTRAINT fk_transaction_account FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    CONSTRAINT fk_transaction_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);

---user

CREATE TABLE UserTable (
    UserID INT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL,
    Password VARCHAR(200) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    AccountStatus VARCHAR(15) NOT NULL
);


--Audit Trail
CREATE TABLE AuditTrail (
    AuditID INT PRIMARY KEY,
    UserID INT NOT NULL,
    TransactionID INT NOT NULL,
    AffectedEntity VARCHAR(50),
    ActionType VARCHAR(15),
    TimeStamp DATETIME NOT NULL,
    CONSTRAINT fk_audittrail_userTable FOREIGN KEY (UserID) REFERENCES UserTable(UserID),
    CONSTRAINT fk_audittrail_transaction FOREIGN KEY (TransactionID) REFERENCES TransactionTable(TransactionID)
);
--security Profile
CREATE TABLE SecurityProfile (
    ProfileID INT PRIMARY KEY,
    AccessLevel VARCHAR(20) NOT NULL,
    LastUpdated DATETIME,
    Restrictions VARCHAR(50) NOT NULL
);

--Employee
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(10001, 1)PRIMARY KEY,
    BranchID INT NOT NULL,
    SecurityProfileID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(20) NOT NULL,
    Role VARCHAR(20),
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    CONSTRAINT fk_employee_branch FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    CONSTRAINT fk_employee_securityprofile FOREIGN KEY (SecurityProfileID) REFERENCES SecurityProfile(ProfileID)
);
--Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(200) NOT NULL,
    EligibilityCriteria VARCHAR(50),
    Type VARCHAR(15)
);

----loan
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    Type VARCHAR(15),
    MaximumAmount DECIMAL(15,2),
    InterestRate DECIMAL(3,2)
);

--survey
CREATE TABLE Survey (
    SurveyID INT PRIMARY KEY,
    Type VARCHAR(15),
    Description VARCHAR(100),
    Question VARCHAR(1000)
);
--- campaign
CREATE TABLE Campaign (
    CampaignID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(100),
    Type VARCHAR(15),
    StartDate DATE,
    EndDate DATE
);

--reward Prgram
CREATE TABLE RewardProgram (
    RewardProgramID INT PRIMARY KEY,
    Type VARCHAR(15),
    Description VARCHAR(100),
    Reward VARCHAR(100)
);
---event
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(15),
    Description VARCHAR(200),
    StartDate DATE,
    EndDate DATE
);
--notifcation
CREATE TABLE Notification (
    NotificationID INT PRIMARY KEY,
    Type VARCHAR(15),
    NotificationText VARCHAR(200),
    ChannelID INT,
    CONSTRAINT fk_notification_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);


--document
CREATE TABLE Document (
    DocumentID VARCHAR(100) PRIMARY KEY,
    CustomerID INT NOT NULL,
    Type VARCHAR(15),
    IssueDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    CONSTRAINT fk_document_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--regulatory compliance
CREATE TABLE RegulatoryCompliance (
    ComplianceID INT PRIMARY KEY,
    Name VARCHAR(100),
    ReviewDate DATE,
    Note VARCHAR(100),
    Status VARCHAR(20)
);
--investment Portfolio
CREATE TABLE InvestmentPortfolio (
    PortfolioID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AssetType VARCHAR(15),
    Quantity INT,
    PurchaseDate DATE,
    Value DECIMAL(15,2)
);
--ATM
CREATE TABLE ATM (
    ATMID INT PRIMARY KEY,
    BranchID INT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    ServiceStatus VARCHAR(15) NOT NULL,
    CONSTRAINT fk_atm_branch FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);




--Lead
CREATE TABLE Lead (
    LeadID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInformation VARCHAR(100) NOT NULL,
    Source VARCHAR(100),
    InterestLevel VARCHAR(15)
);


--Opportunity
CREATE TABLE Opportunity (
    OpportunityID INT PRIMARY KEY,
    LeadID INT NOT NULL,
    ExpectedRevenue DECIMAL(15,2),
    Probability INT,
    SalesStage VARCHAR(15)
);

--Task
CREATE TABLE Task (
    TaskID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(200) NOT NULL,
    ActionRequired VARCHAR(200)
);

--Interaction
CREATE TABLE Interaction (
    InteractionID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ChannelID INT NOT NULL,
    TimeStamp DATETIME NOT NULL,
    Type VARCHAR(15),
    CONSTRAINT fk_interaction_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_interaction_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fk_interaction_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);


---Task Assignment
CREATE TABLE TaskAssignment (
    AssignmentID INT PRIMARY KEY,
    TaskID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ServiceRequestID INT NOT NULL,
    AssignDate DATETIME NOT NULL,
    DueDate DATETIME NOT NULL,
    CONSTRAINT fk_taskassignment_task FOREIGN KEY (TaskID) REFERENCES Task(TaskID),
    CONSTRAINT fk_taskassignment_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fk_taskassignment_servicerequest FOREIGN KEY (ServiceRequestID) REFERENCES ServiceRequest(RequestID)
);

--Loan Application
CREATE TABLE LoanApplication (
    ApplicationID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    LoanID INT NOT NULL,
    AmountRequested DECIMAL(15,2) NOT NULL,
    SubmissionDate DATE NOT NULL,
    Status VARCHAR(15),
    CONSTRAINT fk_loanapplication_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_loanapplication_loan FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);

--Product Subcription
CREATE TABLE ProductSubscription (
    SubscriptionID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    SubscriptionDate DATETIME NOT NULL,
    CONSTRAINT fk_productsubscription_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT fk_productsubscription_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--Survey Enrolment
CREATE TABLE SurveyEnrolment (
    EnrolmentID INT PRIMARY KEY,
    SurveyID INT NOT NULL,
    CustomerID INT NOT NULL,
    Response VARCHAR(200) NOT NULL,
    EnrolmentDate DATETIME NOT NULL,
    CONSTRAINT fk_surveyenrolment_survey FOREIGN KEY (SurveyID) REFERENCES Survey(SurveyID),
    CONSTRAINT fk_surveyenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--Campain Enrolement
CREATE TABLE CampaignEnrolment (
    EnrolmentID INT PRIMARY KEY,
    CampaignID INT NOT NULL,
    CustomerID INT NOT NULL,
    LeadID INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL,
    CONSTRAINT fk_campaignenrolment_campaign FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID),
    CONSTRAINT fk_campaignenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_campaignenrolment_lead FOREIGN KEY (LeadID) REFERENCES Lead(LeadID)
);

--Reward Enrolment
CREATE TABLE RewardEnrolment (
    EnrolmentID INT PRIMARY KEY,
    RewardProgram VARCHAR(200) NOT NULL,
    CustomerID INT NOT NULL,
    EnrolmentDate DATE NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    RewardProgramID INT NOT null,
    CONSTRAINT fk_rewardenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_rewardenrolment_rewardProgram FOREIGN KEY (RewardProgramID) REFERENCES RewardProgram(RewardProgramID)
);

--Event Enrolment
CREATE TABLE EventEnrolment (
    EnrolmentID INT PRIMARY KEY,
    EventID INT NOT NULL,
    CustomerID INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL,
    CONSTRAINT fk_eventenrolment_event FOREIGN KEY (EventID) REFERENCES Event(EventID),
    CONSTRAINT fk_eventenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--Notification Enrolment
CREATE TABLE NotificationSubscription (
    SubscriptionID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    NotificationID INT NOT NULL,
    SubscriptionDate DATETIME NOT NULL,
    ChannelID INT NOT NULL,
    CONSTRAINT fk_notificationenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_notificationenrolment_notification FOREIGN KEY (NotificationID) REFERENCES Notification(NotificationID),
    CONSTRAINT fk_notificationenrolment_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);


--create system CONSTRAINTS

--Customer Table Constraints
----Check gender values
ALTER TABLE Customer
ADD CONSTRAINT gender_ck CHECK (UPPER(Gender) IN ('MALE', 'FEMALE', 'OTHER'));
----Ensure unique email address
ALTER TABLE Customer
ADD CONSTRAINT email_unique UNIQUE(Email);
-----Check email format
ALTER TABLE Customer
ADD CONSTRAINT email_format_check 
CHECK (Email LIKE '%_@__%.__%' AND Email NOT LIKE '%@%.@%');
----Check positive AnnualIncome
ALTER TABLE Customer
ADD CONSTRAINT income_ck CHECK (AnnualIncome >= 0 OR AnnualIncome IS NULL);


--Loan Table Constraints
----Check positive MaximumAmount
ALTER TABLE Loan
ADD CONSTRAINT amount_ck CHECK (MaximumAmount > 0);
----Check InterestRate between 0% and 100%
ALTER TABLE Loan
ADD CONSTRAINT interestrate_ck CHECK (InterestRate >= 0 AND InterestRate <= 100);

--Service Request Table Constraints
----Check Status values
ALTER TABLE ServiceRequest
ADD CONSTRAINT status_ck CHECK (UPPER(Status) IN ('OPEN', 'IN PROGRESS', 'CLOSED'));

--Employee Table Constraints
----Check valid email format for Employee
ALTER TABLE Employee
ADD CONSTRAINT emp_email_format_check 
CHECK (Email LIKE '%_@__%.__%' AND Email NOT LIKE '%@%.@%');

--Investment Portfolio Table Constraints
----Check positive Quantity
ALTER TABLE InvestmentPortfolio
ADD CONSTRAINT quantity_ck CHECK (Quantity >= 0);

--Document Table Constraints
----Ensure ExpiryDate is after IssueDate
ALTER TABLE Document
ADD CONSTRAINT expirydate_after_issue CHECK (ExpiryDate > IssueDate);

--Task Table Constraints
----Ensure DueDate is after the current date
ALTER TABLE TaskAssignment
ADD CONSTRAINT duedate_future CHECK (DueDate > GETDATE());

--Account Table ConstraintsF
----Ensure CloseDate is after OpenDate or NULL
ALTER TABLE Account
ADD CONSTRAINT closedate_after_open CHECK (CloseDate > OpenDate OR CloseDate IS NULL);
----Check positive Balance
ALTER TABLE Account
ADD CONSTRAINT balance_ck CHECK (Balance >= 0);


----create views

--CustomerContactInfo View
--Purpose: To provide a simple view of customer contact information.
CREATE VIEW CustomerContactInfo AS
SELECT CustomerID, Name, Email, Phone, Address
FROM Customer;


--AccountSummary View
--Purpose: To give a summary of account details including customer names.
CREATE VIEW AccountSummary AS
SELECT a.AccountID, a.AccountType, a.Balance, a.Status, c.Name AS CustomerName
FROM Account a
JOIN Customer c ON a.CustomerID = c.CustomerID;


--RecentTransactions View
--Purpose: To list recent transactions for quick review.

CREATE VIEW RecentTransactions AS
SELECT t.TransactionID, t.Type, t.Description, t.TimeStamp, a.AccountID
FROM Transaction t
JOIN Account a ON t.AccountID = a.AccountID
WHERE t.TimeStamp > GETDATE() - 30; 


--EmployeeDirectory View
--Purpose: To provide an employee directory with branch information.

CREATE VIEW EmployeeDirectory AS
SELECT e.EmployeeID, e.Name, e.Email, e.Phone, e.Department, b.Name AS BranchName
FROM Employee e
JOIN Branch b ON e.BranchID = b.BranchID;


--ActiveLoanApplications View
--Purpose: To track ongoing loan applications.
CREATE VIEW ActiveLoanApplications AS
SELECT la.ApplicationID, la.AmountRequested, la.SubmissionDate, la.Status, c.Name AS CustomerName
FROM LoanApplication la
JOIN Customer c ON la.CustomerID = c.CustomerID
WHERE la.Status = 'Pending';



--ServiceRequestStatus View
--Purpose: To monitor the status of service requests.
CREATE VIEW ServiceRequestStatus AS
SELECT sr.RequestID, sr.Description, sr.Status, sr.RequestDate, c.Name AS CustomerName
FROM ServiceRequest sr
JOIN Customer c ON sr.CustomerID = c.CustomerID;



--CampaignPerformance View
--Purpose: To assess the ongoing marketing campaigns.

CREATE VIEW CampaignPerformance AS
SELECT CampaignID, Name, Type, StartDate, EndDate
FROM Campaign;


---Index

--Customer Table
-- Index on BranchID: Useful if you often query customers based on their branch.
CREATE INDEX idx_customer_branchid ON Customer (BranchID);

--Account Table
-- Index on CustomerID: Helpful for quickly finding all accounts associated with a customer.
CREATE INDEX idx_account_customerid ON Account (CustomerID);

--Transaction Table
-- Index on AccountID: Useful for finding transactions for a specific account.
CREATE INDEX idx_transaction_accountid ON TransactionTable (AccountID);
-- Index on TimeStamp: If you frequently query recent transactions.
CREATE INDEX idx_transaction_timestamp ON TransactionTable (TimeStamp);

--Employee Table
-- Index on BranchID: If you often retrieve employees based on their branch.
CREATE INDEX idx_employee_branchid ON Employee (BranchID);

--Service Request Table
-- Index on CustomerID: Useful for accessing all service requests made by a specific customer.
CREATE INDEX idx_servicerequest_customerid ON ServiceRequest (CustomerID);
-- Index on Status: If you frequently filter service requests by their status.
CREATE INDEX idx_servicerequest_status ON ServiceRequest (Status);


--Loan Application Table
-- Index on CustomerID: Helps in quickly accessing loan applications made by a customer.
CREATE INDEX idx_loanapplication_customerid ON LoanApplication (CustomerID);
-- Index on Status: If you often query loan applications based on their status.
CREATE INDEX idx_loanapplication_status ON LoanApplication (Status);


--Audit Trail Table
-- Index on TimeStamp: If you regularly query recent audit records.
CREATE INDEX idx_audittrail_timestamp ON AuditTrail (TimeStamp);



