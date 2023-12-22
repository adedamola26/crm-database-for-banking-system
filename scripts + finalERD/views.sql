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
WHERE t.TimeStamp > SYSDATE - 30; -- Adjust the number of days as needed


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
WHERE la.Status = 'Pending'; -- or any other status you wish to filter by


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


