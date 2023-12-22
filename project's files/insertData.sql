INSERT INTO Branch (BranchID, Name, Address, Phone, Manager) VALUES (branch_seq.nextval, 'Victoria Island Branch', '14 Ajose Adeogun St, Victoria Island, Lagos', '0123456789', 'Kwame Nkrumah');
INSERT INTO Branch (BranchID, Name, Address, Phone, Manager) VALUES (branch_seq.nextval, 'Accra Main Branch', '45 Independence Ave, Accra', '0234567890', 'Nnamdi Azikiwe');
INSERT INTO Branch (BranchID, Name, Address, Phone, Manager) VALUES (branch_seq.nextval, 'Kumasi Branch', '9 Harper Road, Kumasi', '0234567891', 'Funmilayo Ransome-Kuti');
INSERT INTO Branch (BranchID, Name, Address, Phone, Manager) VALUES (branch_seq.nextval, 'Abuja Branch', '32 Aminu Kano Crescent, Wuse, Abuja', '0123456782', 'Yaa Asantewaa');
INSERT INTO Branch (BranchID, Name, Address, Phone, Manager) VALUES (branch_seq.nextval, 'Port Harcourt Branch', '22 Aggrey Road, Port Harcourt', '0123456783', 'Chinua Achebe');

INSERT INTO Customer (CustomerID, BranchID, Name, DateOfBirth, Gender, Address, Email, Phone, RiskProfile) VALUES (customer_seq.nextval, 101, 'Ama Serwaa', TO_DATE('1980-05-10', 'YYYY-MM-DD'), 'FEMALE', '123 Festac Rd, Lagos', 'aserwaa@example.com', '0123456789', 'Low');
INSERT INTO Customer (CustomerID, BranchID, Name, DateOfBirth, Gender, Address, Email, Phone, RiskProfile) VALUES (customer_seq.nextval, 102, 'Kofi Mensah', TO_DATE('1992-08-22', 'YYYY-MM-DD'), 'MALE', '456 Mango St, Accra', 'kmensah@example.com', '0123456790', 'Medium');
INSERT INTO Customer (CustomerID, BranchID, Name, DateOfBirth, Gender, Address, Email, Phone, RiskProfile) VALUES (customer_seq.nextval, 103, 'Chidinma Ekile', TO_DATE('1985-11-14', 'YYYY-MM-DD'), 'FEMALE', '789 Nima St, Kumasi', 'cekile@example.com', '0123456791', 'High');
INSERT INTO Customer (CustomerID, BranchID, Name, DateOfBirth, Gender, Address, Email, Phone, RiskProfile) VALUES (customer_seq.nextval, 104, 'Olumide Bakare', TO_DATE('1975-02-28', 'YYYY-MM-DD'), 'MALE', '123 Wuse Rd, Abuja', 'obakare@example.com', '0123456782', 'Low');
INSERT INTO Customer (CustomerID, BranchID, Name, DateOfBirth, Gender, Address, Email, Phone, RiskProfile) VALUES (customer_seq.nextval, 105, 'Efua Ofori', TO_DATE('1990-07-04', 'YYYY-MM-DD'), 'FEMALE', '456 Andoni Rd, Port Harcourt', 'eofori@example.com', '0123456783', 'Medium');

INSERT INTO Account (AccountID, CustomerID, AccountType, Balance, OpenDate, Status) VALUES (account_seq.nextval, 1001, 'Savings', 5000.00, TO_DATE('2021-01-01', 'YYYY-MM-DD'), 'Active');
INSERT INTO Account (AccountID, CustomerID, AccountType, Balance, OpenDate, Status) VALUES (account_seq.nextval, 1002, 'Current', 15000.00, TO_DATE('2021-06-15', 'YYYY-MM-DD'), 'Active');
INSERT INTO Account (AccountID, CustomerID, AccountType, Balance, OpenDate, Status) VALUES (account_seq.nextval, 1003, 'Savings', 20000.00, TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'Active');
INSERT INTO Account (AccountID, CustomerID, AccountType, Balance, OpenDate, Status) VALUES (account_seq.nextval, 1004, 'Current', 10000.00, TO_DATE('2021-08-05', 'YYYY-MM-DD'), 'Active');
INSERT INTO Account (AccountID, CustomerID, AccountType, Balance, OpenDate, Status) VALUES (account_seq.nextval, 1005, 'Savings', 3000.00, TO_DATE('2021-11-11', 'YYYY-MM-DD'), 'Active');


