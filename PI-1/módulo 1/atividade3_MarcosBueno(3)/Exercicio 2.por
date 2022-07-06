programa
{
	
	funcao inicio()
	{
		hospedesNomesSexo()
	}

	funcao hospedesNomesSexo()
	{
		cadeia vetorNomeM[5], vetorNomeF[5]
		inteiro contadorM = 0, contadorF = 0
		cadeia nome
		cadeia sexo
		logico parar = falso
		inteiro numero
		
		enquanto(parar == falso)
		{
		
		     para (numero = 0; numero < 5; numero++)
	      	{   
		          escreva("Informe o nome do(a) hóspede: \n")
		          leia(nome)
		          escreva("Informe o sexo do(a) hóspede (M ou F): \n")
		          leia(sexo)
		          	enquanto (sexo != "M" e sexo != "F")
		          	{
		          		escreva("Entrada inválida: digite M ou F para o sexo do(a) hóspede. \n")
	          			escreva("Informe o nome do(a) hóspede: \n")
			          	leia(nome)
			          	escreva("Informe o sexo do(a) hóspede (M ou F): \n")
			          	leia(sexo)
		          	}
		          	se(sexo == "M")
		          	{
		          		vetorNomeM[contadorM] = nome
		          		contadorM += 1
		          	}
		          
		          	se(sexo == "F")
		          	{
		          		vetorNomeF[contadorF] = nome
		          		contadorF += 1
		          	}
	      	}
	     escreva("Se deseja continuar digite S, caso contrário digite N \n")
	     leia(nome)
	     	enquanto(nome != "S" e nome != "N")
	     	{
	     		escreva("entrada inválida, digite uma opção válida\n")
	     		escreva("Se deseja continuar digite S, caso contrário digite N \n")
	     		leia(nome)
	     	}
		     se(nome == "N")
		     {
		     	parar = verdadeiro
		     }
		     se(nome == "S")
		     {
		     	contadorF = 0
		     	contadorM = 0
		     }
		}

		escreva("\n")
		se(contadorF > 0)
		{
			escreva("\nResultado nomes femininos\n")
		}
		para (inteiro i = 0; i < contadorF; i++)
		{
			escreva("Nome: ", vetorNomeF[i], " sexo: F\n")
		}

		se(contadorM > 0)
		{
			escreva("\nResultado nomes masculinos\n")
		}
		para (inteiro i = 0; i < contadorM; i++)
		{
			escreva("Nome: ", vetorNomeM[i], " sexo: M\n")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1063; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */