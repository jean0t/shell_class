[[ $UID -ne 0 ]] && { echo 'você precisa ser super usuário' ; exit 1 ; }


echo \
'1) adiciona um usuario
2) deleta um usuario
3) lista todos os usuarios
4) lista informacoes do sistema
5) sair do programa
'
read -p 'O que você gostaria de fazer? ' opcao

case "$opcao" in
	1) 
		read -p $'\nNome para o usuário: ' nome_usuario
		useradd $nome_usuario
		echo 'usuário criado'
	;;

	2)
		read -p $'Nome do usuário para deletar: ' nome_usuario
		userdel $nome_usuario
		echo 'usuario deletado'
	;;

	3)
		echo '============='
		echo 'Usuário:UID'
		cut -d: -f1,3 /etc/passwd | grep 10[0-9][0-9]
		echo '============='
	;;

	4)
		memoria_ram=$(free -Lh)
		operational_system=$(uname -o)
		kernel_version=$(uname -r)
		echo \
		"usuario atual: $USER
		id do usuario: $UID
		sistema operacional: $operational_system
		versão do kernel: $kernel_version
		área de trabalho do usuário: $HOME
		linguagem do sistema: $LANG
		memória ram do sistema: $memoria_ram 
		"
	;;

	5) echo 'saindo do programa...' && exit 0 ;;

	*) echo 'comando inválido, fechando o programa...' && exit 1 ;;

esac