INSERT INTO Channel (ChannelID, ChannelName, Description) VALUES (1, 'Online', 'Online Banking Platform');
INSERT INTO Channel (ChannelID, ChannelName, Description) VALUES (2, 'Mobile', 'Mobile Banking App');
INSERT INTO Channel (ChannelID, ChannelName, Description) VALUES (3, 'In-Branch', 'Services provided within the bank branch');
INSERT INTO Channel (ChannelID, ChannelName, Description) VALUES (4, 'ATM', 'Automated Teller Machine');
INSERT INTO Channel (ChannelID, ChannelName, Description) VALUES (5, 'Call Center', 'Customer service via telephone');


INSERT INTO ServiceRequest (RequestID, ChannelID, CustomerID, RequestDate, Description, Status) VALUES (1, 1, 1001, SYSDATE, 'Request for account balance update', 'Open');
INSERT INTO ServiceRequest (RequestID, ChannelID, CustomerID, RequestDate, Description, Status) VALUES (2, 2, 1002, SYSDATE - 5, 'Inquiry about loan products', 'Closed');
INSERT INTO ServiceRequest (RequestID, ChannelID, CustomerID, RequestDate, Description, Status) VALUES (3, 3, 1003, SYSDATE - 10, 'Dispute transaction details', 'In Progress');
INSERT INTO ServiceRequest (RequestID, ChannelID, CustomerID, RequestDate, Description, Status) VALUES (4, 4, 1004, SYSDATE - 15, 'ATM card not working', 'Closed');
INSERT INTO ServiceRequest (RequestID, ChannelID, CustomerID, RequestDate, Description, Status) VALUES (5, 5, 1005, SYSDATE - 20, 'Update personal information', 'Open');


INSERT INTO Transaction (TransactionID, AccountID, ChannelID, Type, Description, TimeStamp) VALUES (1, 10001, 1, 'Deposit', 'Salary deposit', SYSTIMESTAMP - INTERVAL '30' DAY);
INSERT INTO Transaction (TransactionID, AccountID, ChannelID, Type, Description, TimeStamp) VALUES (2, 10002, 2, 'Withdrawal', 'ATM withdrawal', SYSTIMESTAMP - INTERVAL '25' DAY);
INSERT INTO Transaction (TransactionID, AccountID, ChannelID, Type, Description, TimeStamp) VALUES (3, 10003, 3, 'Transfer', 'Transfer to savings', SYSTIMESTAMP - INTERVAL '20' DAY);
INSERT INTO Transaction (TransactionID, AccountID, ChannelID, Type, Description, TimeStamp) VALUES (4, 10004, 4, 'Payment', 'Utility bill payment', SYSTIMESTAMP - INTERVAL '15' DAY);
INSERT INTO Transaction (TransactionID, AccountID, ChannelID, Type, Description, TimeStamp) VALUES (5, 10005, 5, 'Deposit', 'Check deposit', SYSTIMESTAMP - INTERVAL '10' DAY);

INSERT INTO SecurityProfile (ProfileID, AccessLevel, LastUpdated, Restrictions) VALUES (1, 'Admin', SYSTIMESTAMP, 'None');
INSERT INTO SecurityProfile (ProfileID, AccessLevel, LastUpdated, Restrictions) VALUES (2, 'Manager', SYSTIMESTAMP - INTERVAL '5' DAY, 'No Access to Audit Trails');
INSERT INTO SecurityProfile (ProfileID, AccessLevel, LastUpdated, Restrictions) VALUES (3, 'Analyst', SYSTIMESTAMP - INTERVAL '10' DAY, 'Read-Only Access');
INSERT INTO SecurityProfile (ProfileID, AccessLevel, LastUpdated, Restrictions) VALUES (4, 'Clerk', SYSTIMESTAMP - INTERVAL '15' DAY, 'No Access to Customer Personal Data');
INSERT INTO SecurityProfile (ProfileID, AccessLevel, LastUpdated, Restrictions) VALUES (5, 'Advisor', SYSTIMESTAMP - INTERVAL '20' DAY, 'No Access to Manage Users');


