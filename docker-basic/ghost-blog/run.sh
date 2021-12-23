docker network create ghost-network
docker volume create ghost-volume
docker run -d --rm --name db -v ghost-volume:/var/lib/mysql --network ghost-network -e MYSQL_ROOT_PASSWORD=example mysql:5.7
docker run -d --rm --name ghost-blog -p 80:2368 --network ghost-network -e database__client=mysql -e database__connection__host=db -e database__connection__user=root -e database__connection__password=example -e database__connection__database=ghost ghost:alpine