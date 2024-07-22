-- Create the DB, drop it if it already exists
DROP schema IF EXISTS financial_portfolio;
CREATE schema financial_portfolio;
USE financial_portfolio;

-- Create the tables to include column_name, data_type, and constraints
CREATE TABLE company_info
(
	comp_id			INT					PRIMARY KEY NOT NULL,
    comp_name		VARCHAR(40)			NULL,
	comp_ticker		VARCHAR(5)			NULL
);

CREATE TABLE quarter
(	
	qtr_id			INT					PRIMARY KEY NOT NULL,
    qtr				INT					NULL,
    year			INT					NULL
);

CREATE TABLE financial_statement
(
	fs_id		INT		PRIMARY KEY NOT NULL,
	qtr_id		INT		NULL,
    comp_id		INT		NULL,
    CONSTRAINT financial_statement_fk_comp
		FOREIGN KEY (comp_id) REFERENCES company_info (comp_id),
	CONSTRAINT financial_statement_fk_qtr
        FOREIGN KEY (qtr_id) REFERENCES quarter (qtr_id)
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
    statement_id	INT					NULL,
    CONSTRAINT financial_component_fk_statement
		FOREIGN KEY (statement_id) REFERENCES statement (statement_id)
);

CREATE TABLE denomination
(
	denom_id		INT					PRIMARY KEY NOT NULL,
    denom			VARCHAR(1)			NULL
);

CREATE TABLE component_value
(
	value_id		INT					PRIMARY KEY NOT NULL,	
    val				DECIMAL(19, 4)		NULL,
    denom_id		INT					NULL,
    component_id	INT					NULL,
	fs_id			INT					NULL,
    most_recent_qtr	BOOLEAN				NULL,
	CONSTRAINT component_value_fk_comp
		FOREIGN KEY (component_id) REFERENCES financial_component (component_id),
	CONSTRAINT component_value_fk_fs
        FOREIGN KEY (fs_id) REFERENCES financial_statement (fs_id),
	CONSTRAINT component_value_fk_denom
		FOREIGN KEY (denom_id) REFERENCES denomination (denom_id)
);

-- Insert initial values to each table
iNSERT INTO company_info VALUES -- comp_id, comp_name, comp_ticker
(1, "Advanced Micro Devices", "AMD"),
(2, "Nvidia", "NVDA");

INSERT INTO quarter VALUES -- qtr_id, qtr, year
(1, 3, 2023);

INSERT INTO financial_statement VALUES -- fs_id, qtr_id, comp_id
(1, 1, 1),
(2, 1, 2);

INSERT INTO statement VALUES -- statement_id, statement_name
(1, "income statement"),
(2, "balance sheet"),
(3, "cash flow");

INSERT INTO financial_component VALUES -- component_id, component_name, statement_id
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

INSERT INTO denomination VALUES -- denom_id, denom
(1, "B"),
(2, "M"),
(3, "K"),
(4, "%");

INSERT INTO component_value VALUES -- value_id, val, denom_id, component_id, fs_id 
(1, 5.80, 1, 1, 1, TRUE),
(2, 2.74, 1, 2, 1, TRUE),
(3, 299.00, 2, 3, 1, TRUE),
(4, 5.16, NULL, 4, 1, TRUE),
(5, 0.70, NULL, 5, 1, TRUE),
(6, 1.05, 1, 6, 1, TRUE),
(7, -15.00, 4, 7, 1, TRUE),
(8, 5.79, 1, 8, 1, TRUE),
(9, 67.63, 1, 9, 1, TRUE),
(10, 12.66, 1, 10, 1, TRUE),
(11, 54.97, 1, 11, 1, TRUE),
(12, 1.62, 1, 12, 1, TRUE),
(13, 3.64, NULL, 13, 1, TRUE),
(14, 0.83, 4, 14, 1, TRUE),
(15, 0.97, 4, 15, 1, TRUE),
(16, 299.00, 2, 16, 1, TRUE),
(17, 421.00, 2, 17, 1, TRUE),
(18, 102.00, 2, 18, 1, TRUE),
(19, -803.00, 2, 19, 1, TRUE),
(20, -280.00, 2, 20, 1, TRUE),
(21, 573.75, 2, 21, 1, TRUE),
(22, 18.12, 1, 1, 2, TRUE),
(23, 2.98, 1, 2, 2, TRUE),
(24, 9.24, 1, 3, 2, TRUE),
(25, 51.01, NULL, 4, 2, TRUE), 
(26, 4.02, NULL, 5, 2, TRUE),
(27, 10.79, 1, 6, 2, TRUE),
(28, 12.16, 4, 7, 2, TRUE),
(29, 18.28, 1, 8, 2, TRUE),
(30, 54.15, 1, 9, 2, TRUE),
(31, 20.88, 1, 10, 2, TRUE),
(32, 33.27, 1, 11, 2, TRUE),
(33, 2.47, 1, 12, 2, TRUE),
(34, 35.33, NULL, 13, 2, TRUE),
(35, 50.22, 4, 14, 2, TRUE),
(36, 62.94, 4, 15, 2, TRUE),
(37, 9.24, 1, 16, 2, TRUE), 
(38, 7.33, 1, 17, 2, TRUE),
(39, -3.17, 1, 18, 2, TRUE),
(40, -4.53, 1, 19, 2, TRUE),
(41, -363.00, 2, 20, 2, TRUE),
(42, 4.69, 1, 21, 2, TRUE);