INSERT INTO Employee (EmployeeID, BranchID, SecurityProfileID, Name, Department, Role, Email, Phone) VALUES (employee_seq.nextval, 101, 1, 'Adeola Oluwa', 'Customer Service', 'Manager', 'adeola.oluwa@example.com', '0123000456');
INSERT INTO Employee (EmployeeID, BranchID, SecurityProfileID, Name, Department, Role, Email, Phone) VALUES (employee_seq.nextval, 102, 2, 'Yaw Dankwa', 'Loan Officer', 'Supervisor', 'yaw.dankwa@example.com', '0123000457');
INSERT INTO Employee (EmployeeID, BranchID, SecurityProfileID, Name, Department, Role, Email, Phone) VALUES (employee_seq.nextval, 103, 3, 'Chibuzor Nwankwo', 'Risk Assessment', 'Analyst', 'chibuzor.nwankwo@example.com', '0123000458');
INSERT INTO Employee (EmployeeID, BranchID, SecurityProfileID, Name, Department, Role, Email, Phone) VALUES (employee_seq.nextval, 104, 4, 'Fatima Buhari', 'Customer Service', 'Representative', 'fatima.buhari@example.com', '0123000459');
INSERT INTO Employee (EmployeeID, BranchID, SecurityProfileID, Name, Department, Role, Email, Phone) VALUES (employee_seq.nextval, 105, 5, 'Kojo Mensah', 'Investments', 'Advisor', 'kojo.mensah@example.com', '0123000460');


INSERT INTO Loan (LoanID, Type, MaximumAmount, InterestRate) VALUES (1, 'Personal', 50000, 5.5);
INSERT INTO Loan (LoanID, Type, MaximumAmount, InterestRate) VALUES (2, 'Mortgage', 200000, 4.3);
INSERT INTO Loan (LoanID, Type, MaximumAmount, InterestRate) VALUES (3, 'Auto', 30000, 3.9);
INSERT INTO Loan (LoanID, Type, MaximumAmount, InterestRate) VALUES (4, 'Education', 20000, 4.5);
INSERT INTO Loan (LoanID, Type, MaximumAmount, InterestRate) VALUES (5, 'Business', 150000, 6.0);



INSERT INTO Product (ProductID, Name, Description, EligibilityCriteria, Type) VALUES (1, 'Savings Account', 'A regular savings account.', 'Minimum balance of 1000 NGN', 'Savings');
INSERT INTO Product (ProductID, Name, Description, EligibilityCriteria, Type) VALUES (2, 'Current Account', 'A current account for daily transactions.', 'Proof of income', 'Current');
INSERT INTO Product (ProductID, Name, Description, EligibilityCriteria, Type) VALUES (3, 'Fixed Deposit', 'Fixed deposit account with higher interest rate.', 'Minimum deposit of 50000 NGN', 'Deposit');
INSERT INTO Product (ProductID, Name, Description, EligibilityCriteria, Type) VALUES (4, 'Student Account', 'A zero-fee account for students.', 'Must be a registered student', 'Savings');
INSERT INTO Product (ProductID, Name, Description, EligibilityCriteria, Type) VALUES (5, 'Retirement Account', 'A retirement savings account.', 'Must be above 50 years old', 'Savings');

INSERT INTO UserTable (UserID, Username, Password, Role, AccountStatus) VALUES (1, 'user1', 'password1', 'Admin', 'Active');
INSERT INTO UserTable (UserID, Username, Password, Role, AccountStatus) VALUES (2, 'user2', 'password2', 'Manager', 'Active');
INSERT INTO UserTable (UserID, Username, Password, Role, AccountStatus) VALUES (3, 'user3', 'password3', 'Clerk', 'Inactive');
INSERT INTO UserTable (UserID, Username, Password, Role, AccountStatus) VALUES (4, 'user4', 'password4', 'Analyst', 'Active');
INSERT INTO UserTable (UserID, Username, Password, Role, AccountStatus) VALUES (5, 'user5', 'password5', 'Advisor', 'Active');


INSERT INTO AuditTrail (AuditID, UserID, TransactionID, AffectedEntity, ActionType, TimeStamp) VALUES (audittrail_seq.nextval, 1, 1, 'Account', 'Create', SYSTIMESTAMP - INTERVAL '1' DAY);
INSERT INTO AuditTrail (AuditID, UserID, TransactionID, AffectedEntity, ActionType, TimeStamp) VALUES (audittrail_seq.nextval, 2, 2, 'Transaction', 'Update', SYSTIMESTAMP - INTERVAL '2' DAY);
INSERT INTO AuditTrail (AuditID, UserID, TransactionID, AffectedEntity, ActionType, TimeStamp) VALUES (audittrail_seq.nextval, 3, 3, 'Loan', 'Delete', SYSTIMESTAMP - INTERVAL '3' DAY);
INSERT INTO AuditTrail (AuditID, UserID, TransactionID, AffectedEntity, ActionType, TimeStamp) VALUES (audittrail_seq.nextval, 4, 4, 'Customer', 'Update', SYSTIMESTAMP - INTERVAL '4' DAY);
INSERT INTO AuditTrail (AuditID, UserID, TransactionID, AffectedEntity, ActionType, TimeStamp) VALUES (audittrail_seq.nextval, 5, 5, 'Employee', 'Create', SYSTIMESTAMP - INTERVAL '5' DAY);


