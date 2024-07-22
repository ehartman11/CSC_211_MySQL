CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_quarter`(in fin_id int, in q_id int, in q_month varchar(3), in q_year int)
BEGIN
	
    insert into financial_statement values
    (fin_id, q_id);
    
	INSERT INTO quarter values
    (q_id, q_month, q_year);

END