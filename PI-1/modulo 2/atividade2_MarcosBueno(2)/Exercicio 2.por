programa
{
	
	funcao inicio()
	{
		hospedes()
	}

	funcao hospedes()
	{
		inteiro quantidadeHospede
		inteiro numeroQuarto
		real valorDiaria
		real totalDiarias = 0.0

		escreva("Escreva a quantidade de hóspedes: \n")
		leia(quantidadeHospede)
		
		para (inteiro i = 0; i < quantidadeHospede; i++)
		{
			escreva("Escreva o número do quarto\n")
			leia(numeroQuarto)
			escreva("Escreva o valor da diária\n")
			leia(valorDiaria)
			se (valorDiaria <= 0 ou numeroQuarto < 0)
			{
				i = i-1
				escreva("O valor da diaria não pode ser menor ou igual a 0, e o número do quarto não pode ser menor que 0!\n")
			}
			senao se (valorDiaria > 0)
			{
				escreva("Quarto ", numeroQuarto, " valor da diária: R$", valorDiaria,"\n")
				totalDiarias = valorDiaria+totalDiarias
			}
		}
		escreva("\nO total de diarias é: R$",totalDiarias)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 492; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */