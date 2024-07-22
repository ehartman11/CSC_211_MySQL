-- create the procedure and include an input argument
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q_A`(IN cat int)
BEGIN
	-- from the given view table, display the records with the given category_id
	SELECT * FROM view_questions
    WHERE category_id = cat;

END