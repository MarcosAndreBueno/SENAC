programa
{
	
	funcao inicio()
	{
		//Módulo 1 - Atividade 1 - Exercício 3
		auditorio()
	}
	
		funcao auditorio()
	{
		inteiro numeroConvidados
		inteiro auditorioAlfa = 150
		inteiro auditorioBeta = 350
		inteiro cadeiras

		escreva("Escreva o número de convidados (máximo de 350): \n")
		leia(numeroConvidados)
			
		se(numeroConvidados > 350 ou numeroConvidados < 0)
		{
			escreva("Número de convidados inválido \n")
		}
		se(numeroConvidados <= 220 e numeroConvidados > 0)
		{
			escreva("Use o auditório Alfa\n")
			cadeiras = numeroConvidados - auditorioAlfa
			se (cadeiras > 0)
			{
				escreva("Inclua mais ", cadeiras," cadeira(s) \n")
			}
		}
			
		se(numeroConvidados > 220 e numeroConvidados <= 350)
		{
			escreva("Use o auditório Beta \n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 714; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */