#!bin/bash

#Variável que contém o path a ser considerado como pasta para realizar o Backup, caso o usuário não queira selecionar outro.
path="$HOME/Desktop/data"

#Variável que contém o path a ser considerado como local do Backup.
backupPath="$HOME/Backups"

main() {
  echo "Olá $USERNAME!"
  echo "Eu realizarei o backup da pasta $path para você!"
  echo "Todos os seus dados ficarão salvos na pasta $backupPath!"
  echo
  
  navigateToPathSelection

}

navigateToPathSelection() {
  echo "Você deseja alterar a pasta que será observada para realizar o backup?"
  echo "1 - Sim"
  echo "2 - Não"
  read selection

  case $selection in
    1) changePath ;;
    2) navigateToBackupPathSelection ;;
    *) echo "Você digitou uma opção inválida!"; navigateToPathSelection ;;
  esac
}

changePath() {
  echo "Digite o caminho para a pasta que será observada ao realizar os backups:"
  read path
  echo
  echo "Ok! Agora sua nova pasta a ser observada será '$path'!"
  echo
  navigateToBackupPathSelection
}

navigateToBackupPathSelection() {
  echo "Você deseja alterar a pasta onde será armazenado o backup?"
  echo "1 - Sim"
  echo "2 - Não"
  read selection

  case $selection in
    1) changeBackupPath ;;
    2) navigateToRsyncConfiguration ;;
    *) echo "Você digitou uma opção inválida!"; navigateToBackupPathSelection ;;
  esac
}

changeBackupPath() {
  echo "Digite o caminho para a pasta que será armazenado o backup:"
  read backupPath
  echo
  echo "Ok! Agora sua nova pasta de backups será '$backupPath'!"
  echo
  navigateToRsyncConfiguration
}

navigateToRsyncConfiguration() {
  echo "Com que frequência você deseja fazer seu backup?"
  echo "1 - A cada 1 minuto"
  echo "2 - A cada 1 hora"
  echo "3 - A cada 1 dia"
  echo "4 - A cada 1 semana"
  echo "5 - A cada 1 mês"
  read option

  case $option in
    1) configureRsync "*" "*" "*" "*" "*" "a cada 1 minuto" ;; #Todo minuto
    2) configureRsync "0" "*" "*" "*" "*" "a cada 1 hora, no minuto 0" ;; #Toda hora, no minuto 0
    3) configureRsync "0" "5" "*" "*" "*" "a cada 1 dia, às 05h00" ;; #Todo dia, às 05h00
    4) configureRsync "0" "5" "*" "*" "1" "a cada 1 semana, na segunda ás 05h00" ;; #Toda semana, na segunda às 05h00
    5) configureRsync "0" "5" "1" "*" "*" "a cada 1 mês, no dia 1 às 05h00" ;; #Todo Mês, no dia 1 às 05h00
    *) echo "Ops! Parece que você selecionou um intervalo inválido, tente novamente." ; echo ; Backup ;;
  esac

}

configureRsync() {
  (crontab -l 2>/dev/null; echo "$1 $2 $3 $4 $5 rsync -auvh --progress $path $backupPath") | crontab -
  echo "Crontab ficou assim: $1 $2 $3 $4 $5 rsync... (executará $6)"
  echo "Tudo pronto! Essas foram as configurações finais do seu backup:"
  echo "Pasta que será observada: $path"
  echo "Pasta onde será armazenado o backup: $backupPath"
  echo "Periodicidade: $6"
  read option
}

main