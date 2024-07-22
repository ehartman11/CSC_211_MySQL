CREATE DEFINER=`root`@`localhost` PROCEDURE `update_value_entries`(IN fin_id INT, IN r_qtr BOOL, IN v_id INT)
BEGIN
	-- Purpose of this procedure is to make the repetitive task of entering data to value table more efficient
    -- update the financial statement id
	UPDATE component_value
    SET fs_id = fin_id 
    WHERE value_id > v_id;

END