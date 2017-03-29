### 1) Install docker
[Docker documentation](https://docs.docker.com/engine/installation/linux/ubuntu/)
```
sudo apt-get install \ apt-transport-https \ ca-certificates \ curl \ software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update
sudo apt-get install docker-ce
```

To test docker run:
sudo docker run hello-world
# configure docker to run as non-privileged user
#https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world


2) install nvidia-docker - https://github.com/NVIDIA/nvidia-docker
- requires NVIDIA drivers (if you you installed cuda, you have the drivers)

# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Test nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi

3) git pull script -
4) build command (takes time) (cd into the directory with the Dockerfile
- nvidia docker build -t caffe/py-faster-rcnn .
5) add _init_paths.py file to /path/to/your/workingdir on your local host
6) run command
nvidia-docker run -d -v "/path/to/your/workingdir:/root/py-faster-rcnn/working-dir" -p 8888:8888 caffe/py-faster-rcnn sh -c "jupyter notebook"
7) run the demo.ipynb script in the tools folder (make sure your kernel says py-faster-r-cnn-env)
