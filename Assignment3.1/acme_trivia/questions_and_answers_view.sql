-- Create the view 
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
-- name the view table
VIEW `view_questions` AS
-- select the tables.columns that will fill the view table
    SELECT 
        `questions`.`category_id` AS `category_id`,
        `questions`.`question_text` AS `question_text`,
        `answers`.`answers_text` AS `answers_text`,
        `answers`.`is_correct` AS `VALUE`
-- join the columns using answers as the primary
    FROM
        (`answers`
        LEFT JOIN `questions` ON ((`questions`.`question_id` = `answers`.`question_id`)))