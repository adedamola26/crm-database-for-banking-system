--SurveyEnrolment Table:
-- Update
UPDATE SurveyEnrolment SET Response = 'Moderately Satisfied' WHERE EnrolmentID = 1;

-- Delete
DELETE FROM SurveyEnrolment WHERE EnrolmentID = 5;

--TaskAssignment Table:
-- Update
UPDATE TaskAssignment SET DueDate = SYSDATE - 3 WHERE AssignmentID = 1;

-- Delete
DELETE FROM TaskAssignment WHERE AssignmentID = 5;

--Opportunity Table:
-- Update
UPDATE Opportunity SET ExpectedRevenue = 15000 WHERE OpportunityID = 1;

-- Delete
DELETE FROM Opportunity WHERE OpportunityID = 5;

--InvestmentPortfolio Table:
-- Update
UPDATE InvestmentPortfolio SET Quantity = 120 WHERE PortfolioID = 1;

-- Delete
DELETE FROM InvestmentPortfolio WHERE PortfolioID = 5;

--RegulatoryCompliance Table:
-- Update
UPDATE RegulatoryCompliance SET Note = 'Completed AML review.' WHERE ComplianceID = 1;

-- Delete
DELETE FROM RegulatoryCompliance WHERE ComplianceID = 5;