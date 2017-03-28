nvidia-docker rm caffe
nvidia-docker run -t -i  --ulimit nofile=327680:327680 --ulimit nproc=65536:65536 --name caffe -v /home/ivan/Documentos/tileo:/tileo -w /tileo -d splashblot/py-faster-rcnn:latest
