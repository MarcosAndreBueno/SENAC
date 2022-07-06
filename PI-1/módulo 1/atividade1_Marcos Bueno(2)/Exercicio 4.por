programa
{
	
	funcao inicio()
	{
		//Módulo 1 - Atividade 1 - Exercício 4
		reserva()
	}
	
	funcao reserva()
	{
		cadeia dia
		cadeia empresa
		real hora

		escreva("Escreva o dia da semana em letras pequenas e sem acentos: \n")
		leia(dia)
		escreva("Escreva a hora: \n")
		leia(hora)
		
		
		se (dia != "segunda" e dia != "terça" e dia != "quarta" e dia 
			!= "quinta" e dia != "sexta" e dia != "sabado" e dia != "domingo")
			{
				escreva("Insira um dia válido")
			}
		
		senao se (dia != "sabado" e dia != "domingo")
		{
			se(hora >= 7 e hora <= 23)
			{
				escreva("Restaurante disponível \n")
				escreva("Insira o nome da empresa: \n")
				leia(empresa)
				escreva("Restaurante reservado para empresa \"", empresa, "\": ", dia, " às ", hora, " hrs \n")
			}
			se(hora < 7 ou hora > 23)
			{
				escreva("Restaurante indisponível \n")
			}
		
		}
		senao se (dia == "sabado" ou dia == "domingo")
			{
				se(hora >= 7 e hora <= 15)
				{
					escreva("Restaurante disponível \n")
					escreva("Insira o nome da empresa: \n")
					leia(empresa)
					escreva("Restaurante reservado para empresa \"", empresa, "\": ", dia, " às ", hora, " hrs \n")
				}
				se(hora < 7 ou hora > 15)
				{
					escreva("Restaurante indisponível \n")
				}
			}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1163; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */