programa
{
	
	funcao inicio()
	{
		hospedesDescontos()
	}

	funcao hospedesDescontos()
	{
		cadeia nome
		inteiro idade
		logico parar = falso
		real valorDiaria
		inteiro totalDiaria = 0
		inteiro gratuidade = 0
		inteiro meia = 0
		
		escreva("Escreva o valor Padrão da diária\n")
		leia(valorDiaria)
		
		enquanto(parar == falso)
		{
			escreva("Escreva o nome do hóspede: \n")
			leia(nome)
			escreva("Escreva a idade do hóspede: \n")
			leia(idade)

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
			escreva("Se quiser parar digite P, se não tecle enter\n")
			leia(nome)
			se(nome == "P" ou nome == "p")
			{
				parar = verdadeiro
			}
			
		}
		escreva("Total de hospedagens: R$",totalDiaria, ", ",gratuidade," gratuidade(s)", ", ",meia ," meia(s)\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 439; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */