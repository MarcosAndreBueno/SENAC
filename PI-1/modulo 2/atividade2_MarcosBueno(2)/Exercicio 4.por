programa
{
	
	funcao inicio()
	{
		hospedesDescontosExpandido()
	}

	funcao hospedesDescontosExpandido()
	{
		cadeia nome
		inteiro idade
		logico parar = falso
		real valorDiaria = 0.0
		real totalDiaria = 0.0
		inteiro gratuidade = 0
		inteiro meia = 0
		inteiro menorIdade = -1
		inteiro maiorIdade = -1
		cadeia nomeMenorIdade = ""
		cadeia nomeMaiorIdade = ""

		escreva("Insira o valor Padrão da diária\n")
		leia(valorDiaria)

		enquanto(valorDiaria <= 0)
		{
			escreva("Valor da diária inválido. Insira um valor válido\n")
			leia(valorDiaria)
		}
		enquanto(parar == falso)
		{
			escreva("Escreva o nome do hóspede: \n")
			leia(nome)
			escreva("Escreva a idade do hóspede: \n")
			leia(idade)

			enquanto(idade < 0)
			{
				escreva("Insira um valor válido para idade\n")	
				leia(idade)
			}
			se(idade <= 4)
			{
				escreva(nome," possui gratuidade\n")
				gratuidade += 1	
			}
			se(idade >= 80)
			{
				escreva(nome," paga meia\n")
				meia += 1
				totalDiaria += valorDiaria/2
			}
			se (idade > 4 e idade < 80)
			{
				totalDiaria += valorDiaria
			}
			se(menorIdade == -1)
			{
				nomeMenorIdade = nome
				menorIdade = idade
				nomeMaiorIdade = nome
				maiorIdade = idade
			}
			se(idade < menorIdade)
			{
				menorIdade = idade
				nomeMenorIdade = nome
			}
			se(idade > maiorIdade)
			{
				maiorIdade = idade
				nomeMaiorIdade = nome
			}
			
			escreva("Se quiser parar digite N, se não digite S\n")
			leia(nome)
			enquanto(nome != "S" e nome != "N")
			{
			escreva("Se quiser parar digite N, se não digite S\n")
			leia(nome)
			}
			se(nome == "N")
			{
				parar = verdadeiro
			}
			
		}
		escreva("Total de hospedagens: R$",totalDiaria, ", ",gratuidade," gratuidade(s)", ", ",meia ," meia(s) \n")
		escreva("O hóspede mais velho é ", nomeMaiorIdade, " com ",maiorIdade," anos \n")
		escreva("O hóspede mais novo é ", nomeMenorIdade, " com ",menorIdade," ano(s) \n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1421; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */