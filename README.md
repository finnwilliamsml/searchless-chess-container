# searchless-chess-container

Before beginning, you must download the following on your local machine:
- Cuda
- CudNN
- Datasets
- Checkpoints

## Cuda




Follow the guide to install cuda and conda:
GPU Passthrough and Conda
1.	First, ensure you have the Nvidia Drivers Installed for your machine. Download The Official NVIDIA Drivers | NVIDIA
2.	Open the Start Menu and click Ubuntu 24.04.1 LTS
3.	Run through the Installation Instructions found here: CUDA Toolkit 12.8 Update 1 Downloads | NVIDIA Developer
•	wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
•	sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
•	wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-wsl-ubuntu-12-8-local_12.8.1-1_amd64.deb
•	sudo dpkg -i cuda-repo-wsl-ubuntu-12-8-local_12.8.1-1_amd64.deb
•	sudo cp /var/cuda-repo-wsl-ubuntu-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
•	sudo apt-get update
•	sudo apt-get -y install cuda-toolkit-12-8
4.	Run through the Installation Instructions found here: Installing Miniconda - Anaconda
•	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
•	bash ~/Miniconda3-latest-Linux-x86_64.sh
•	Press Return to review Anaconda’s Terms of Service (TOS). Then press and hold Return to scroll.
•	Enter yes to agree to the TOS.
•	Press Enter
•	Enter yes to modify shell configuration
•	Close the WSL window
•	Open the Start Menu and click Ubuntu 24.04.1 LTS
5.	Run the following command:  nano /home/yourusername/miniconda3/.condarc and remove everything from this file. 
6.	Exit nano using “Ctrl” + “O”, then press the enter key, then “Ctrl” + “X”
7.	Run the following command: conda config --set channel_priority strict
8.	Run the following command: 
conda config --add channels  http://10.15.159.168:8081/repository/conda/ 
9.	Run the following command:  nano /home/yourusername/.condarc and remove the line which says “defaults” from this file. 
10.	Exit nano using “Ctrl” + “O”, then press the enter key, then “Ctrl” + “X”
11.	Close the WSL window
12.	Open the Start Menu and click Ubuntu 24.04.1 LTS
13.	Run the following command: conda create -n Pytorchdemo python=3.10
14.	Run the following command: conda activate pytorchdemo
15.	Run the following command: conda install pytorch
16.	Run the following command: python3
17.	Now Type in the following: 
•	import torch
•	torch.cuda.device_count()

If wget fails, keep trying. Not a proxy issue.

Install cuda toolkit with the following:
wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb
sudo dpkg -i cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb
sudo cp /var/cuda-repo-debian12-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8

Install cudnn using the following:
wget https://developer.download.nvidia.com/compute/cudnn/9.8.0/local_installers/cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-debian12-9.8.0/cudnn-local-9C3D3A6D-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cudnn

Clone the repo

### Download the data (the docker container will point to the data location):
cd data
./download.sh
cd ..

If data download fails, take note of the file it failed to download, open the download.sh file, and copy the download commands; now run these download commands manually. For me, the final for loop failed, so I did the following:
- Created new script: $ touch download2.sh
- Copied for loop into this script:

cd train
for idx in $(seq -f "%05g" 0 2147)
do
  wget https://storage.googleapis.com/searchless_chess/data/train/action_value-$idx-of-02148_data.bag
done

- $ chmod +x download2.sh
- ./download2.sh
