# searchless-chess-container

The following are the instructions for setting up the searchless-chess project.

### Cuda 

If wget fails, keep trying. Not a proxy issue.

Install cuda toolkit with the following:

$ wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb

$ sudo dpkg -i cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb

$ sudo cp /var/cuda-repo-debian12-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/

$ sudo apt-get update

$ sudo apt-get -y install cuda-toolkit-12-8

Install cudnn using the following:

$ wget https://developer.download.nvidia.com/compute/cudnn/9.8.0/local_installers/cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb

$ sudo dpkg -i cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb

$ sudo cp /var/cudnn-local-repo-debian12-9.8.0/cudnn-local-9C3D3A6D-keyring.gpg /usr/share/keyrings/

$ sudo apt-get update

$ sudo apt-get -y install cudnn

### Download the data via the website (the docker container will point to the data location):

Under the "Downloading the Datasets" section, download all of the 7 linked files:
https://github.com/google-deepmind/searchless_chess?tab=readme-ov-file

Move the files to the train and test folders found in the following location:
\searchless_chess\data\

## Download the checkpoints using the following commands:

$ cd checkpoints

$ ./download.sh

$ cd ..

### Download and build Stockfish

Outside of the searchless-chess directory at the same level, install and build Stockfish with the following commands:

$ git clone https://github.com/official-stockfish/Stockfish.git

$ cd Stockfish/src

$ make -j profile-build ARCH=x86-64-avx2
$ cd ../..

### Download Leela Chess Zero

Outside of the searchless-chess directory at the same level, install with the following:

$ git clone -b release/0.30 --recurse-submodules https://github.com/LeelaChessZero/lc0.git

All of the necessary CUDA resources required should have been installed earlier. 

Download the Leela model by using the following:

$ mkdir lc0/build

$ mkdir lc0/build/release

$ cd lc0/build/release

$ wget https://storage.lczero.org/files/768x15x24h-t82-swa-7464000.pb.gz

$ gzip -d 768x15x24h-t82-swa-7464000.pb.gz

$ cd ../../..

### Install and build BayesElo

Outside of the searchless-chess directory at the same level, install with the following:

$ wget https://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2

$ tar -xvjf bayeselo.tar.bz2

$ cd BayesElo

$ make bayeselo

$ cd ..

### Run the necessary dependencies 

Within this repository, go to the actions tab.
Click the most recent action called "Build Docker Image and Save Tar".
Scroll down and under Artifacts, download the docker-image-tar.
Move the tar to outside of the searchless-chess directory at the same level.

Unzip the tar, load and run the docker image:

$ unzip docker-image-tar.zip

$ sudo docker load -i searchless-chess.tar

$ sudo docker run -it searchless-chess:offline

