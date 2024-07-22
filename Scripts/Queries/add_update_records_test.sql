USE financial_portfolio;
-- Add a new record into quarter for the first quarter of year 2024,
-- and add a new record into financial_statement for AMD for the new 2024 quarter 
CALL add_new_quarter(3, 1, 2, 1, 2024, TRUE);

-- Insert value records for each component for the income statement, balance sheet, and cash flow statement of AMD's new financial statement
INSERT INTO component_value (value_id, val, denom_id, component_id) VALUES
(43, 5.36, 1, 1),
(44, 2.68, 1, 2),
(45, 27.00, 2, 3),
(46, 0.50, NULL, 4),
(47, 0.58, NULL, 5),
(48, 829.00, 2, 6),
(49, -575.00, 4, 7),
(50, 6.29, 1, 8), 
(51, 67.97, 1, 9), 
(52, 12.83, 1, 10),
(53, 55.14, 1, 11),
(54, 1.62, 1, 12),
(55, 3.63, NULL, 13),
(56, -0.07, 4, 14),
(57, -0.09, 4, 15),
(58, 27.00, 2, 16),
(59, 379.00, 2, 17),
(60, -438.00, 2, 18),
(61, 75.00, 2, 19), 
(62, 16.00, 2, 20),
(63, 807.00, 2, 21);

-- attribute the records just added to AMD's new financial statement fs_id = 3
-- and update the most_recent_qtr status for the newest entries to true
CALL update_value_entries(3, 42);

-- set the most_recent_qtr status for AMD's previous quarter to false
UPDATE quarter
SET most_recent = FALSE
WHERE qtr_id = 1;

-- view each financial statement, include company name, quarter, year, statement, component, component value, denomination, 
-- and recent quarter status. Order the result by company, quarter, and statement
SELECT financial_statement.fs_id, company_info.comp_ticker, quarter.qtr, quarter.year, statement.statement_name, 
	financial_component.component_name, component_value.val, denomination.denom, quarter.most_recent
FROM financial_statement 
LEFT JOIN company_info ON financial_statement.comp_id = company_info.comp_id
LEFT JOIN quarter ON financial_statement.qtr_id = quarter.qtr_id
LEFT JOIN component_value ON component_value.fs_id = financial_statement.fs_id
LEFT JOIN denomination ON component_value.denom_id = denomination.denom_id
LEFT JOIN financial_component ON financial_component.component_id = component_value.component_id
LEFT JOIN statement ON statement.statement_id = financial_component.statement_id
ORDER BY company_info.comp_ticker, quarter.qtr, statement.statement_name; 