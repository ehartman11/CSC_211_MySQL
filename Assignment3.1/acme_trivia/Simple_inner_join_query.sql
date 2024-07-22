USE acme_trivia;

-- SELECT questions.question_id, questions.question_text, answers.answers_text, answers.is_correct
-- FROM questions
-- INNER JOIN answers ON questions.question_id = answers.question_id;

DROP VIEW IF EXISTS python_questions;
CREATE VIEW python_questions 
AS SELECT question_text, answers_text, is_correct
AS VALUE FROM questions
RIGHT JOIN answers
ON questions.question_id = answers.question_id;

SELECT * FROM python_questions
WHERE VALUE = 1;