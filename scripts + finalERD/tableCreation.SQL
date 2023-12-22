---Branch
CREATE TABLE Branch (
    BranchID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(15) NOT NULL,
    Manager VARCHAR2(100)
);



---Customer
CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    BranchID NUMBER NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR2(6),
    Address VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(15) NOT NULL,
    RiskProfile VARCHAR2(20) NOT NULL,
    EmploymentStatus VARCHAR2(50),
    AnnualIncome NUMBER(15,2),
    CONSTRAINT fk_customer_branch FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);



--Account
CREATE TABLE Account (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    AccountType VARCHAR2(15) NOT NULL,
    Balance NUMBER(15,2),
    OpenDate DATE NOT NULL,
    CloseDate DATE,
    Status VARCHAR2(15) NOT NULL,
    CONSTRAINT fk_account_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);



--Channel
CREATE TABLE Channel (
    ChannelID NUMBER PRIMARY KEY,
    ChannelName VARCHAR2(50) NOT NULL,
    Description VARCHAR2(100) NOT NULL
);



--Service Request
CREATE TABLE ServiceRequest (
    RequestID NUMBER PRIMARY KEY,
    ChannelID NUMBER NOT NULL,
    CustomerID NUMBER NOT NULL,
    RequestDate DATE NOT NULL,
    Description VARCHAR2(200) NOT NULL,
    Status VARCHAR2(15),
    CONSTRAINT fk_servicerequest_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID),
    CONSTRAINT fk_servicerequest_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


---Transaction
CREATE TABLE Transaction (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    ChannelID NUMBER,
    Type VARCHAR2(20),
    Description VARCHAR2(200),
    TimeStamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_transaction_account FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    CONSTRAINT fk_transaction_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);


--User
CREATE TABLE UserTable (
    UserID NUMBER PRIMARY KEY,
    Username VARCHAR2(100) NOT NULL,
    Password VARCHAR2(200) NOT NULL,
    Role VARCHAR2(20) NOT NULL,
    AccountStatus VARCHAR2(15) NOT NULL
);


--Audit Trail
CREATE TABLE AuditTrail (
    AuditID NUMBER PRIMARY KEY,
    UserID NUMBER NOT NULL,
    TransactionID NUMBER NOT NULL,
    AffectedEntity VARCHAR2(50),
    ActionType VARCHAR2(15),
    TimeStamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_audittrail_userTable FOREIGN KEY (UserID) REFERENCES UserTable(UserID),
    CONSTRAINT fk_audittrail_transaction FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID)
);


--Security Profile
CREATE TABLE SecurityProfile (
    ProfileID NUMBER PRIMARY KEY,
    AccessLevel VARCHAR2(20) NOT NULL,
    LastUpdated TIMESTAMP,
    Restrictions VARCHAR2(50) NOT NULL
);




--Employee
CREATE TABLE Employee (
    EmployeeID NUMBER PRIMARY KEY,
    BranchID NUMBER NOT NULL,
    SecurityProfileID NUMBER NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    Department VARCHAR2(20) NOT NULL,
    Role VARCHAR2(20),
    Email VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(15) NOT NULL,
    CONSTRAINT fk_employee_branch FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    CONSTRAINT fk_employee_securityprofile FOREIGN KEY (SecurityProfileID) REFERENCES SecurityProfile(ProfileID)
);



--Product
CREATE TABLE Product (
    ProductID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Description VARCHAR2(200) NOT NULL,
    EligibilityCriteria VARCHAR2(50),
    Type VARCHAR2(15)
);



--Loan
CREATE TABLE Loan (
    LoanID NUMBER PRIMARY KEY,
    Type VARCHAR2(15),
    MaximumAmount NUMBER(15,2),
    InterestRate NUMBER(3,2)
);




--Survey
CREATE TABLE Survey (
    SurveyID NUMBER PRIMARY KEY,
    Type VARCHAR2(50),
    Description VARCHAR2(100),
    Question VARCHAR2(1000)
);



--Campaign
CREATE TABLE Campaign (
    CampaignID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Description VARCHAR2(100),
    Type VARCHAR2(15),
    StartDate DATE,
    EndDate DATE
);


--Reward Prgram
CREATE TABLE RewardProgram (
    RewardProgramID NUMBER PRIMARY KEY,
    Type VARCHAR2(15),
    Description VARCHAR2(100),
    Reward VARCHAR2(100)
);


--Events
CREATE TABLE Event (
    EventID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Type VARCHAR2(15),
    Description VARCHAR2(200),
    StartDate DATE,
    EndDate DATE
);


--Notification
CREATE TABLE Notification (
    NotificationID NUMBER PRIMARY KEY,
    Type VARCHAR2(15),
    NotificationText VARCHAR2(200),
    ChannelID NUMBER,
    CONSTRAINT fk_notification_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);


