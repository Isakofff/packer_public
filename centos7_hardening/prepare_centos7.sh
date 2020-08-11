echo -e "\n[+] Install required repositories\n"
sudo yum install -y epel-release
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo -e "\n[+] Update system\n"
sudo yum update -y

echo -e "\n[+] Install required packages\n"
sudo yum install -y \
    yum-utils \
    jq \
    docker-ce \
    wget \
    mc \
    whois \
    htop \
    net-tools \
    iotop \
    which \
    unzip \
    bind-utils \
    traceroute \
    tree \
    file \
    vim-enhanced \
    ncdu \
    screen \
    git \
    python3 \
    python3-pip
# for Ansible
sudo pip3 install docker

echo -e "\n[+] Enable docker daemon\n"
sudo systemctl enable docker

echo -e "\n[+] Add 'centos' user to 'docker' group\n"
sudo usermod -aG docker centos

echo -e "\n[+] Bug fixes\n"
# fixing error "Unable to register authentication agent: GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed:Cannot determine user of subject"
# which caused by 'hidepid=2' option in /proc mount; daemon 'polkit'
# the problem is in 'dev-sec.os-hardening' Ansible Galaxy role
sudo groupadd -g 23 nohidproc
sudo usermod -a -G nohidproc polkitd
sudo sed -i 's/proc \/proc proc rw,nosuid,nodev,noexec,relatime,hidepid=2 0 0/proc \/proc proc rw,nosuid,nodev,noexec,relatime,hidepid=2,gid=nohidproc 0 0/g' /etc/fstab
