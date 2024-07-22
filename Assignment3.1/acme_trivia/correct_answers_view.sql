-- create the view
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
-- name the view table
VIEW `correct_answers` AS
-- select the desired columns 
    SELECT 
        `questions`.`question_text` AS `question_text`,
        `answers`.`answers_text` AS `answer_text`
-- left join the columns on the questions table
    FROM
        (`questions`
        LEFT JOIN `answers` ON ((`answers`.`question_id` = `questions`.`question_id`)))
-- require that the records show the correct answers only 
    WHERE
        (`answers`.`is_correct` = TRUE)