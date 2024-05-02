docker rmi -f theilich/app:latest

docker build -t theilich/app:latest -f app .

docker push theilich/app:latest



