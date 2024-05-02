docker rmi -f theilich/app:latest
docker builder prune -af

docker build -t theilich/app:latest -f app .

docker push theilich/app:latest



