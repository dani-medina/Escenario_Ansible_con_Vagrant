#!/bin/sh
# Exporta a chave pública para que Vagrant poida compartila cos demais nodos

echo "Exportando chave pública de CentralNode"
mkdir -p /vagrant/keys
cp /root/.ssh/id_ed25519.pub /vagrant/keys/centralnode_id_ed25519.pub
chmod 644 /vagrant/keys/centralnode_id_ed25519.pub

