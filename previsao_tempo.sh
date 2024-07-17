if [[ ! $( type -p curl ) ]]; then
	echo 'curl não está instalado'
fi

if [[ ! $( ping -c1 8.8.8.8 ) ]]; then
	echo 'precisa de internet para executar o programa'
	exit 1
fi

read -p 'nome da sua cidade em minusculas: ' cidade
[[ -z "$cidade" ]] && { echo 'nenhuma cidade foi passada' ; exit 1 ; }

curl wttr.in/"$cidade"
