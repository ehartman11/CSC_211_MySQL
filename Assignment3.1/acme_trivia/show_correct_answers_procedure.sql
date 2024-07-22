CREATE DEFINER=`root`@`localhost` PROCEDURE `acme_trivia.show_correct_answers`()
BEGIN
	SELECT * FROM correct_answers;
END