--Document
CREATE TABLE Document (
    DocumentID VARCHAR2(100) PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    Type VARCHAR2(15),
    IssueDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    CONSTRAINT fk_document_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


--Regulatory Compliance
CREATE TABLE RegulatoryCompliance (
    ComplianceID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    ReviewDate DATE,
    Note VARCHAR2(100),
    Status VARCHAR2(20)
);


--Investment Portfolio
CREATE TABLE InvestmentPortfolio (
    PortfolioID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    AssetType VARCHAR2(15),
    Quantity NUMBER,
    PurchaseDate DATE,
    Value NUMBER(15,2)
);


--ATM
CREATE TABLE ATM (
    ATMID NUMBER PRIMARY KEY,
    BranchID NUMBER NOT NULL,
    Location VARCHAR2(100) NOT NULL,
    ServiceStatus VARCHAR2(15) NOT NULL,
    CONSTRAINT fk_atm_branch FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);


--Lead
CREATE TABLE Lead (
    LeadID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    ContactInformation VARCHAR2(100) NOT NULL,
    Source VARCHAR2(100),
    InterestLevel VARCHAR2(15)
);


--Opportunity
CREATE TABLE Opportunity (
    OpportunityID NUMBER PRIMARY KEY,
    LeadID NUMBER NOT NULL,
    ExpectedRevenue NUMBER(15,2),
    Probability NUMBER,
    SalesStage VARCHAR2(15)
);


--Task
CREATE TABLE Task (
    TaskID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Description VARCHAR2(200) NOT NULL,
    ActionRequired VARCHAR2(200)
);


--Interaction
CREATE TABLE Interaction (
    InteractionID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    EmployeeID NUMBER NOT NULL,
    ChannelID NUMBER NOT NULL,
    TimeStamp TIMESTAMP NOT NULL,
    Type VARCHAR2(15),
    CONSTRAINT fk_interaction_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_interaction_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fk_interaction_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);


--Task Assignment
CREATE TABLE TaskAssignment (
    AssignmentID NUMBER PRIMARY KEY,
    TaskID NUMBER NOT NULL,
    EmployeeID NUMBER NOT NULL,
    ServiceRequestID NUMBER NOT NULL,
    AssignDate TIMESTAMP NOT NULL,
    DueDate TIMESTAMP NOT NULL,
    CONSTRAINT fk_taskassignment_task FOREIGN KEY (TaskID) REFERENCES Task(TaskID),
    CONSTRAINT fk_taskassignment_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fk_taskassignment_servicerequest FOREIGN KEY (ServiceRequestID) REFERENCES ServiceRequest(RequestID)
);


--Loan Application
CREATE TABLE LoanApplication (
    ApplicationID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    LoanID NUMBER NOT NULL,
    AmountRequested NUMBER(15,2) NOT NULL,
    SubmissionDate DATE NOT NULL,
    Status VARCHAR2(15),
    CONSTRAINT fk_loanapplication_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_loanapplication_loan FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);


--Product Subcription
CREATE TABLE ProductSubscription (
    SubscriptionID NUMBER PRIMARY KEY,
    ProductID NUMBER NOT NULL,
    CustomerID NUMBER NOT NULL,
    SubcriptionDate TIMESTAMP NOT NULL,
    CONSTRAINT fk_productsubscription_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT fk_productsubscription_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


--Survey Enrolment
CREATE TABLE SurveyEnrolment (
    EnrolmentID NUMBER PRIMARY KEY,
    SurveyID NUMBER NOT NULL,
    CustomerID NUMBER NOT NULL,
    Response VARCHAR2(200) NOT NULL,
    EnrolmentDate TIMESTAMP NOT NULL,
    CONSTRAINT fk_surveyenrolment_survey FOREIGN KEY (SurveyID) REFERENCES Survey(SurveyID),
    CONSTRAINT fk_surveyenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


--Campain Enrolement
CREATE TABLE CampaignEnrolment (
    EnrolmentID NUMBER PRIMARY KEY,
    CampaignID NUMBER NOT NULL,
    CustomerID NUMBER NOT NULL,
    LeadID NUMBER NOT NULL,
    enrolmentDate TIMESTAMP NOT NULL,
    CONSTRAINT fk_campaignenrolment_campaign FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID),
    CONSTRAINT fk_campaignenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_campaignenrolment_lead FOREIGN KEY (LeadID) REFERENCES Lead(LeadID)
);



CREATE TABLE RewardEnrolment (
    EnrolmentID NUMBER PRIMARY KEY,
    RewardProgram VARCHAR2(200) NOT NULL,
    CustomerID NUMBER NOT NULL,
    EnrolmentDate DATE NOT NULL,
    StartDate TIMESTAMP NOT NULL,
    EndDate TIMESTAMP NOT NULL,
    RewardProgramID Number not null,
    CONSTRAINT fk_rewardenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT fk_rewardenrolment_rewardProgram FOREIGN KEY (RewardProgramID) REFERENCES RewardProgram(RewardProgramID)
);


--Event Enrolment
CREATE TABLE EventEnrolment (
    EnrolmentID NUMBER PRIMARY KEY,
    EventID NUMBER NOT NULL,
    CustomerID NUMBER NOT NULL,
    EnrolmentDate TIMESTAMP NOT NULL,
    CONSTRAINT fk_eventenrolment_event FOREIGN KEY (EventID) REFERENCES Event(EventID),
    CONSTRAINT fk_eventenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);



--Notification Enrolment
CREATE TABLE NotificationSubcription (
    SubscriptionID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    NotificationID NUMBER NOT NULL,
    SubscriptionDate TIMESTAMP NOT NULL,
    ChannelID NUMBER NOT NULL,
    CONSTRAINT fk_notificationenrolment_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_notificationenrolment_notification FOREIGN KEY (NotificationID) REFERENCES Notification(NotificationID),
    CONSTRAINT fk_notificationenrolment_channel FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID)
);




