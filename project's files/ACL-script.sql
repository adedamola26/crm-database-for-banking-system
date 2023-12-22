-- Create the customer_service role
CREATE ROLE customer_service;

-- Grant SELECT and UPDATE privileges on Customer table
GRANT SELECT, UPDATE ON Customer TO customer_service;

-- Grant SELECT and UPDATE privileges on Account table
GRANT SELECT, UPDATE ON Account TO customer_service;

-- Create the marketing role
CREATE ROLE marketing;

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on Survey table
GRANT SELECT, INSERT, UPDATE, DELETE ON Survey TO marketing;

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on Campaign table
GRANT SELECT, INSERT, UPDATE, DELETE ON Campaign TO marketing;

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on RewardProgram table
GRANT SELECT, INSERT, UPDATE, DELETE ON RewardProgram TO marketing;

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on Events table
GRANT SELECT, INSERT, UPDATE, DELETE ON Event TO marketing;
