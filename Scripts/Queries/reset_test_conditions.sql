-- Due to PK/FK constraints, record removal must be done in the following order:
USE financial_portfolio;
-- remove the newest value entries from component_value
delete from component_value
where value_id > 42;

-- remove the newest financial statement 
delete from financial_statement
where fs_id = 3;

-- remove the newest quarter
delete from quarter
where qtr_id = 2;

-- verify that records have been removed by viewing the qtr_ids and fs_ids
select quarter.qtr_id, financial_statement.fs_id
from quarter inner join financial_statement on quarter.qtr_id = financial_statement.qtr_id;
