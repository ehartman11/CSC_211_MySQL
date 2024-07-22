-- Create the DB
DROP schema IF EXISTS amd_portfolio;
CREATE schema amd_portfolio;
USE amd_portfolio;

-- Create the tables to include column_name, data_type, and constraints
CREATE TABLE financial_statement
(
	fs_id		INT		PRIMARY KEY NOT NULL,
	qtr_id		INT		NULL
);

CREATE TABLE quarter
(	
	qtr_id			INT					PRIMARY KEY NOT NULL,
	qtr				VARCHAR(3)			NULL,
    year			INT					NULL
);

CREATE TABLE statement
(
	statement_id	INT					PRIMARY KEY NOT NULL,
    statement_name	VARCHAR(20)			NULL
);

CREATE TABLE financial_component
(
	component_id	INT					PRIMARY KEY NOT NULL,
    component_name	VARCHAR(60)			NULL,
    statement_id	INT					NULL
);

CREATE TABLE component_value
(
	value_id		INT					PRIMARY KEY NOT NULL,	
    val				DECIMAL(19, 4)		NULL,
    denom_id		INT					NULL,
    component_id	INT					NULL,
	fs_id			INT					NULL
);

CREATE TABLE denomination
(
	denom_id		INT					PRIMARY KEY NOT NULL,
    denom			VARCHAR(1)			NULL
);

INSERT INTO financial_statement VALUES
(1, 1);

INSERT INTO quarter VALUES
(1, "SEP", 2023);

INSERT INTO statement VALUES
(1, "income statement"),
(2, "balance sheet"),
(3, "cash flow");

INSERT INTO financial_component VALUES
(1, "revenue", 1),
(2, "operating expense", 1),
(3, "net income", 1),
(4, "net profit margin", 1),
(5, "earnings per share", 1),
(6, "EBITDA", 1),
(7, "effective tax rate", 1),
(8, "cash and short-term investments", 2),
(9, "total assets", 2),
(10, "total liabilities", 2),
(11, "total equity", 2),
(12, "shares outstanding", 2),
(13, "price to book", 2),
(14, "return on assets", 2),
(15, "return on capital", 2),
(16, "net income", 3),
(17, "cash from operations", 3),
(18, "cash from investing", 3),
(19, "cash from financing", 3),
(20, "net change in cash", 3),
(21, "free cash flow", 3);

INSERT INTO denomination VALUES
(1, "B"),
(2, "M"),
(3, "K"),
(4, "%");

INSERT INTO component_value VALUES -- value_id, val, denom_id, component_id, fs_id, 
(1, 5.80, 1, 1, 1),
(2, 2.74, 1, 2, 1),
(3, 299.00, 2, 3, 1),
(4, 5.16, NULL, 4, 1),
(5, 0.70, NULL, 5, 1),
(6, 1.05, 1, 6, 1),
(7, -15.00, 4, 7, 1),
(8, 5.79, 1, 8, 1),
(9, 67.63, 1, 9, 1),
(10, 12.66, 1, 10, 1),
(11, 54.97, 1, 11, 1),
(12, 1.62, 1, 12, 1),
(13, 3.64, NULL, 13, 1),
(14, 0.83, 4, 14, 1),
(15, 0.97, 4, 15, 1),
(16, 299.00, 2, 16, 1),
(17, 421.00, 2, 17, 1),
(18, 102.00, 2, 18, 1),
(19, -803.00, 2, 19, 1),
(20, -280.00, 2, 20, 1),
(21, 573.75, 2, 21, 1);