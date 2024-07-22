CREATE DEFINER=`root`@`localhost` PROCEDURE `view_cash_flow`()
BEGIN
	DROP VIEW IF EXISTS cash_flow;
	CREATE VIEW cash_flow as
	SELECT statement.statement_name, financial_component.component_name, component_value.val, denomination.denom
	FROM statement LEFT JOIN financial_component
	ON statement.statement_id = financial_component.statement_id
	LEFT JOIN component_value ON financial_component.component_id = component_value.component_id
	LEFT JOIN denomination ON component_value.denom_id = denomination.denom_id
	WHERE financial_component.statement_id = 3;
    
    SELECT * FROM cash_flow;
END