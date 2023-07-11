/*
* Author: Matteo Brunello 10/20/2019 20:57 P.M.
* This file represents the database of the API
*/

DROP DATABASE IF EXISTS priless;
CREATE DATABASE priless;
USE priless;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    password VARCHAR(40) NOT NULL,
    administrator BOOLEAN NOT NULL
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);

/* Since the relationship between teacher and course is n to n we need to create another table */
CREATE TABLE teacher_with_courses (
    course_id INT NOT NULL,
    teacher_id INT NOT NULL,
    PRIMARY KEY (teacher_id, course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    teacher_id INT,
    day DATE NOT NULL,
    hour INT NOT NULL,
    is_unbooked BOOLEAN DEFAULT FALSE,
    is_done BOOLEAN DEFAULT FALSE,
    course_id INT,
    FOREIGN KEY (teacher_id, course_id) REFERENCES teacher_with_courses(teacher_id, course_id)
        ON DELETE SET NULL
);

INSERT INTO users(email, name, surname, password, administrator) VALUES
('admin@priless.it', 'Admin', 'Admin' ,'21232f297a57a5a743894a0e4a801fc3', 1),
('lorenzo.caresio@edu.unito.it', 'Lorenzo', 'Caresio', '2cc98ffb608e98998f39fa2de319d05e', 0),
('sara@libero.com', 'Sara', 'Libero', '5dcb20c3609a45c070cf5bf6e63e395a', 0),
('slothrop@gmail.com', 'Tyrone', 'Slothrop', '2cc72a93ccc726242285e14400a4e810', 0),
('ciao@email.com', 'Mateio', 'Bruneio', '6e6bc4e49dd477ebc98ef4046c067b5f', 0);

INSERT INTO courses(title) VALUES
('Fisica dei Sistemi complessi'),
('Geometria e Algebra Lineare'),
('Tecniche informatiche per la fisica'),
('Intelligenza Artificiale'),
('Analisi Matematica'),
("Logica per l'Informatica"),
("Metodi Formali dell'Informatica"),
('Biochimica'),
('Fisiologia generale'),
('Zoologia evolutiva');

INSERT INTO teachers(name, surname) VALUES
('Fernando', 'Fiorentini'),
('Gualtiero', 'Angelo'),
('Ornella', 'Castiglione'),
('Raffaella', 'Costa'),
('Patrizio', 'Fanucci'),
('Franco', 'Lucciano'),
('Anna', 'Pinto'),
('Aimone', 'Pisani'),
('Carola', 'Gallo'),
('Abele', 'Onio');


INSERT INTO teacher_with_courses(teacher_id, course_id) VALUES
(1, 1), -- Fisica dei Sistemi complessi - Fiorentini
(3, 2), -- Fisica dei Sistemi complessi - Castiglione
(1, 3), -- Geometria e Algebra Lineare - Fiorentini
(3, 3), -- Geometria e Algebra Lineare - Castiglione
(2, 3), -- Geometria e Algebra Lineare - Angelo
(2, 4), -- Tecniche informatiche per la fisica - Angelo
(4, 5), -- Tecniche informatiche per la fisica - Costa
(4, 6), -- Intelligenza Artificiale - Costa
(5, 7), -- Intelligenza Artificiale - Fanucci
(7, 8); -- Intelligenza Artificiale - Pinto

INSERT INTO bookings(user_id, teacher_id, day, hour, course_id) VALUES
(2, 1, '2019-2-25', 13, 1),
(2, 1, '2019-2-15', 14, 1),
(2, 1, '2019-2-15', 15, 1),
(2, 1, '2019-2-15', 16, 1);
/**
SELECT * FROM teachers, teacher_with_courses
WHERE teachers.id = teacher_with_courses.teacher_id AND course_id = 3 AND
id NOT IN
(SELECT teacher_id FROM bookings WHERE hour = 18 AND day = "2019-05-19" AND is_unbooked = 0);
**/

INSERT INTO bookings(user_id, teacher_id, day, hour, course_id) VALUES (2, 1, '2020-07-24', 15, 3);

INSERT INTO users(email, name, surname, password, administrator) VALUES ('ciao@email.com', 'Mateio', 'Bruneio', '6e6bc4e49dd477ebc98ef4046c067b5f', 0);