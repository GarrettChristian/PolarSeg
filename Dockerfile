FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04


# https://gitlab.com/nvidia/container-images/cuda/-/issues/158
RUN apt-key del "7fa2af80" \
&& export this_distro="$(cat /etc/os-release | grep '^ID=' | awk -F'=' '{print $2}')" \
&& export this_version="$(cat /etc/os-release | grep '^VERSION_ID=' | awk -F'=' '{print $2}' | sed 's/[^0-9]*//g')" \
&& apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/${this_distro}${this_version}/x86_64/3bf863cc.pub" \
&& apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/machine-learning/repos/${this_distro}${this_version}/x86_64/7fa2af80.pub"

RUN apt update && apt upgrade -y
RUN apt install -y git wget unzip
RUN apt update && apt install python3-pip -y

RUN pip3 install --upgrade pip


RUN pip3 install numpy==1.15.3
RUN pip3 install torch==1.9.0+cu102 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install tqdm==4.23.4
RUN pip3 install pyyaml==3.13
RUN apt install -y llvm
RUN pip3 install llvmlite==0.24.0
RUN pip3 install numba==0.39.0
RUN pip3 install cython==0.29.0
RUN pip3 install dropblock==0.3.0

ENV CUDA_HOME=/usr/local/cuda-9.2
RUN pip3 install cffi==1.13.2
RUN pip3 install pytest-runner==4.2
RUN pip3 install torch-scatter==2.0.7 -f https://data.pyg.org/whl/torch-1.9.0%2Bcu102.html

RUN pip3 install scipy==1.4.1




