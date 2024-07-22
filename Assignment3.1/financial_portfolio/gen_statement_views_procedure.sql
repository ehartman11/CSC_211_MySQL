CREATE PROCEDURE amd_portfolio.view_financial_statement (IN st_id INT, in st_name VARCHAR(20))
BEGIN
	DROP VIEW IF EXISTS st_name;
	CREATE VIEW st_name as
	SELECT statement.statement_name, financial_component.component_name, component_value.val, denomination.denom
	FROM statement LEFT JOIN financial_component
	ON statement.statement_id = financial_component.statement_id
	LEFT JOIN component_value ON financial_component.component_id = component_value.component_id
	LEFT JOIN denomination ON component_value.denom_id = denomination.denom_id
	WHERE financial_component.statement_id = st_id;
END;
