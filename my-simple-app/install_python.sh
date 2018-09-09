TMP_PATH=~/tmp_install_python

# Versions section
PYTHON_MAJOR=2.7
PYTHON_VERSION=$PYTHON_MAJOR.15

mkdir $TMP_PATH && cd $TMP_PATH

# Update yum and libraries
yum -y update
yum groupinstall -y development
yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel

# Download and extract Python and Setuptools
yum install -y wget
wget --no-check-certificate https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
wget --no-check-certificate https://raw.githubusercontent.com/pypa/setuptools/bootstrap/ez_setup.py
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
tar -zxvf Python-$PYTHON_VERSION.tgz

# Compile Python
cd $TMP_PATH/Python-$PYTHON_VERSION
./configure --prefix=/usr/local
make && make altinstall
#the below command to be in ~/.bash_profile for persistence
export PATH="/usr/local/bin:$PATH"

# Install Setuptools and PIP
cd $TMP_PATH
/usr/local/bin/python$PYTHON_MAJOR ez_setup.py
/usr/local/bin/python$PYTHON_MAJOR get-pip.py

# Finish installation
rm -rf $TMP_PATH
#the below commands to be in ~/.bash_profile for persistence
ln -sf /usr/local/bin/python2.7 /usr/local/bin/python
ln -sf /usr/local/bin/pip /usr/bin/pip
