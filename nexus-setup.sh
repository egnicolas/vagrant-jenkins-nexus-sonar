#!/bin/bash

# --- Mise à jour des paquets ---
sudo yum update -y

# --- Installer Java 17 (Amazon Corretto) ---
sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo yum install -y java-17-amazon-corretto-devel wget yum-utils -y

# --- Installer Docker ---
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io

# --- Activer et démarrer Docker ---
sudo systemctl enable --now docker

# --- Créer le dossier persistant pour Nexus ---
echo ">>> Préparation des volumes Nexus..."
sudo mkdir -p /opt/sonatype-work/nexus3/log/audit
sudo chown -R 200:200 /opt/sonatype-work

# --- Supprimer un conteneur Nexus existant ---
if [ "$(sudo docker ps -a -q -f name=nexus)" ]; then
    echo ">>> Un conteneur Nexus existe déjà, suppression..."
    sudo docker rm -f nexus
fi

# --- Lancer Nexus OSS (multi-arch ARM64/AMD64) ---
echo ">>> Démarrage de Nexus OSS..."
sudo docker run -d \
  --name nexus \
  -p 8081:8081 \
  -v /opt/sonatype-work:/nexus-data \
  sonatype/nexus3:latest

# --- Vérifier l’état du conteneur ---
echo ">>> Conteneurs en cours :"
sudo docker ps