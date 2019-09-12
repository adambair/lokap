#!/usr/bin/env bash
# `set -e` stops a script if a command or pipeline has an error
# set -e

usage="
Usage
    
  Build out a basic box on Linode

    ./linode bootstrap bp-stg-edge1

Options

  provision   - create the box, add to ~/.ssh/known_hosts
  setup       - updates the box, creates backplane user, locks out root
  bootstrap   - provision + setup
  delete      - destroys the box, removes from ~/.ssh/known_hosts
"

# Help
if [ "$1" == "-h" ] || [ "$1" == "" ] ; then
  echo "$usage"
  exit 0
fi

USERNAME=backplane

bootstrap() {
  provision $1
  setup $1
}

provision() {
  local name=$1
  local temp_password='ginsberg123'

  linode-cli linodes create \
    --label $name \
    --group $USERNAME \
    --type g6-nanode-1 \
    --region us-east \
    --image linode/arch \
    --root_pass $temp_password \
    --private_ip true \
    --booted true \
    --authorized_keys "$(cat ~/.ssh/id_rsa.pub)"

  echo ""
  printf "provisioning..."
  while [ "$(linode-cli --text linodes list | grep $name | awk {'print $6'})" != "running" ]; do
    printf "."
    sleep 3 
  done
  printf "running"

  echo ""
  printf "waiting for network..."
  while ! timeout 0.5 ping -c 1 -n $(linode_ip $name) &> /dev/null
  do
    printf "."
  done
  printf "online"
  echo ""

  known_hosts_add $name
  ssh_config_add $name
}

delete() {
  local name=$1
  local id=$(linode_id $name)

  echo ""
  printf "Deleting $name..."

  known_hosts_remove $name
  ssh_config_remove $name

  linode-cli --text linodes delete $id
  echo ""
}

setup() {
  local name=$1
  local ip=$(linode_ip $name)

  update="
  hostnamectl set-hostname $name; \
  sed -i '/yellowfiber/d' /etc/pacman.d/mirrorlist; \
  yes | pacman -Syq reflector; \
  reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist; \
  yes | pacman -Syqu; \
  "

  users="
  useradd -m -G wheel backplane; \
  cp -R .ssh /home/backplane; \
  chown -R backplane:backplane /home/backplane/.ssh; \
  echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers; \
  "

  lockdown="
  sed -i '/PermitRootLogin yes/c\PermitRootLogin no' /etc/ssh/sshd_config; \
  systemctl restart sshd; \
  "

  echo ""
  echo "update system..."
  ssh -t root@$ip $update

  echo ""
  echo "setup users..."
  ssh -t root@$ip $users

  echo ""
  echo "lockdown root..."
  ssh -t root@$ip $lockdown
}

linode_id() {
  local name=$1
  echo $(linode-cli --text linodes list | grep $name | awk {'print $1'})
}

linode_ip() {
  local name=$1
  local id=$(linode_id $name)
  echo $(linode-cli --json linodes ips-list $id | jq -r '.[] | .ipv4.public[] | .address')
}

known_hosts_add() {
  local name=$1
  local ip=$(linode_ip $name)

  echo ""
  echo "adding to ~./ssh/known_hosts..."
  ssh-keyscan $ip >> ~/.ssh/known_hosts
}

ssh_config_add() {
  local name=$1
  local ip=$(linode_ip $name)

  local ssh_config="Host $name
  HostName $ip
  User $USERNAME
  ForwardAgent yes
  "

  echo ""
  echo "adding to ~./ssh/config..."
  echo "$ssh_config" >> ~/.ssh/config
}

ssh_config_remove() {
  local name=$1

  echo ""
  echo "removing from ~./ssh/config..."
  sed -i "/^Host\s$name.*$/,+4d" ~/.ssh/config
}

known_hosts_remove() {
  local name=$1
  local ip=$(linode_ip $name)

  echo "removing from ~./ssh/known_hosts..."
  ssh-keygen -R $ip
}

# Pass arguments as function calls
#
# $1 -> function
# $2 -> argument
# 
# $2 is usually a hostname
#
$1 $2

