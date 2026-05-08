USE questionbank;

-- Clear existing questions if any
TRUNCATE TABLE questions;

-- EASY QUESTIONS
INSERT INTO questions (question, optA, optB, optC, optD, answer, difficulty) VALUES 
('Which of the following is not a Java keyword?', 'class', 'interface', 'extends', 'inherit', 'D', 'easy'),
('What is the default value of an integer variable in Java?', '0', '1', 'null', 'undefined', 'A', 'easy'),
('Which data type is used to create a variable that should store text?', 'string', 'String', 'txt', 'char', 'B', 'easy'),
('Which method is the entry point for any Java program?', 'start()', 'init()', 'main()', 'run()', 'C', 'easy');

-- MEDIUM QUESTIONS
INSERT INTO questions (question, optA, optB, optC, optD, answer, difficulty) VALUES 
('Which of these is not a feature of OOP?', 'Encapsulation', 'Polymorphism', 'Compilation', 'Inheritance', 'C', 'medium'),
('What is the size of float and double in Java?', '32 and 64 bits', '64 and 32 bits', '32 and 32 bits', '64 and 64 bits', 'A', 'medium'),
('Which package contains the Random class?', 'java.util', 'java.lang', 'java.io', 'java.net', 'A', 'medium'),
('What is the result of 13 % 5?', '1', '2', '3', '0', 'C', 'medium');

-- HARD QUESTIONS
INSERT INTO questions (question, optA, optB, optC, optD, answer, difficulty) VALUES 
('Which of the following is a thread-safe class?', 'StringBuilder', 'ArrayList', 'Vector', 'HashMap', 'C', 'hard'),
('What is the memory area where objects are stored?', 'Stack', 'Heap', 'Registry', 'Hard Drive', 'B', 'hard'),
('Which access specifier has the widest visibility?', 'private', 'protected', 'public', 'default', 'C', 'hard'),
('Which exception is thrown when an array is accessed with an invalid index?', 'NullPointerException', 'ArrayIndexOutOfBoundsException', 'IOException', 'NumberFormatException', 'B', 'hard');
