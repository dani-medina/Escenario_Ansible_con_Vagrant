#!/bin/sh
# Xera una clave SSH ED25519 para root se non existe

echo "Xerando chave SSH ED25519 para root"
mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ ! -f /root/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -f /root/.ssh/id_ed25519 -N "" -C "root@CentralNode"
    echo "Chave SSH creada."
else
    echo "A chave SSH xa existe."
fi

