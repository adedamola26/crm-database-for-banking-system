--Customer Table
--Index on BranchID: Useful if you often query customers based on their branch.
CREATE INDEX idx_customer_branchid ON Customer (BranchID);

--Account Table
--Index on CustomerID: Helpful for quickly finding all accounts associated 
--with a customer.
CREATE INDEX idx_account_customerid ON Account (CustomerID);

--Transaction Table
--Index on AccountID: Useful for finding transactions for a specific account.
CREATE INDEX idx_transaction_accountid ON Transaction (AccountID);
--Index on TimeStamp: If you frequently query recent transactions.
CREATE INDEX idx_transaction_timestamp ON Transaction (TimeStamp);


--Employee Table
--Index on BranchID: If you often retrieve employees based on their branch.
CREATE INDEX idx_employee_branchid ON Employee (BranchID);


--Service Request Table
--Index on CustomerID: Useful for accessing all service requests made by a 
--specific customer.
CREATE INDEX idx_servicerequest_customerid ON ServiceRequest (CustomerID);
--Index on Status: If you frequently filter service requests by their status.
CREATE INDEX idx_servicerequest_status ON ServiceRequest (Status);


--Loan Application Table
--Index on CustomerID: Helps in quickly accessing loan applications made by a 
--customer.
CREATE INDEX idx_loanapplication_customerid ON LoanApplication (CustomerID);
--Index on Status: If you often query loan applications based on their status.
CREATE INDEX idx_loanapplication_status ON LoanApplication (Status);


--Audit Trail Table
--Index on TimeStamp: If you regularly query recent audit records.
CREATE INDEX idx_audittrail_timestamp ON AuditTrail (TimeStamp);
