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
    telnet \
    ncdu \
    nmap \
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

