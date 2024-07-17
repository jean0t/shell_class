#!/usr/bin/env bash

[[ -d "$HOME/NEW" ]] || mkdir -p "$HOME/NEW"

[[ -d "$HOME/BACKUP" ]] || mkdir -p "$HOME/BACKUP"

case "$1" in

	-b|--backup)
			if [[ $( tar -cvf "$2.tar" "$3" ) ]] ; then
				echo 'compactação bem sucedida, enviando para o diretorio BACKUP'
				mv "$HOME/NEW.tar" -t "$HOME/BACKUP"
			else
				echo 'compactação mal sucedida'
			fi
	;;

	-h|--help)
		echo \
		'formatação geral do comando:
			./modulo1_fim.sh [-h|--help] -b DIRETORIO_ORIGEM DIRETORIO_BACKUP
			Comandos disponíveis:
			-h | --help: tela de ajuda

			-b | --backup: realiza o backup
		'
	;;

	*) echo 'comando não reconhecido' ;;
esac
