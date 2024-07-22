CREATE DEFINER=`root`@`localhost` PROCEDURE `view_income_statement`()
BEGIN
	DROP VIEW IF EXISTS income_statement;
	CREATE VIEW income_statement as
	SELECT statement.statement_name, financial_component.component_name, component_value.val, denomination.denom
	FROM statement LEFT JOIN financial_component
	ON statement.statement_id = financial_component.statement_id
	LEFT JOIN component_value ON financial_component.component_id = component_value.component_id
	LEFT JOIN denomination ON component_value.denom_id = denomination.denom_id
	WHERE financial_component.statement_id = 1;
    
    SELECT * FROM income_statement;
END