INSERT INTO ProductSubscription (SubscriptionID, ProductID, CustomerID, SubcriptionDate) VALUES (1, 1, 1001, SYSTIMESTAMP - INTERVAL '10' DAY);
INSERT INTO ProductSubscription (SubscriptionID, ProductID, CustomerID, SubcriptionDate) VALUES (2, 2, 1002, SYSTIMESTAMP - INTERVAL '20' DAY);
INSERT INTO ProductSubscription (SubscriptionID, ProductID, CustomerID, SubcriptionDate) VALUES (3, 3, 1003, SYSTIMESTAMP - INTERVAL '30' DAY);
INSERT INTO ProductSubscription (SubscriptionID, ProductID, CustomerID, SubcriptionDate) VALUES (4, 4, 1004, SYSTIMESTAMP - INTERVAL '40' DAY);
INSERT INTO ProductSubscription (SubscriptionID, ProductID, CustomerID, SubcriptionDate) VALUES (5, 5, 1005, SYSTIMESTAMP - INTERVAL '50' DAY);


INSERT INTO LoanApplication (ApplicationID, CustomerID, LoanID, AmountRequested, SubmissionDate, Status) VALUES (1, 1001, 1, 25000, SYSDATE - 10, 'Pending');
INSERT INTO LoanApplication (ApplicationID, CustomerID, LoanID, AmountRequested, SubmissionDate, Status) VALUES (2, 1002, 2, 120000, SYSDATE - 20, 'Approved');
INSERT INTO LoanApplication (ApplicationID, CustomerID, LoanID, AmountRequested, SubmissionDate, Status) VALUES (3, 1003, 3, 5000, SYSDATE - 30, 'Denied');
INSERT INTO LoanApplication (ApplicationID, CustomerID, LoanID, AmountRequested, SubmissionDate, Status) VALUES (4, 1004, 4, 15000, SYSDATE - 40, 'Pending');
INSERT INTO LoanApplication (ApplicationID, CustomerID, LoanID, AmountRequested, SubmissionDate, Status) VALUES (5, 1005, 5, 75000, SYSDATE - 50, 'Approved');


INSERT INTO Campaign (CampaignID, Name, Description, Type, StartDate, EndDate) VALUES (1, 'Savings Booster', 'Increase your savings with our new interest rates.', 'Email', SYSDATE - 60, SYSDATE - 30);
INSERT INTO Campaign (CampaignID, Name, Description, Type, StartDate, EndDate) VALUES (2, 'Home Loans', 'Affordable home loans for you.', 'Social Media', SYSDATE - 50, SYSDATE - 20);
INSERT INTO Campaign (CampaignID, Name, Description, Type, StartDate, EndDate) VALUES (3, 'Student Package', 'Special banking services for students.', 'Online Ads', SYSDATE - 40, SYSDATE - 10);
INSERT INTO Campaign (CampaignID, Name, Description, Type, StartDate, EndDate) VALUES (4, 'Retirement Planning', 'Plan your retirement with our investment package.', 'In-Branch', SYSDATE - 30, SYSDATE);
INSERT INTO Campaign (CampaignID, Name, Description, Type, StartDate, EndDate) VALUES (5, 'Auto Loans', 'Get behind the wheel faster with our auto loans.', 'TV', SYSDATE - 20, SYSDATE + 10);


INSERT INTO RewardProgram (RewardProgramID, Type, Description, Reward) VALUES (1, 'Platinum', 'Platinum tier rewards for our top customers.', 'Bonus Points');
INSERT INTO RewardProgram (RewardProgramID, Type, Description, Reward) VALUES (2, 'Gold', 'Gold tier rewards with great benefits.', 'Discounts');
INSERT INTO RewardProgram (RewardProgramID, Type, Description, Reward) VALUES (3, 'Silver', 'Silver tier rewards for our valued customers.', 'Cashback');
INSERT INTO RewardProgram (RewardProgramID, Type, Description, Reward) VALUES (4, 'Bronze', 'Bronze tier rewards for regular customers.', 'Gifts');
INSERT INTO RewardProgram (RewardProgramID, Type, Description, Reward) VALUES (5, 'New Member', 'Rewards for our new customers.', 'Welcome Package');


