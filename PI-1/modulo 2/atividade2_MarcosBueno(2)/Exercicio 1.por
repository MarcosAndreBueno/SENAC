programa
{
	
	funcao inicio()
	{
		hospedagem()
	}

	funcao hospedagem()
	{
		real diaria
		inteiro dias
		logico dados = falso
		
		escreva("Escreva a diaria: \n")
		leia(diaria)
		escreva("Escreva a quantidade de dias (não ultrapassar 30 dias): \n")
		leia(dias)

		
		enquanto (diaria <= 0 ou dias <= 0 ou dias > 30)
		{
			escreva("Insira dados válidos\n")
			escreva("Dias devem ser <= a 30 e > 0, e as diarias devem ser > 0 \n")
			escreva("\n")
			escreva("Escreva a diaria: \n")
			leia(diaria)
			escreva("Escreva a quantidade de dias (não ultrapassar 30 dias): \n")
			leia(dias)
		}
		enquanto(dados == falso)
		{
			se (dias <= 30 e dias >= 1 
				e (diaria > 0))
			{
			escreva("Diaria = R$",diaria,"\nQuantidade de dias = ",dias)
			dados = verdadeiro
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 593; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */