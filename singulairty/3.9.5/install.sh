
# Replace the values as needed
OS=linux
ARCH=amd64
GO_VERSION=1.17.2
SINGULARITY_VERSION=3.9.5

###############################################
# install system dependencies
###############################################

# Ensure repositories are up-to-date
sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
   build-essential \
   libseccomp-dev \
   pkg-config \
   squashfs-tools \
   cryptsetup


################################################
# install Go
###############################################
wget https://dl.google.com/go/go$GO_VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzvf go$GO_VERSION.$OS-$ARCH.tar.gz
rm go$GO_VERSION.$OS-$ARCH.tar.gz


###############################################
# install singularity
##############################################
wget https://github.com/sylabs/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-ce-${SINGULARITY_VERSION}.tar.gz
tar -xzf singularity-ce-${SINGULARITY_VERSION}.tar.gz
cd singularity-ce-${SINGULARITY_VERSION}

./mconfig
make -C builddir
sudo make -C builddir install