INSERT INTO Event (EventID, Name, Type, Description, StartDate, EndDate) VALUES (1, 'Financial Literacy Workshop', 'Workshop', 'Workshop on managing personal finances effectively.', SYSDATE - 20, SYSDATE - 19);
INSERT INTO Event (EventID, Name, Type, Description, StartDate, EndDate) VALUES (2, 'Home Buyers Expo', 'Expo', 'An expo for prospective home buyers with information on loans and mortgages.', SYSDATE - 10, SYSDATE - 9);
INSERT INTO Event (EventID, Name, Type, Description, StartDate, EndDate) VALUES (3, 'Annual General Meeting', 'Meeting', 'Yearly meeting with shareholders to discuss the annual report.', SYSDATE - 30, SYSDATE - 29);
INSERT INTO Event (EventID, Name, Type, Description, StartDate, EndDate) VALUES (4, 'Community Support Day', 'CSR', 'A day for the bank staff to give back to the community.', SYSDATE + 5, SYSDATE + 5);
INSERT INTO Event (EventID, Name, Type, Description, StartDate, EndDate) VALUES (5, 'Investment Seminar', 'Seminar', 'A seminar on investment opportunities and strategies.', SYSDATE + 10, SYSDATE + 11);


INSERT INTO Notification (NotificationID, Type, NotificationText, ChannelID) VALUES (1, 'Alert', 'Your account statement is ready for viewing.', 1);
INSERT INTO Notification (NotificationID, Type, NotificationText, ChannelID) VALUES (2, 'Reminder', 'Your loan payment is due in 5 days.', 2);
INSERT INTO Notification (NotificationID, Type, NotificationText, ChannelID) VALUES (3, 'Update', 'Our mobile app has a new feature for easier transfers.', 2);
INSERT INTO Notification (NotificationID, Type, NotificationText, ChannelID) VALUES (4, 'Promo', 'New lower mortgage rates available now!', 3);
INSERT INTO Notification (NotificationID, Type, NotificationText, ChannelID) VALUES (5, 'Alert', 'A new login to your online banking was detected.', 1);


INSERT INTO Document (DocumentID, CustomerID, Type, IssueDate, ExpiryDate) VALUES ('DOC001', 1001, 'ID Card', SYSDATE - 365, SYSDATE + (365 * 5));
INSERT INTO Document (DocumentID, CustomerID, Type, IssueDate, ExpiryDate) VALUES ('DOC002', 1002, 'Passport', SYSDATE - (365 * 2), SYSDATE + (365 * 8));
INSERT INTO Document (DocumentID, CustomerID, Type, IssueDate, ExpiryDate) VALUES ('DOC003', 1003, 'Utility Bill', SYSDATE - 30, SYSDATE + 30);
INSERT INTO Document (DocumentID, CustomerID, Type, IssueDate, ExpiryDate) VALUES ('DOC004', 1004, 'Bank Statement', SYSDATE - 60, SYSDATE + (365 * 1));
INSERT INTO Document (DocumentID, CustomerID, Type, IssueDate, ExpiryDate) VALUES ('DOC005', 1005, 'ID Card', SYSDATE - 200, SYSDATE + (365 * 5));

INSERT INTO RegulatoryCompliance (ComplianceID, Name, ReviewDate, Note, Status) VALUES (1, 'Anti-Money Laundering', SYSDATE - 180, 'Annual AML review completed', 'Compliant');
INSERT INTO RegulatoryCompliance (ComplianceID, Name, ReviewDate, Note, Status) VALUES (2, 'Data Protection', SYSDATE - 90, 'Data protection training conducted', 'Compliant');
INSERT INTO RegulatoryCompliance (ComplianceID, Name, ReviewDate, Note, Status) VALUES (3, 'Customer Onboarding', SYSDATE - 30, 'Review of new customer onboarding processes', 'Pending');
INSERT INTO RegulatoryCompliance (ComplianceID, Name, ReviewDate, Note, Status) VALUES (4, 'Credit Risk Assessment', SYSDATE - 60, 'Updated credit risk assessment model', 'Compliant');
INSERT INTO RegulatoryCompliance (ComplianceID, Name, ReviewDate, Note, Status) VALUES (5, 'Operational Risk', SYSDATE - 120, 'Operational risk management framework update', 'Non-Compliant');

