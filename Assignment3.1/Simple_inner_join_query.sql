USE acme_trivia;

-- SELECT questions.question_id, questions.question_text, answers.answers_text, answers.is_correct
-- FROM questions
-- INNER JOIN answers ON questions.question_id = answers.question_id;

call Q_A(1);