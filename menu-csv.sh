#! /usr/bin/bash

# here document
cat <<EOF
Cadastro de usuários
====================

1. Adicionar
2. Listar
3. Atualizar
4. Deletar

EOF

# array 
# list=("teste" "novo" "velho");
# criar o arquivo list

# if [[ -f list.csv ]]
# then
#     rm list.csv;
# else
#     touch list.csv;
# fi

# entrada de dados. -p para fazer a entrada junto com uma variável(acho que é isso kk)
# se o shell atual for o zsh, utilize o vared ao invés do read para input de dados 
if [ $0 = "zsh" ]
then 
	vared -p "Escolha a operação: " -c op;
else
	read -p "Escolha a operação: " op;
fi

# variáve que diz a quantidade de itens do array
# count=${#list[@]};

# funções

# Adicionar: Pede um valores e insere ele na última posição do array
adicionar(){
	if [ $0 = "zsh" ]
	then 
		vared -p "Informa o valores: " -c valores;
		# list[${count}+1]=${valores};
        echo ${valores} >> list.csv;
		echo -e "${valores} foi adicionado.";
	else
		read -p "Informa o valores: " valores;
		# list[${count}+1]=${valores};
        echo ${valores} >> list.csv
		echo -e "${valores} foi adicionado.";
	fi
}

# Listar: Exibi todos os itens da lista(semelhante a count. o * faz o mesmo do @)

listar(){
    IDSOUGHT="$1"
	# echo ${list[*]};
    # cat list.csv
    grep -E "^$IDSOUGTH" list.csv;
}

# Deletar: Mostra quantos itens tem na lista, Pergunta o index do item para excluir através da posição(unset)

deletar(){
	if [ $0 = "zsh" ]
	then 
		# echo -e "A lista tem ${#list[@]} items.";
		vared -p "Qual item da lista vc quer apagar? " -c index;
		# unset list[${index}];
        sed -i "/${index}/d" list.csv
		echo -e "O item foi apagado da sua lista.";
	else
		# echo -e "A lista tem ${#list[@]} items.";
		read -p "Qual item da lista vc quer apagar? " index;
		# unset list[${index}];
        sed -i "/${index}/d" list.csv
		echo -e "O item foi apagado da sua lista.";
	fi
	
}

# Atualizar: semelhante ao deletar para pegar o index e excluir através dele

atualizar(){
	if [ $0 = "zsh" ]
	then
		# echo -e "a lista tem ${#list[@]} items";
		vared -p "Qual o item que vc irá alterar?" -c item;
		vared -p "Insira o novo valores: " -c novoItem
        # sed -i "s/${item}/${novoItem}/" list.csv
        sed -i "s/${item}/${novoItem}/" list.csv
		# list[${item}]=${novoItem};
		echo -e "O item foi alterado.";
	else
		# echo -e "a lista tem ${#list[@]} items";
		read -p "Qual o item que vc irá alterar?" item;
		read -p "Insira o novo valores: " novoItem
		# list[${item}]=${novoItem};
        sed -i "s/${item}/${novoItem}/" list.csv
		echo -e "O item foi alterado.";
	fi
}

# enquanto continuar for igual (= : comparação) mantem o loop
continuar="sim"

while [ ${continuar} = "sim" ]
do	
	# se op for vazio(não aceitou variável vazia atribuindo com "" ou " ")
	# o if precisa do "then" como o while do "do" e fecha com fi.
	# case fecha com esac
	if [ $op = "vazio" ]
	then
		if [ $0 = "zsh" ]
		then
			vared -p "Escolha a operacao; " -c op;
			# semelhante ao switch case do js, java, etc. 

			case $op in
				1) adicionar;;
				2) listar;;
				3) atualizar;;
				4) deletar;;
				*) echo -e "Entrada Inválida!";;
			esac
		else
			read -p "Escolha a operacao; " op;
			# semelhante ao switch case do js, java, etc. 

			case $op in
				1) adicionar;;
				2) listar;;
				3) atualizar;;
				4) deletar;;
				*) echo -e "Entrada Inválida!";;
			esac
		fi
	else
		case $op in 
			1) adicionar;;
			2) listar;;
			3) atualizar;;
			4) deletar;;
			*) echo -e "Entrada Inválida!";;
		esac
	fi
	
	# só sai do loop se vc escolher qualquer outra coisa diferente de sim
	# Sai do programa
	if [ $0 = "zsh" ]
	then
		vared -p "Deseja executar outra operação? (sim/nao)" -c continuar;
		op="vazio";
	else
		read -p "Deseja executar outra operação? (sim/nao)" continuar;
		op="vazio";
	fi

done


#tail list.csv | grep -n ^[0-9]* | sed "s/marcilio/nome/"
#tail list.csv | grep -n ^[0-9]* "
#tail -n +1 list.csv | grep -n ^[0-9]* 