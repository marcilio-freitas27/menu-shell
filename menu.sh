cat <<EOF
Cadastro de usuários
====================

1. Adicionar
2. Listar
3. Atualizar
4. Deletar

EOF

list=("teste" "novo" "velho");

read -p "Escolha a operação: " op;

count=${#list[@]};

adicionar(){
	read -p "Informa o nome: " nome;
	list[${count}+1]=${nome};
	echo -e "${nome} foi adicionado.";
}

listar(){
	echo ${list[*]};
}

deletar(){
	echo -e "A lista tem ${#list[@]} items.";
	read -p "Qual item da lista vc quer apagar? " index;
	unset list[${index}];
	echo -e "O item foi apagado da sua lista.";
}

atualizar(){
	echo -e "a lista tem ${#list[@]} items";
	read -p "Qual o item que vc irá alterar?" item;
	read -p "Insira o novo nome: " novo
	list[${item}]=${novo};
	echo -e "O item foi alterado.";
}

continuar="sim"

while [ ${continuar} = "sim" ]
do
	if [ $op = "vazio" ]
	then
		read -p "Escolha a operacao; " op;
		case $op in
			1) adicionar;;
			2) listar;;
			3) atualizar;;
			4) deletar;;
			*) echo -e "Entrada Inválida!";;
		esac
	else
		case $op in 
			1) adicionar;;
			2) listar;;
			3) atualizar;;
			4) deletar;;
			*) echo -e "Entrada Inválida!";;
		esac
	fi

	read -p "Deseja executar outra operação? (sim/nao)" continuar;
	op="vazio";

done
