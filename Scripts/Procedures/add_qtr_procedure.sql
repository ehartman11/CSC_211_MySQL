CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_quarter`(in fin_id int, in c_id int, in q_id int, in q int, in q_year int, IN mr BOOL)
BEGIN
	-- add a new quarter
    INSERT INTO quarter values
    (q_id, q, q_year, mr);

	-- add a new financial statement 
    INSERT INTO financial_statement values
    (fin_id, q_id, c_id);
    
END