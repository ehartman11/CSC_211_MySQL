-- Create the DB
DROP DATABASE IF EXISTS financial_portfolio;
CREATE DATABASE financial_portfolio;
USE financial_portfolio;

-- Create the tables to include column_name, data_type, and constraints
CREATE TABLE company
(
	company_id		INT				PRIMARY KEY NOT NULL,
    company_name	VARCHAR(20)		NULL,
    ticker_name		VARCHAR(5)		NULL
);

CREATE TABLE financial_statements
(
	table_id		INT				PRIMARY KEY NOT NULL,
	table_name		VARCHAR(20)		NULL,
    company_id		INT				NULL,
    
    
);

CREATE TABLE income_statement
(
	entry_id			INT				PRIMARY KEY NOT NULL,
	y_qtr				VARCHAR(6)		NULL,
	category_name		VARCHAR(60)		NULL, 
    current_value		DECIMAL			NULL,
    denomination		VARCHAR(1)		NULL,
    qtr_qtr_change		DECIMAL			NULL,
    y_y_change			DECIMAL			NULL, 
    table_id			INT				NULL
);

CREATE TABLE balance_sheet
(
	entry_id			INT				PRIMARY KEY NOT NULL,
	y_qtr				VARCHAR(6)		NULL,
	category_name		VARCHAR(60)		NULL, 
    current_value		DECIMAL			NULL,
    denomination		VARCHAR(1)		NULL,
    qtr_qtr_change		DECIMAL			NULL,
    y_y_change			DECIMAL			NULL,
    table_id			INT				NULL
);

CREATE TABLE cash_flow
(
	entry_id			INT				PRIMARY KEY NOT NULL,
	y_qtr				VARCHAR(6)		NULL,
	category_name		VARCHAR(60)		NULL, 
    current_value		DECIMAL			NULL,
    denomination		VARCHAR(1)		NULL,
    qtr_qtr_change		DECIMAL			NULL,
    y_y_change			DECIMAL			NULL, 
    table_id			INT				NULL
);

-- Insert 10 rows into each table
INSERT INTO financial_statements VALUES -- table_id, table_name
(1, "income statement"),
(2, "balance sheet"),
(3, "cash flow");

INSERT INTO income_statement VALUES -- entry_id, y_qtr, category_name, current_value, denomination, qtr_qtr_change, y_y_change, table_id
(1, NULL, "revenue", NULL, NULL, NULL, NULL, 1),
(2, NULL, "operating expense", NULL, NULL, NULL, NULL, 1),
(3, NULL, "net income", NULL, NULL, NULL, NULL, 1),
(4, NULL, "net profit margin", NULL, NULL, NULL, NULL, 1),
(5, NULL, "earnings per share", NULL, NULL, NULL, NULL, 1),
(6, NULL, "EBIDTA", NULL, NULL, NULL, NULL, 1),
(7, NULL, "effective tax rate", NULL, NULL, NULL, NULL, 1);

INSERT INTO balance_sheet VALUES -- entry_id, y_qtr, category_name, current_value, denomination, qtr_qtr_change, y_y_change, table_id
(1, NULL, "cash and short-term investments", NULL, NULL, NULL, NULL, 2),
(2, NULL, "total assets", NULL, NULL, NULL, NULL, 2),
(3, NULL, "total liabilities", NULL, NULL, NULL, NULL, 2),
(4, NULL, "total equity", NULL, NULL, NULL, NULL, 2),
(5, NULL, "shares outstanding", NULL, NULL, NULL, NULL, 2),
(6, NULL, "price to book", NULL, NULL, NULL, NULL, 2),
(7, NULL, "return on assets", NULL, NULL, NULL, NULL, 2),
(8, NULL, "return on capital", NULL, NULL, NULL, NULL, 2);

INSERT INTO cash_flow VALUES -- entry_id, y_qtr, category_name, current_value, denomination, qtr_qtr_change, y_y_change, table_id
(1, NULL, "net income", NULL, NULL, NULL, NULL, 3),
(2, NULL, "cash from operations", NULL, NULL, NULL, NULL, 3),
(3, NULL, "cash from investments", NULL, NULL, NULL, NULL, 3),
(4, NULL, "cash from financing", NULL, NULL, NULL, NULL, 3),
(5, NULL, "net change in cash", NULL, NULL, NULL, NULL, 3),
(6, NULL, "free cash flow", NULL, NULL, NULL, NULL, 3);