INSERT INTO InvestmentPortfolio (PortfolioID, CustomerID, AssetType, Quantity, PurchaseDate, Value) VALUES (1, 1001, 'Stocks', 100, SYSDATE - 365, 5000);
INSERT INTO InvestmentPortfolio (PortfolioID, CustomerID, AssetType, Quantity, PurchaseDate, Value) VALUES (2, 1002, 'Bonds', 200, SYSDATE - 200, 2000);
INSERT INTO InvestmentPortfolio (PortfolioID, CustomerID, AssetType, Quantity, PurchaseDate, Value) VALUES (3, 1003, 'Mutual Funds', 150, SYSDATE - 100, 3000);
INSERT INTO InvestmentPortfolio (PortfolioID, CustomerID, AssetType, Quantity, PurchaseDate, Value) VALUES (4, 1004, 'Stocks', 50, SYSDATE - 400, 10000);
INSERT INTO InvestmentPortfolio (PortfolioID, CustomerID, AssetType, Quantity, PurchaseDate, Value) VALUES (5, 1005, 'Real Estate', 2, SYSDATE - 500, 15000);

INSERT INTO ATM (ATMID, BranchID, Location, ServiceStatus) VALUES (1, 101, 'Victoria Island Mall', 'Active');
INSERT INTO ATM (ATMID, BranchID, Location, ServiceStatus) VALUES (2, 102, 'Accra Shopping Center', 'Active');
INSERT INTO ATM (ATMID, BranchID, Location, ServiceStatus) VALUES (3, 103, 'Kumasi Market Square', 'Inactive');
INSERT INTO ATM (ATMID, BranchID, Location, ServiceStatus) VALUES (4, 104, 'Abuja Central Plaza', 'Active');
INSERT INTO ATM (ATMID, BranchID, Location, ServiceStatus) VALUES (5, 105, 'Port Harcourt City Mall', 'Active');


INSERT INTO Lead (LeadID, Name, ContactInformation, Source, InterestLevel) VALUES (1, 'Emeka Okafor', 'emeka.okafor@example.com', 'Online Form', 'High');
INSERT INTO Lead (LeadID, Name, ContactInformation, Source, InterestLevel) VALUES (2, 'Aisha Bello', 'aisha.bello@example.com', 'Referral', 'Medium');
INSERT INTO Lead (LeadID, Name, ContactInformation, Source, InterestLevel) VALUES (3, 'Kwesi Arhin', 'kwesi.arhin@example.com', 'Event', 'Low');
INSERT INTO Lead (LeadID, Name, ContactInformation, Source, InterestLevel) VALUES (4, 'Amara Chukwu', 'amara.chukwu@example.com', 'Social Media', 'High');
INSERT INTO Lead (LeadID, Name, ContactInformation, Source, InterestLevel) VALUES (5, 'Yaw Adomako', 'yaw.adomako@example.com', 'Email Campaign', 'Medium');

INSERT INTO Opportunity (OpportunityID, LeadID, ExpectedRevenue, Probability, SalesStage) VALUES (1, 1, 10000, 0.8, 'Negotiation');
INSERT INTO Opportunity (OpportunityID, LeadID, ExpectedRevenue, Probability, SalesStage) VALUES (2, 2, 5000, 0.6, 'Proposal');
INSERT INTO Opportunity (OpportunityID, LeadID, ExpectedRevenue, Probability, SalesStage) VALUES (3, 3, 3000, 0.4, 'Qualification');
INSERT INTO Opportunity (OpportunityID, LeadID, ExpectedRevenue, Probability, SalesStage) VALUES (4, 4, 20000, 0.9, 'Closing');
INSERT INTO Opportunity (OpportunityID, LeadID, ExpectedRevenue, Probability, SalesStage) VALUES (5, 5, 7500, 0.5, 'Needs Analysis');

INSERT INTO Task (TaskID, Name, Description, ActionRequired) VALUES (1, 'Follow-up Call', 'Call lead Emeka to discuss mortgage products.', 'Call Emeka Okafor by end of week');
INSERT INTO Task (TaskID, Name, Description, ActionRequired) VALUES (2, 'Loan Application', 'Complete loan application for Aisha.', 'Gather necessary documents from Aisha Bello');
INSERT INTO Task (TaskID, Name, Description, ActionRequired) VALUES (3, 'Product Demo', 'Schedule a demo of the online banking app for Kwesi.', 'Set up a Zoom meeting with Kwesi Arhin');
INSERT INTO Task (TaskID, Name, Description, ActionRequired) VALUES (4, 'Send Proposal', 'Draft and send investment proposal to Amara.', 'Email proposal to Amara Chukwu');
INSERT INTO Task (TaskID, Name, Description, ActionRequired) VALUES (5, 'Campaign Feedback', 'Collect feedback on the latest email campaign.', 'Call Yaw Adomako for detailed feedback');

