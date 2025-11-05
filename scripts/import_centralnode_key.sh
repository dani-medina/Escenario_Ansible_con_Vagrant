#!/bin/sh
# Copia a chave pública do CentralNode ao authorized_keys do root

echo "Configurando acceso SSH dende CentralNode"

mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ -f /vagrant/keys/centralnode_id_ed25519.pub ]; then
    if ! grep "root@CentralNode" /root/.ssh/authorized_keys > /dev/null 2>/dev/null; then
    	cat /vagrant/keys/centralnode_id_ed25519.pub >> /root/.ssh/authorized_keys
    	chmod 600 /root/.ssh/authorized_keys
    	echo "Chave pública de CentralNode engadida correctamente."
    else
    	echo "A chave pública xa foi introducida previamente."
    fi
else
    echo "Non se atopou a chave pública en /vagrant/keys/. Executa primero CentralNode."
fi

