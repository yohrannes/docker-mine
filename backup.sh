#!/bin/bash

# Configurações
GAMEDIR="/root/minecraft-server"
BACKUPDIR="/root/backupsmine"
MAXDAYS="30"

# Criação de backup
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_name="backup_${timestamp}"
backup_path="${BACKUPDIR}/${backup_name}"

mkdir -p "${backup_path}"
rsync -a --delete "${GAMEDIR}/" "${backup_path}/"

# Limpeza de backups antigos
find "${BACKUPDIR}" -maxdepth 1 -type d -mtime +${MAXDAYS} -exec rm -rf {} \;
