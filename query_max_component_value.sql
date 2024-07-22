use financial_portfolio;

SELECT company_info.comp_ticker, financial_statement.fs_id, financial_component.component_name, max(component_value.val) OVER(PARTITION BY comp_ticker) AS "Max Value", denomination.denom
FROM company_info
LEFT JOIN financial_statement ON financial_statement.comp_id = company_info.comp_id
LEFT JOIN component_value ON component_value.fs_id = financial_statement.fs_id
LEFT JOIN financial_component ON financial_component.component_id = component_value.component_id
LEFT JOIN denomination ON denomination.denom_id = component_value.denom_id
WHERE financial_component.component_name = "revenue" and component_value.denom_id = 1
ORDER BY comp_ticker;
