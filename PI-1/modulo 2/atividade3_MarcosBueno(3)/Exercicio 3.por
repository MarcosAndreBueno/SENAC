programa
{
	
	funcao inicio()
	{
		menu()
	}

	funcao menu()
	{
		inteiro opcao
		cadeia nome
		cadeia vetor[15]
		escreva("Digite uma opção: \n")
		escreva("1- cadastrar; 2- pesquisar; 3- sair \n")
		leia(opcao)
		logico parar = falso
		inteiro contador = 0, nomeEncontrado = 0
		
		enquanto (parar == falso)
		{
			se(opcao == 1 e contador <= 15)
			{
				escreva("Digite um nome para cadastro: \n")
				leia(nome)
				vetor[contador] = nome
				contador += 1
				se(contador == 15)
				{
					escreva("Número máximo de cadastros alcançados\n")	
				}
			}
			se(opcao == 2)
			{
				escreva("Digite um nome para pesquisa: \n")
				leia(nome)
				nomeEncontrado = 0
				para (inteiro i = 0; i < 15; i++)
				{
					se(nome == vetor[i])
					{
						escreva("O nome ", nome," foi encontrado no índice \"", i, "\" cadastrado \n\n")
						nomeEncontrado = 1
					}
				}
				se(nomeEncontrado == 0)
				{
				escreva("Hóspede não encontrado\n")
				}
			}
			escreva("Se deseja sair digite 3, caso contrário digite 0 \n")
			leia(opcao)
			se(opcao== 3)
			{
				parar = verdadeiro
			}
			se(opcao == 0)
			{
				escreva("\nDigite uma opção: \n")
				escreva("1- cadastrar; 2- pesquisar; 3- sair \n")
				leia(opcao)
			}
			se(contador == 15)
			{
				escreva("\nDigite uma opção: \n")
				escreva("1- cadastrar(INDISPONÍVEL); 2- pesquisar; 3- sair \n")
				leia(opcao)
				enquanto(opcao == 1)
				{
					escreva("\nA opção cadastro já atingiu o seu limite, escolha outra opção\n")
					escreva("Digite uma opção: \n")
					escreva("1- cadastrar(INDISPONÍVEL); 2- pesquisar; 3- sair \n")
					leia(opcao)
				}
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1391; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */