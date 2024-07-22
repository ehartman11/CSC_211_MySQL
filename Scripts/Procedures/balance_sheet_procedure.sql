CREATE DEFINER=`root`@`localhost` PROCEDURE `view_balance_sheet`()
BEGIN
	-- Create a view of Nvidia's balance sheet from the given financial statement
	DROP VIEW IF EXISTS balance_sheet;
    
	CREATE VIEW balance_sheet as
	SELECT company_info.comp_ticker, financial_statement.fs_id, statement.statement_name, 
		financial_component.component_name, component_value.val, denomination.denom
	FROM company_info 
	LEFT JOIN financial_statement ON financial_statement.comp_id = company_info.comp_id
	LEFT JOIN component_value ON component_value.fs_id = financial_statement.fs_id
    LEFT JOIN financial_component ON financial_component.component_id = component_value.component_id
    LEFT JOIN statement ON statement.statement_id = financial_component.statement_id
    LEFT JOIN denomination ON denomination.denom_id = component_value.denom_id
	WHERE (statement.statement_name = "balance sheet") AND (company_info.comp_ticker = "NVDA");
    
    SELECT * FROM balance_sheet;
END