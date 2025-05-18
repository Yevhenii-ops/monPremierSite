
INSERT INTO users (username, password, profile_photo)
VALUES
('alice', 'password123', 'alice.jpg'),
('bob', 'bobpass456', 'bob.png'),
('charlie', 'charliepwd', NULL),
('diana', 'dianapass', 'diana.jpg'),
('edward', 'edward123', NULL),
('fiona', 'fionapw', 'fiona.png'),
('george', 'georgepw', NULL),
('hannah', 'hannahpw', 'hannah.jpg'),
('ian', 'ian123', NULL),
('julia', 'juliapass', 'julia.png');

-- Insertion des questions (en français) avec les notes calculées

INSERT INTO questions (user_id, title, content, date, mark)
VALUES
(1, 'Comment utiliser les jointures SQL ?', 'Je ne comprends pas bien la différence entre LEFT JOIN et INNER JOIN.', '2025-05-17', 2),
(2, 'Qu"est-ce qu"une clé primaire ?', 'Pourquoi est-ce important dans une table ?', '2025-05-17', 0),
(3, 'Différence entre DELETE et TRUNCATE ?', 'Dans quels cas faut-il utiliser l"un ou l"autre ?', '2025-05-17', 1),
(4, 'Comment normaliser une base de données ?', 'J"ai besoin d"aide pour comprendre les règles de normalisation.', '2025-05-17', 1),
(5, 'Qu"est-ce qu"une clé étrangère ?', 'Comment l"utiliser pour relier des tables ?', '2025-05-17', 2);



INSERT INTO answers (question_id, user_id, content, mark)
VALUES
(1, 2, 'LEFT JOIN renvoie toutes les lignes de la table de gauche et les lignes correspondantes de la table de droite.', 1),
(1, 4, 'INNER JOIN ne renvoie que les lignes ayant des correspondances dans les deux tables.', 1),
(2, 3, 'Une clé primaire identifie de façon unique chaque enregistrement dans une table.', 1),
(3, 6, 'DELETE supprime les lignes une par une et enregistre l"opération. TRUNCATE est plus rapide mais moins flexible.', 1),
(3, 7, 'Utilisez TRUNCATE si vous voulez vider une table rapidement.', -1),
(4, 5, 'La normalisation consiste à organiser les données pour éviter les redondances.', 1),
(5, 8, 'Une clé étrangère permet de lier deux tables et garantit l"intégrité référentielle.', 1),
(5, 9, 'On définit une clé étrangère avec la clause REFERENCES en SQL.', 1);



INSERT INTO votes (question_id, user_id, vote)
VALUES
(1, 3, 1),
(1, 4, 1),
(2, 5, 1),
(2, 6, -1),
(3, 1, 1),
(4, 2, 1),
(5, 10, 1),
(5, 7, 1);

INSERT INTO answer_votes (answer_id, user_id, vote)
VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, -1),
(6, 6, 1),
(7, 7, 1),
(8, 10, 1);

INSERT INTO learned_languages (user_id, language, niveau_de_matrise)
VALUES
(1, 'Python', 'Avancé'),
(1, 'Javascript', 'Intermédiaire'),
(2, 'C', 'Débutant'),
(3, 'Python', 'Intermédiaire'),
(4, 'Python', 'Débutant'),
(5, 'C', 'Avancé'),
(6, 'Python', 'Intermédiaire'),
(7, 'C', 'Débutant'),
(8, 'Javascript', 'Intermédiaire'),
(9, 'C', 'Avancé'),
(10, 'Javascript', 'Débutant');
