sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
sudo docker rmi theilich/app:latest

cd ~/dev

sudo docker compose up