INSERT INTO Interaction (InteractionID, CustomerID, EmployeeID, ChannelID, TimeStamp, Type) VALUES (1, 1001, 10001, 1, SYSTIMESTAMP - INTERVAL '10' DAY, 'Inquiry');
INSERT INTO Interaction (InteractionID, CustomerID, EmployeeID, ChannelID, TimeStamp, Type) VALUES (2, 1002, 10002, 2, SYSTIMESTAMP - INTERVAL '8' DAY, 'Support');
INSERT INTO Interaction (InteractionID, CustomerID, EmployeeID, ChannelID, TimeStamp, Type) VALUES (3, 1003, 10003, 3, SYSTIMESTAMP - INTERVAL '15' DAY, 'Complaint');
INSERT INTO Interaction (InteractionID, CustomerID, EmployeeID, ChannelID, TimeStamp, Type) VALUES (4, 1004, 10004, 4, SYSTIMESTAMP - INTERVAL '20' DAY, 'Inquiry');
INSERT INTO Interaction (InteractionID, CustomerID, EmployeeID, ChannelID, TimeStamp, Type) VALUES (5, 1005, 10005, 5, SYSTIMESTAMP - INTERVAL '2' DAY, 'Feedback');

INSERT INTO TaskAssignment (AssignmentID, TaskID, EmployeeID, ServiceRequestID, AssignDate, DueDate) VALUES (1, 1, 10001, 1, SYSDATE - 10, SYSDATE - 5);
INSERT INTO TaskAssignment (AssignmentID, TaskID, EmployeeID, ServiceRequestID, AssignDate, DueDate) VALUES (2, 2, 10002, 2, SYSDATE - 20, SYSDATE - 15);
INSERT INTO TaskAssignment (AssignmentID, TaskID, EmployeeID, ServiceRequestID, AssignDate, DueDate) VALUES (3, 3, 10003, 3, SYSDATE - 30, SYSDATE - 25);
INSERT INTO TaskAssignment (AssignmentID, TaskID, EmployeeID, ServiceRequestID, AssignDate, DueDate) VALUES (4, 4, 10004, 4, SYSDATE - 40, SYSDATE - 35);
INSERT INTO TaskAssignment (AssignmentID, TaskID, EmployeeID, ServiceRequestID, AssignDate, DueDate) VALUES (5, 5, 10005, 5, SYSDATE - 50, SYSDATE - 45);

INSERT INTO NotificationSubcription (SubscriptionID, CustomerID, NotificationID, SubscriptionDate, ChannelID) VALUES (1, 1001, 1, SYSDATE - 60, 1);
INSERT INTO NotificationSubcription (SubscriptionID, CustomerID, NotificationID, SubscriptionDate, ChannelID) VALUES (2, 1002, 2, SYSDATE - 50, 2);
INSERT INTO NotificationSubcription (SubscriptionID, CustomerID, NotificationID, SubscriptionDate, ChannelID) VALUES (3, 1003, 3, SYSDATE - 40, 3);
INSERT INTO NotificationSubcription (SubscriptionID, CustomerID, NotificationID, SubscriptionDate, ChannelID) VALUES (4, 1004, 4, SYSDATE - 30, 4);
INSERT INTO NotificationSubcription (SubscriptionID, CustomerID, NotificationID, SubscriptionDate, ChannelID) VALUES (5, 1005, 5, SYSDATE - 20, 5);

INSERT INTO Survey (SurveyID, Type, Description, Question) VALUES (1, 'Customer Satisfaction', 'Annual customer satisfaction survey', 'How satisfied are you with our banking services?');
INSERT INTO Survey (SurveyID, Type, Description, Question) VALUES (2, 'Product Feedback', 'Feedback survey on the new mobile app', 'How would you rate our new mobile banking app?');
INSERT INTO Survey (SurveyID, Type, Description, Question) VALUES (3, 'Service Quality', 'Survey on the quality of customer service', 'How would you rate the quality of service provided by our staff?');
INSERT INTO Survey (SurveyID, Type, Description, Question) VALUES (4, 'Feature Request', 'Survey for requesting new features', 'What features would you like to see in our online banking platform?');
INSERT INTO Survey (SurveyID, Type, Description, Question) VALUES (5, 'Branch Experience', 'Survey on branch experience', 'How was your recent experience at our local branch?');

