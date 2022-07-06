programa
{
	
	funcao inicio()
	{	
		logico parar = falso
		caracter letra
		valorDoServico()
	
		enquanto(parar == falso)
		{
			escreva("\nDeseja informar novos dados? Sim (S) ou Não (N) \n")
			leia(letra)
			enquanto(letra != 'S' e letra != 'N')
			{
				escreva("Entrada inválida. Digite S ou N. \n")
				escreva("Deseja informar novos dados? Sim (S) ou Não (N) \n")
				leia(letra)
			}
			se(letra == 'N')
			{
				parar = verdadeiro
			}
			senao se(letra == 'S')
			{
				escreva("\n")
				valorDoServico()
			}
		}
	}

	funcao valorDoServico()
	{
		cadeia nomeEmpresa
		inteiro quantidadeAparelhos
		real percentualDesconto, desconto
		inteiro quantidadeMinima
		real valor
		escreva("Informe o nome da empresa: \n")
		leia(nomeEmpresa)
		escreva("Informe o valor do serviço por aparelho: \n")
		leia(valor)
		escreva("Informe o percentual de desconto: \n")
		leia(percentualDesconto)
		escreva("Informe a quantidade de aparelhos para manutenção: \n")
		leia(quantidadeAparelhos)
		escreva("Informe a quantidade mínima de aparelhos para conseguir desconto: \n")
		leia(quantidadeMinima)

		se(valor <= 0 ou quantidadeAparelhos <= 0)
		{
			escreva("Valores inválidos. O valor do serviço por aparelho e a quantidade de aparelhos devem ser maiores que 0 \n")
			inicio()
		}


		se(quantidadeAparelhos >= quantidadeMinima)
		{
			desconto = valor*quantidadeAparelhos*(percentualDesconto)/100
			valor = valor*quantidadeAparelhos-desconto
			escreva("O valor do serviço na empresa ", nomeEmpresa, " custará: R$",valor,"\n")
		}
		se(quantidadeAparelhos < quantidadeMinima)
		{
			valor = valor*quantidadeAparelhos
			escreva("O valor do serviço na empresa ", nomeEmpresa, " custará: R$",valor,"\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1713; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */