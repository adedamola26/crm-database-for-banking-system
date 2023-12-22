--CUSTOMER TABLE
-- Check gender values
ALTER TABLE Customer
ADD CONSTRAINT gender_ck CHECK (UPPER(Gender) IN ('MALE', 'FEMALE', 'OTHER'));

-- Ensure unique email address
ALTER TABLE Customer
ADD CONSTRAINT email_unique UNIQUE(Email);

-- Check email format
ALTER TABLE Customer
ADD CONSTRAINT email_format_check 
CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));


-- Check positive AnnualIncome
ALTER TABLE Customer
ADD CONSTRAINT income_ck CHECK (AnnualIncome >= 0 OR AnnualIncome IS NULL);


--Loan Table Constraints
-- Check positive MaximumAmount
ALTER TABLE Loan
ADD CONSTRAINT amount_ck CHECK (MaximumAmount > 0);

-- Check InterestRate between 0% and 100%
ALTER TABLE Loan
ADD CONSTRAINT interestrate_ck CHECK (InterestRate >= 0 AND InterestRate <= 100);


--Service Request Table Constraints
-- Check Status values
ALTER TABLE ServiceRequest
ADD CONSTRAINT status_ck CHECK (UPPER(Status) IN ('OPEN', 'IN PROGRESS', 'CLOSED'));



--Employee Table Constraints
-- Check valid email format for Employee
ALTER TABLE Employee
ADD CONSTRAINT emp_email_format_check 
CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));




--Investment Portfolio Table Constraints
-- Check positive Quantity
ALTER TABLE InvestmentPortfolio
ADD CONSTRAINT quantity_ck CHECK (Quantity >= 0);




--Document Table Constraints
-- Ensure ExpiryDate is after IssueDate
ALTER TABLE Document
ADD CONSTRAINT expirydate_after_issue CHECK (ExpiryDate > IssueDate);


--Account Table Constraints
-- Ensure CloseDate is after OpenDate or NULL
ALTER TABLE Account
ADD CONSTRAINT closedate_after_open CHECK (CloseDate > OpenDate OR CloseDate IS NULL);

-- Check positive Balance
ALTER TABLE Account
ADD CONSTRAINT balance_ck CHECK (Balance >= 0);



alter table customer
modify gender varchar2(6);