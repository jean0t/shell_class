#!/usr/bin/env bash

echo 'Bem Vindo ao MetaForm, seus dados estão seguros!'
sleep 5s
echo -e "Nome do Usuário: $USER\nSua HOME Pessoal é: $HOME\nO Shell Utilizado é: $SHELL\n"
read -p "Nome completo: " nome
test -z $nome && { echo 'Nome não foi digitado' ; exit 1; }
read -p "Idade: " idade
test -z $idade && { echo 'Idade não foi incluída' ; exit 1; }
read -p "Endereço: " endereco
test -z $endereco && { echo 'Endereco não foi digitado' ; exit 1; }
read -p "Telefone: " telefone
test -z $telefone && { echo 'Telefone não foi digitado' ; exit 1; }
read -p "Escolaridade: " escolaridade
test -z $escolaridade && { echo 'Escolaridade não foi digitada' ; exit 1; }
read -p "Profissão: " profissao
test -z $profissao && { echo 'Profissão não foi digitada' ; exit 1; }

echo -e "Seu nome é $nome, idade $idade anos, mora em $endereco\natende na linha $telefone"
echo -e "possui $escolaridade e ocupa a função de $profissao"

read -p 'Seus dados estão corretos? [s/N] ' confirmacao
test confirmacao = "s" \
&& echo 'Dados salvos no banco de dados' \
|| echo 'Dados descartados'
