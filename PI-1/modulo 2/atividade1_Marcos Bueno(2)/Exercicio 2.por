programa
{
	
	funcao inicio()
	{
		//Módulo 1 - Atividade 1 - Exercício 2
		hotelCafe()
	}

	funcao hotelCafe()
	{
	real cafe = 0.2
	real agua = 0.5
	inteiro salgadinhos = 7
	inteiro quantidadePessoas

	escreva("Escreva a quantidade de pessoas: \n")
	leia(quantidadePessoas)

	se(quantidadePessoas >350)
	{
	escreva("Quantidade de convidados superior à capacidade máxima")
	}
	senao
	{
		cafe = quantidadePessoas*cafe
		agua = quantidadePessoas*agua
		salgadinhos = quantidadePessoas*salgadinhos
		escreva(cafe," litros de cafe, ", agua," litros de agua, ", salgadinhos," salgadinhos")
	}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 92; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */