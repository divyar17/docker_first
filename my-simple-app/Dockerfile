FROM centos
RUN mkdir python_code

COPY mypy.py /python_code/mypy.py

RUN yum -y update
RUN yum install -y centos-release-scl

COPY install_python.sh /python_code/install_python.sh
COPY modules_python.sh /python_code/modules_python.sh

RUN . /python_code/install_python.sh
RUN . /python_code/modules_python.sh

ENTRYPOINT python /python_code/mypy.py
