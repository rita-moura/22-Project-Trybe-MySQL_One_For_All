DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
    plan_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type_plan VARCHAR(50) NOT NULL,
    plan_value DECIMAL(5,3) NOT NULL
) engine = InnoDB;

CREATE TABLE artists(
	  artist_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL
) engine = InnoDB;

CREATE TABLE albums(
	  album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE songs(
	  song_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
) engine = InnoDB;

CREATE TABLE users(
	  user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    age INT NOT NULL,
    signature_date DATE NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
) engine = InnoDB;

CREATE TABLE followers(
	  user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    CONSTRAINT PRIMARY KEY(user_id, artist_id)
) engine = InnoDB;

CREATE TABLE history(
	  user_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (song_id) REFERENCES songs (song_id),
    CONSTRAINT PRIMARY KEY(user_id, song_id)
) engine = InnoDB;

INSERT INTO plans (type_plan, plan_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO artists (name)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO albums (name, release_year, artist_id)
VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);


INSERT INTO songs (name, duration, album_id)
VALUES
("BREAK MY SOUL", 279, 1),
("VIRGO'S GROOVE", 369, 1),
("ALIEN SUPERSTAR", 116, 1),
("Don't Stop Me Now", 203, 2),
("Under Pressure", 152, 3),
("Como Nossos Pais", 105, 4),
("O Medo de Amar é o Medo de Ser Livre", 207, 5),
("Samba em Paris", 267, 6),
("The Bard's Song", 244, 7),
("Feeling Good", 100, 8);

INSERT INTO users (name, age, signature_date, plan_id)
VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO followers (user_id, artist_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);

INSERT INTO history (user_id, reproduction_date, song_id)
VALUES 
(1, '2022-02-28 10:45:55', 8),
(1, '2020-05-02 05:30:35', 2),
(1, '2020-03-06 11:22:33', 10),
(2, '2022-08-05 08:05:17', 10),
(2, '2020-01-02 07:40:33', 7),
(3, '2020-11-13 16:55:13', 10),
(3, '2020-12-05 18:38:30', 2),
(4, '2021-08-15 17:10:10', 8),
(5, '2022-01-09 01:44:33', 8),
(5, '2020-08-06 15:23:43', 5),
(6, '2017-01-24 00:31:17', 7), 
(6, '2017-10-12 12:35:20', 1),
(7, '2011-12-15 22:30:49', 4),
(8, '2012-03-17 14:56:41', 4),
(9, '2022-02-24 21:14:22', 9),
(10, '2015-12-13 08:30:22', 3);