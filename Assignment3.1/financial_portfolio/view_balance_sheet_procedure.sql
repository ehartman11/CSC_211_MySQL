CREATE DEFINER=`root`@`localhost` PROCEDURE `view_balance_sheet`()
BEGIN
	DROP VIEW IF EXISTS balance_sheet;
	CREATE VIEW balance_sheet as
	SELECT statement.statement_name, financial_component.component_name, component_value.val, denomination.denom
	FROM statement 
    LEFT JOIN financial_component ON statement.statement_id = financial_component.statement_id
	LEFT JOIN component_value ON financial_component.component_id = component_value.component_id
	LEFT JOIN denomination ON component_value.denom_id = denomination.denom_id
	WHERE financial_component.statement_id = 2;
    
    SELECT * FROM balance_sheet;
END