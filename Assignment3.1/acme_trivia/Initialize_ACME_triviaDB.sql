-- Create the DB
DROP DATABASE IF EXISTS ACME_trivia;
CREATE DATABASE ACME_trivia;
USE ACME_trivia;

-- Create the tables to include column_name, data_type, and 
CREATE TABLE trivia_game
(
	category_id		INT				PRIMARY KEY, 
	category_name	VARCHAR(120)	NULL
);

CREATE TABLE questions
(
	question_id		INT				PRIMARY KEY	NOT NULL, 
	question_text	VARCHAR(120)	NULL,
	category_id		INT				NULL,
	level			INT				NULL,
    -- Add in a constraint to link the category_id columns of the questions and trivia_game tables
	CONSTRAINT questions_fk_terms
		FOREIGN KEY (category_id)
		REFERENCES trivia_game(category_id)
);

CREATE TABLE answers
(
	answers_id		INT				PRIMARY KEY	NOT NULL, 
	answers_text	VARCHAR(120)	NULL,
	is_correct		BOOLEAN			NULL,
	question_id		INT				NULL, 
-- Add in a constraint to link the question_id columns of the questions and answers tables
	CONSTRAINT answers_fk_terms
		FOREIGN KEY (question_id)
		REFERENCES questions(question_id)
);

-- Insert 10 rows into each table
INSERT INTO trivia_game VALUES
(1, "Python"),
(2, "C#"),
(3, "VBA"),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL);

INSERT INTO questions VALUES
(1, "What is an example of a dictionary?", 1, 1),
(2, "How do you instatiate a Class?", 1, 2),
(3, "Which of the following is the correct way to declare an integer variable", 2, 1),
(4, "What is an example of declaring an array?", 2, 2),
(5, "How do you reference a cell in a given worksheet?", 3, 1),
(6, NULL, NULL, NULL),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(10, NULL, NULL, NULL);

INSERT INTO answers VALUES
(1, "dict = []", FALSE, 1),
(2, "dict = [x for x in keys if x == 'value']", FALSE, 1),
(3, "dict = ()", FALSE, 1),
(4, "dict = {key: value}", TRUE, 1),
(5, "Bassett_Hound = new class(Dog)", FALSE, 2),
(6, "Dog.__init__(Bassett_Hound)", FALSE, 2),
(7, "class Bassett_Hound(Dog)", FALSE, 2),
(8, "Bassett_Hound = Dog()", TRUE, 2),
(9, "int var Num AS 1;", FALSE, 3),
(10, "int num = 1;", TRUE, 3),
(11, "INTEGER num = 1;", FALSE, 3),
(12, "int num = '1';", FALSE, 3),
(13, "array myArray = {};", FALSE, 4),
(14, "myArray = arr();", FALSE, 4),
(15, "public static string[,] myArray = {};", TRUE, 4),
(16, "Arr1 = [[],[]];", FALSE, 4),
(17, "Cells('A1') WHERE worksheet = 'name' ", FALSE, 5),
(18, "Dim myRange as Range('A1')", FALSE, 5),
(19, "Range(1,1)", FALSE, 5),
(20, "Worksheets('name').Range('A1');", TRUE, 5);