INSERT INTO CampaignEnrolment (EnrolmentID, CampaignID, CustomerID, LeadID, EnrolmentDate) VALUES (1, 1, 1001, 1, SYSDATE - 30);
INSERT INTO CampaignEnrolment (EnrolmentID, CampaignID, CustomerID, LeadID, EnrolmentDate) VALUES (2, 2, 1002, 2, SYSDATE - 25);
INSERT INTO CampaignEnrolment (EnrolmentID, CampaignID, CustomerID, LeadID, EnrolmentDate) VALUES (3, 3, 1003, 3, SYSDATE - 20);
INSERT INTO CampaignEnrolment (EnrolmentID, CampaignID, CustomerID, LeadID, EnrolmentDate) VALUES (4, 4, 1004, 4, SYSDATE - 15);
INSERT INTO CampaignEnrolment (EnrolmentID, CampaignID, CustomerID, LeadID, EnrolmentDate) VALUES (5, 5, 1005, 5, SYSDATE - 10);


INSERT INTO RewardEnrolment (EnrolmentID, RewardProgram, CustomerID, EnrolmentDate, StartDate, EndDate, RewardProgramID) VALUES (1, 'Platinum Membership', 1001, SYSDATE - 100, SYSDATE - 100, SYSDATE + 365, 1);
INSERT INTO RewardEnrolment (EnrolmentID, RewardProgram, CustomerID, EnrolmentDate, StartDate, EndDate, RewardProgramID) VALUES (2, 'Gold Membership', 1002, SYSDATE - 200, SYSDATE - 200, SYSDATE + 365, 2);
INSERT INTO RewardEnrolment (EnrolmentID, RewardProgram, CustomerID, EnrolmentDate, StartDate, EndDate, RewardProgramID) VALUES (3, 'Silver Membership', 1003, SYSDATE - 300, SYSDATE - 300, SYSDATE + 365, 3);
INSERT INTO RewardEnrolment (EnrolmentID, RewardProgram, CustomerID, EnrolmentDate, StartDate, EndDate, RewardProgramID) VALUES (4, 'Bronze Membership', 1004, SYSDATE - 400, SYSDATE - 400, SYSDATE + 365, 4);
INSERT INTO RewardEnrolment (EnrolmentID, RewardProgram, CustomerID, EnrolmentDate, StartDate, EndDate, RewardProgramID) VALUES (5, 'New Member Offer', 1005, SYSDATE - 500, SYSDATE - 500, SYSDATE + 365, 5);


INSERT INTO EventEnrolment (EnrolmentID, EventID, CustomerID, EnrolmentDate) VALUES (1, 1, 1001, SYSDATE - 20);
INSERT INTO EventEnrolment (EnrolmentID, EventID, CustomerID, EnrolmentDate) VALUES (2, 2, 1002, SYSDATE - 15);
INSERT INTO EventEnrolment (EnrolmentID, EventID, CustomerID, EnrolmentDate) VALUES (3, 3, 1003, SYSDATE - 10);
INSERT INTO EventEnrolment (EnrolmentID, EventID, CustomerID, EnrolmentDate) VALUES (4, 4, 1004, SYSDATE - 5);
INSERT INTO EventEnrolment (EnrolmentID, EventID, CustomerID, EnrolmentDate) VALUES (5, 5, 1005, SYSDATE);



INSERT INTO SurveyEnrolment (EnrolmentID, SurveyID, CustomerID, Response, EnrolmentDate) VALUES (1, 1, 1001, 'Very Satisfied', SYSDATE - 10);
INSERT INTO SurveyEnrolment (EnrolmentID, SurveyID, CustomerID, Response, EnrolmentDate) VALUES (2, 2, 1002, 'Satisfied', SYSDATE - 20);
INSERT INTO SurveyEnrolment (EnrolmentID, SurveyID, CustomerID, Response, EnrolmentDate) VALUES (3, 3, 1003, 'Neutral', SYSDATE - 30);
INSERT INTO SurveyEnrolment (EnrolmentID, SurveyID, CustomerID, Response, EnrolmentDate) VALUES (4, 4, 1004, 'Dissatisfied', SYSDATE - 40);
INSERT INTO SurveyEnrolment (EnrolmentID, SurveyID, CustomerID, Response, EnrolmentDate) VALUES (5, 5, 1005, 'Very Dissatisfied', SYSDATE - 50);