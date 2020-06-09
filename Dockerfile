FROM ubuntu:18.04

LABEL maintainer="Shubham Vaishnav"

ENV pip_packages "ansible"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    locales \
    python-setuptools \
    python-pip \
    software-properties-common \
    rsyslog systemd systemd-cron sudo iproute2 \
    # Clean the apt files download by apt-get update
    && rm -Rf /var/lib/apt/lists/* \
    # Clean these directories to reduce image size
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Fix potential UTF-8 errors with ansible-test.
RUN locale-gen en_US.UTF-8

RUN pip install ${pip_packages}

# Install Ansible inventory file
RUN mkdir -p /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Remove unnecessary getty and udev targets that result in high CPU usage when using
# multiple containers with Molecule (https://github.com/ansible/molecule/issues/1104)
RUN rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

CMD ["/lib/systemd/systemd"]