-- Eliminamos y creamos la base de datos nuevamente
DROP DATABASE IF EXISTS tenant_test;
CREATE DATABASE tenant_test;
USE tenant_test;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    pass VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE user_roles (
    user_id INT,
    role_id INT,
    PRIMARY KEY(user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    birth_place VARCHAR(100)
);

CREATE TABLE actors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    year YEAR,
    genre_id INT,
    author_id INT,
    image_url VARCHAR(255),  -- Columna para la URL de la imagen
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE actors_in_movies (
    movie_id INT,
    actor_id INT,
    role_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (actor_id) REFERENCES actors(id)
);

INSERT INTO users (id,username, pass, first_name, last_name)
VALUES (1,'user1', '$2a$12$lIDhicV8tvHMjctsBYlsnuvlhB5mToLk/O5lNOWb3s.ug8EB6FhxG', 'Jon', 'snow'),
(2,'admin1', '$2a$12$HOnTbGciCucm8WiHoHVqUOoJFiD4TZo8e4YxeWUHyRi0M8Ebb9qk6', 'Cersei', 'Lannister');

INSERT INTO roles (id, role_name, description) VALUES 
(1, 'USER', 'Regular user with basic privileges'),
(2, 'ADMIN', 'User with administrative privileges');

INSERT INTO user_roles (user_id, role_id) VALUES (1, 1),(2,2);


INSERT INTO genres (id, description) VALUES 
(1, 'Action'),
(2, 'Adventure'),
(3, 'Animation'),
(4, 'Biography'),
(5, 'Comedy'),
(6, 'Crime'),
(7, 'Documentary'),
(8, 'Drama'),
(9, 'Family'),
(10, 'Fantasy'),
(11, 'Film-Noir'),
(12, 'History'),
(13, 'Horror'),
(14, 'Music'),
(15, 'Musical'),
(16, 'Mystery'),
(17, 'Romance'),
(18, 'Sci-Fi'),
(19, 'Sport'),
(20, 'Thriller'),
(21, 'War'),
(22, 'Western');


INSERT INTO authors (id, first_name, last_name, birth_date, birth_place) VALUES
(1, 'Christopher', 'Nolan', '1970-07-30', 'London, England'),
(2, 'Quentin', 'Tarantino', '1963-03-27', 'Knoxville, Tennessee'),
(3, 'Martin', 'Scorsese', '1942-11-17', 'New York, New York'),
(4, 'Steven', 'Spielberg', '1946-12-18', 'Cincinnati, Ohio'),
(5, 'George', 'Miller', '1945-03-03', 'Brisbane, Australia'),
(6, 'James', 'Cameron', '1954-08-16', 'Kapuskasing, Canada'),
(7, 'Ridley', 'Scott', '1937-11-30', 'South Shields, England'),
(8, 'Peter', 'Jackson', '1961-10-31', 'Pukerua Bay, New Zealand'),
(9, 'Tim', 'Burton', '1958-08-25', 'Burbank, California'),
(10, 'Frank', 'Darabont', NULL, NULL),
(11, 'David', 'Fincher', NULL, NULL),
(12, 'Robert', 'Zemeckis', NULL, NULL),
(13, 'Lana', 'Wachowski', NULL, NULL),
(14, 'Lilly', 'Wachowski', NULL, NULL),
(15, 'George', 'Lucas', NULL, NULL),
(16, 'Francis Ford', 'Coppola', NULL, NULL);

INSERT INTO movies (id, title, `year`, genre_id, author_id) VALUES 
(1, 'Inception', 2010, 18, 1),
(2, 'Pulp Fiction', 1994, 20, 2),
(3, 'The Dark Knight', 2008, 18, 1),
(4, 'The Shawshank Redemption', 1994, 8, 10),
(5, 'Fight Club', 1999, 6, 11),
(6, 'Forrest Gump', 1994, 8, 12),
(7, 'The Matrix', 1999, 18, 13), -- Solo se ha asociado con Lana Wachowski para simplificar. En la realidad, fue co-dirigida por Lana y Lilly Wachowski.
(8, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 10, 8),
(9, 'Star Wars: Episode IV - A New Hope', 1977, 18, 15),
(10, 'The Godfather', 1972, 6, 16),
(11, 'Jurassic Park', 1993, 2, 4),
(12, 'Avatar', 2009, 1, 6),
(13, 'Inglourious Basterds', 2009, 20, 2),
(14, 'Gladiator', 2000, 2, 7),
(15, 'Titanic', 1997, 17, 6);


INSERT INTO actors (first_name, last_name) VALUES 
('Leonardo', 'DiCaprio'),
('Ellen', 'Page'),
('Joseph', 'Gordon-Levitt'),
('John', 'Travolta'),
('Samuel', 'L. Jackson'),
('Uma', 'Thurman'),
('Christian', 'Bale'),
('Heath', 'Ledger'),
('Aaron', 'Eckhart'),
('Tim', 'Robbins'),
('Morgan', 'Freeman'),
('Brad', 'Pitt'),
('Edward', 'Norton'),
('Tom', 'Hanks'),
('Robin', 'Wright'),
('Keanu', 'Reeves'),
('Laurence', 'Fishburne'),
('Carrie-Anne', 'Moss'),
('Elijah', 'Wood'),
('Ian', 'McKellen'),
('Viggo', 'Mortensen'),
('Mark', 'Hamill'),
('Harrison', 'Ford'),
('Carrie', 'Fisher'),
('Marlon', 'Brando'),
('Al', 'Pacino'),
('James', 'Caan'),
('Sam', 'Neill'),
('Laura', 'Dern'),
('Jeff', 'Goldblum'),
('Sam', 'Worthington'),
('Zoe', 'Saldana'),
('Sigourney', 'Weaver'),
('Russell', 'Crowe'),
('Joaquin', 'Phoenix'),
('Kate', 'Winslet');

INSERT INTO actors_in_movies (movie_id, actor_id, role_name) VALUES 
(1, 1, 'Dom Cobb'),
(1, 2, 'Ariadne'),
(1, 3, 'Arthur'),
(2, 4, 'Vincent Vega'),
(2, 5, 'Jules Winnfield'),
(2, 6, 'Mia Wallace'),
(3, 7, 'Bruce Wayne / Batman'),
(3, 8, 'The Joker'),
(3, 9, 'Harvey Dent'),
(4, 10, 'Andy Dufresne'),
(4, 11, 'Ellis Boyd "Red" Redding'),
(5, 12, 'Tyler Durden'),
(5, 13, 'The Narrator'),
(6, 14, 'Forrest Gump'),
(6, 15, 'Jenny Curran'),
(7, 16, 'Neo'),
(7, 17, 'Morpheus'),
(7, 18, 'Trinity'),
(8, 19, 'Frodo Baggins'),
(8, 20, 'Gandalf'),
(8, 21, 'Aragorn'),
(9, 22, 'Luke Skywalker'),
(9, 23, 'Han Solo'),
(9, 24, 'Princess Leia'),
(10, 25, 'Don Vito Corleone'),
(10, 26, 'Michael Corleone'),
(10, 27, 'Sonny Corleone'),
(11, 28, 'Dr. Alan Grant'),
(11, 29, 'Dr. Ellie Sattler'),
(11, 30, 'Dr. Ian Malcolm'),
(12, 31, 'Jake Sully'),
(12, 32, 'Neytiri'),
(12, 33, 'Dr. Grace Augustine'),
(14, 34, 'Maximus'),
(14, 35, 'Commodus'),
(15, 1, 'Jack Dawson'),
(15, 36, 'Rose DeWitt Bukater');

