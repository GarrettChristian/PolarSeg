FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04


# https://gitlab.com/nvidia/container-images/cuda/-/issues/158
RUN apt-key del "7fa2af80" \
&& export this_distro="$(cat /etc/os-release | grep '^ID=' | awk -F'=' '{print $2}')" \
&& export this_version="$(cat /etc/os-release | grep '^VERSION_ID=' | awk -F'=' '{print $2}' | sed 's/[^0-9]*//g')" \
&& apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/${this_distro}${this_version}/x86_64/3bf863cc.pub" \
&& apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/machine-learning/repos/${this_distro}${this_version}/x86_64/7fa2af80.pub"

# RUN apt update && apt upgrade -y
# RUN apt install -y git wget unzip
# RUN apt update && apt install python3-pip -y

# RUN pip3 install --upgrade pip


RUN apt update && apt upgrade -y
# RUN apt install -y python3 python3-dev python3-pip
# https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
RUN apt-get install ffmpeg libsm6 libxext6  -y
# https://stackoverflow.com/questions/12806122/missing-python-bz2-module
RUN apt-get install -y libbz2-dev
# https://stackoverflow.com/questions/57743230/userwarning-could-not-import-the-lzma-module-your-installed-python-is-incomple
RUN apt-get install -y liblzma-dev

# https://stackoverflow.com/questions/45954528/pip-is-configured-with-locations-that-require-tls-ssl-however-the-ssl-module-in
RUN apt-get install -y build-essential
RUN apt install -y libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev libtk8.6 libgdm-dev libdb4o-cil-dev libpcap-dev
RUN apt install -y git wget unzip
RUN apt-get install -y zlib1g-dev
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
RUN tar -xvf Python-3.5.2.tgz
WORKDIR /opt/Python-3.5.2
RUN ./configure
RUN make 
RUN make install
WORKDIR /




RUN pip3 install numpy==1.15.3
RUN pip3 install torch==1.3.1
RUN pip3 install tqdm==4.23.4
RUN pip3 install pyyaml==3.13
# RUN apt install -y llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime
RUN apt install -y llvm
RUN pip3 install llvmlite==0.24.0
# RUN LLVM_CONFIG=/path/to/llvm-config pip3 install llvmlite
RUN pip3 install numba==0.39.0
RUN pip3 install cython==0.29.0
# RUN pip3 install torch==1.4.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install dropblock==0.3.0

ENV CUDA_HOME=/usr/local/cuda-9.2
RUN pip3 install cffi==1.13.2
RUN pip3 install pytest-runner==4.2
RUN TORCH_CUDA_ARCH_LIST="6.1" FORCE_CUDA=1 pip3 install torch-scatter==1.3.1
# RUN pip3 install torch-scatter==2.0.4 -f https://data.pyg.org/whl/torch-1.4.0%2Bcu92.html

RUN pip3 install scipy==1.4.1




