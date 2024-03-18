-- Eliminamos y creamos la base de datos nuevamente
/*DROP DATABASE IF EXISTS tenant_test;
CREATE DATABASE tenant_test;
USE tenant_test;*/

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