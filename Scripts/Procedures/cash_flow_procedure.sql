CREATE DEFINER=`root`@`localhost` PROCEDURE `view_cash_flow`()
BEGIN
	DROP VIEW IF EXISTS cash_flow;
    
	CREATE VIEW cash_flow as
	SELECT company_info.comp_ticker, financial_statement.fs_id, statement.statement_name, 
		financial_component.component_name, component_value.val, denomination.denom
	FROM company_info 
	LEFT JOIN financial_statement ON financial_statement.comp_id = company_info.comp_id
	LEFT JOIN component_value ON component_value.fs_id = financial_statement.fs_id
    LEFT JOIN financial_component ON financial_component.component_id = component_value.component_id
    LEFT JOIN statement ON statement.statement_id = financial_component.statement_id
    LEFT JOIN denomination ON denomination.denom_id = component_value.denom_id
	WHERE (statement.statement_name = "cash flow") AND (company_info.comp_ticker = "NVDA");
    
    SELECT * FROM cash_flow;
END