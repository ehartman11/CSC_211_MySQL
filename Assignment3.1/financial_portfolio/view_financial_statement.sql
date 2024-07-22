USE amd_portfolio;

SELECT financial_statement.fs_id, quarter.qtr, quarter.year,  statement.statement_name, financial_component.component_name, component_value.val
FROM financial_statement 
LEFT JOIN quarter ON financial_statement.qtr_id = quarter.qtr_id
LEFT JOIN component_value ON component_value.fs_id = financial_statement.fs_id
LEFT JOIN financial_component ON component_value.component_id = financial_component.component_id
LEFT JOIN statement ON financial_component.statement_id = statement.statement_id;