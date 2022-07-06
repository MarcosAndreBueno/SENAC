programa
{
	inclua biblioteca Texto --> tx
	
	funcao inicio()
	{
		inteiro opcao
		inteiro novaOpcao
		cadeia nome
		cadeia vetor[15]
		escreva("Digite uma opção: \n")
		escreva("1- cadastrar; 2- pesquisar; 3- sair \n")
		leia(opcao)
		logico parar = falso
		inteiro contador = 0
		inteiro pos = 0

		enquanto(parar == falso)
		{
			se (opcao == 1 e contador >= 15)
			{
				escreva("Número máximo de nomes dentro do vetor já alcançado, escolha outra opção.\n")
			}
			se (opcao == 1 e contador < 15)
			{
				nome = cadastro()
				vetor[contador] = nome
				contador += 1
			}
			se (opcao == 2)
			{
				
				escreva("Digite parte do texto para pesquisa: \n")
				leia(nome)
				logico encontrouNome = falso
				para (inteiro i = 0; i < 15; i++)
				{
					se(vetor[i] != "")
					{
						encontrouNome = pesquisa(vetor[i], nome, i, encontrouNome)
					}
				}
				se(encontrouNome == falso)
				{
					escreva("Nome não encontrado\n")
				}
			}
			opcao = outraOpcao(opcao)
			se (opcao == 3)
			{
				parar = verdadeiro
			}
		}
	}

	funcao cadeia cadastro()
	{
		cadeia nome
		escreva("Digite um nome para cadastro: \n")
		leia(nome)
		retorne nome
	}

	funcao logico pesquisa(cadeia vetor, cadeia nome, inteiro i, logico encontrouNome)
	{
		inteiro pos
		pos = tx.posicao_texto(nome, vetor, 0)
		
		se(pos != -1)
		{
			escreva("Nome, ",vetor,", encontrado na posição ",i, "\n")
			encontrouNome = verdadeiro
		}
		retorne encontrouNome
	}

	funcao inteiro outraOpcao(inteiro opcao)
	{
		inteiro novaOpcao
		
		escreva("\nSe deseja outra opção digite 0, caso contrário digite 4 para continuar na mesma opção. \n")
		leia(novaOpcao)
		enquanto(novaOpcao != 0 e novaOpcao != 4)
		{
			escreva("Digite uma opção valida\n")
			escreva("Se deseja outra opção digite 0, caso contrário digite 4 para continuar na mesma opção. \n")
			leia(novaOpcao)
		}
		se(novaOpcao == 4)
		{
			retorne opcao
		}
		se(novaOpcao == 0)
		{
			escreva("\nDigite uma opção: \n")
			escreva("1- cadastrar; 2- pesquisar; 3- sair. \n")
			leia(novaOpcao)
		}
		
		retorne novaOpcao
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 934; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */