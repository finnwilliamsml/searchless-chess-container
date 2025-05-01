# searchless-chess-container

The following are the instructions for setting up the searchless-chess project.

### Initial Clone

Begin by cloning the repo: https://github.com/google-deepmind/searchless_chess?tab=readme-ov-file

### Cuda 

Both Cuda and Cudnn are too large do be downloaded on a standard free docker container, so must be downloaded locally.

If wget fails, keep trying. Not a proxy issue.

Install cuda toolkit with the following:
```
$ wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb
$ sudo dpkg -i cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb
$ sudo cp /var/cuda-repo-debian12-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
$ sudo apt-get update
$ sudo apt-get -y install cuda-toolkit-12-8
```

Confirm with the following:

```
$ nvidia-smi
```

Install cudnn using the following:

```
$ wget https://developer.download.nvidia.com/compute/cudnn/9.8.0/local_installers/cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb
$ sudo dpkg -i cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb
$ sudo cp /var/cudnn-local-repo-debian12-9.8.0/cudnn-local-9C3D3A6D-keyring.gpg /usr/share/keyrings/
$ sudo apt-get update
$ sudo apt-get -y install cudnn
```

Confirm with the following:

```
$ grep CUDNN_MAJOR -A 2 /usr/include/cudnn_version.h
```

### Download the data via the website (the docker container will point to the data location):

Under the "Downloading the Datasets" section, download all of the 7 linked files:

```
https://github.com/google-deepmind/searchless_chess?tab=readme-ov-file
```

Move the files to the train and test folders found in the following location:

```
\searchless_chess\data\
```

## Download the checkpoints using the following commands:

```
$ cd checkpoints
$ ./download.sh
$ cd ..
```

### Download and build Stockfish

Outside of the searchless-chess directory at the same level, install and build Stockfish with the following commands:

```
$ git clone https://github.com/official-stockfish/Stockfish.git
$ cd Stockfish/src
$ make -j profile-build ARCH=x86-64-avx2
$ cd ../..
```

### Download Leela Chess Zero

Outside of the searchless-chess directory at the same level, install with the following:

```
$ git clone -b release/0.30 --recurse-submodules https://github.com/LeelaChessZero/lc0.git
```

All of the necessary CUDA resources required should have been installed earlier. 

Download the Leela model by using the following:

```
$ mkdir lc0/build
$ mkdir lc0/build/release
$ cd lc0/build/release
$ wget https://storage.lczero.org/files/768x15x24h-t82-swa-7464000.pb.gz
$ gzip -d 768x15x24h-t82-swa-7464000.pb.gz
$ cd ../../..
```

### Install and build BayesElo

Outside of the searchless-chess directory at the same level, install with the following:

```
$ wget https://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2
$ tar -xvjf bayeselo.tar.bz2
$ cd BayesElo
$ make bayeselo
$ cd ..
```

### Install Nvidia Container Toolkit

Required to allow Docker to use Cuda and CuDNN that is locally installed.

```
$ curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
$ sudo apt-get update
$ sudo apt-get install -y nvidia-container-toolkit
```

(The commands were sourced from here: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

(See this post for more information: https://stackoverflow.com/questions/25185405/using-gpu-from-a-docker-container)

### Run the necessary dependencies 

Within this repository, go to the actions tab.

Click the most recent action called "Build Docker Image and Save Tar".

Scroll down and under Artifacts, download the docker-image-tar.

Move the tar to outside of the searchless-chess directory at the same level.

Unzip the tar, load and run the docker image:

```
$ unzip docker-image-tar.zip
$ sudo docker load -i searchless-chess.tar
$ docker run -it --gpus all   -v /usr/local/cuda:/usr/local/cuda     -v /home/finn/searchless_chess:/app/searchless_chess   -v /usr/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu   -e LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/lib/x86_64-linux-gnu   searchless-chess:offline bash
```

### Setting up things inside the container

Add the path to .bashrc:

```
echo 'export PYTHONPATH=/app' >> ~/.bashrc
```
