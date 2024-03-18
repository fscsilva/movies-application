# README #

# Movie Application

## Project Start

### To download the entire project, use the following commands:
```bash
git clone git@github.com:fscsilva/movies-application.git --recursive
```
build all the submodules first using maven with:
```bash
mvn clean install
```

start the following services with ```docker-compose```
- MysqlDB.
- SQL migration using flyway.
- Gateway Service.
- Movie Service.
- Author Service.
- User Service.

```
docker-compose up
```

### Microservices as submodules
The repository includes the following microservices: `gateway`, `users`, `movies`, `authors`

## APIs Rest Functionalities

In order to run the following functionalities you must use the postman collection 
```MovieApp.postman_collection.json```

Import local env importing

```local.postman_environment.json```

Import Docker env importing

```Docker.postman_environment.json```

- Add a movie with its cover.
- Modify a movie.
- Add authors.
- Delete a movie.
- Delete authors.
- List movies with pagination.
- List movies with a filter by genre.
- Search movies by the author's name.
- Search for a movie ordered by a specific field.

## Roles and Permissions
The system will have two main roles: **User** and **Admin**.
- **User**: Can view all information about movies and authors but cannot perform any modification actions.
- **Admin**: Has permissions to perform all available actions in the system.

