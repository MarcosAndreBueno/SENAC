programa
{
	
	funcao inicio()
	{
		quartosHotel()
	}

	funcao quartosHotel()
	{
		cadeia vetor[20]
		logico parar = falso
		inteiro numero
		cadeia situacao
		inteiro contador = 0
		
		enquanto(parar == falso)
		{
			escreva("Escolha o número do quarto de 1 a 20: \n")
			leia(numero)
			escreva("O quarto está livre (L) ou ocupado (O)? \n")
			leia(situacao)
			
			enquanto (numero < 1 ou numero > 20 
					ou (situacao != "L" e situacao != "O"))
			{
			escreva("Entrada inválida. O número do quarto não pode ser menor que 1 ou maior que 20 \n")
			escreva("A situação do quarto não pode ser diferente de L ou O \n")
			escreva("Escolha o número do quarto de 1 a 20: \n")
			leia(numero)
			escreva("O quarto está livre (L) ou ocupado (O)? \n")
			leia(situacao)
			}
			
			se(vetor[numero-1] == "Ocupado")
			{
				escreva("Quarto já está ocupado \n")
			}
			se (situacao == "L")
			{
				vetor[numero-1] = "Livre"
			}
			senao se(situacao == "O")
			{
				vetor[numero-1] = "Ocupado"
			}

			escreva("Você deseja parar? S para sim e N para não \n")
			leia(situacao
			)
			enquanto(situacao != "S" e situacao != "N")
			{
				escreva("Entrada inválida\n")
				escreva("Você deseja parar? S para sim e N para não \n")
				leia(situacao)	
			}
			se (situacao == "S")
			{
				parar = verdadeiro
			}
		}

		escreva("\nQuartos ocupados: \n\n")
		para (inteiro i = 0; i < 20; i++)
		{
			contador += 1
			se(vetor[i] != "Ocupado")
			{
				vetor[i] = "Livre"
			}
			se(contador < 20)
			{
				escreva(i+1,"- ",vetor[i],"; ")
			}
			se(contador == 20)
			{
				escreva(i+1,"- ",vetor[i],".")
			}
			se(contador == 10)
			{
				escreva("\n")
			}
			
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 998; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */