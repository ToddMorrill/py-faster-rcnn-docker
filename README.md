### 1) [Install docker](https://docs.docker.com/engine/installation/linux/ubuntu/)
```
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update
sudo apt-get install docker-ce
```
To test docker run `sudo docker run hello-world`

[Configure docker to run as non-privileged user](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user)
```
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
```

### 2) [Install nvidia-docker](https://github.com/NVIDIA/nvidia-docker)
This allows Docker to find your GPU(s).

Note: nvidia-docker requires NVIDIA drivers. Howevever, if you have CUDA installed, you already have the drivers.
```
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
```
Test nvidia-docker run `nvidia-docker run --rm nvidia/cuda nvidia-smi`

### 3) Clone this repository
`git clone https://github.com/ToddMorrill/py-faster-rcnn-docker.git`
### 4) Build the Faster RCNN Docker image
Change into the directory with the Dockerfile and run `nvidia docker build -t caffe/py-faster-rcnn .`
### 5) Add _init_paths.py file to /path/to/your/workingdir on your local host
### 6) Run the new image as a Docker container
`nvidia-docker run -d -v "/path/to/your/workingdir:/root/py-faster-rcnn/working-dir" -p 8888:8888 caffe/py-faster-rcnn sh -c "jupyter notebook"`
### 7) Test that Faster RCNN is working by running the demo.ipynb script in the tools folder
- Navigate to localhost:8888 to see Jupyter Notebook
- Launch the tools/demo.ipynb (make sure your kernel says py-faster-r-cnn-env)
### 8) Begin your work in the working-dir
- Note: anything in this folder will be synced with your host machine folder that you specified
