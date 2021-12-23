docker network create todo-app
docker run -d --rm --name postgresql -v $(pwd)/data:/var/lib/postgresql/data --network todo-app -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=root123 -e POSTGRES_DB=registry thuongnn1997/todo-app-db:latest
docker run -d --rm --name todo-app -p 8081:8080 --network todo-app thuongnn1997/todo-app:latest