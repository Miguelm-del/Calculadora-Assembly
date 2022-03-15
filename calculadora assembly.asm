######## Atividade assembly ########
#  
#  
#  Sistemas de informa��o - IFAL (2� Periodo)
#  Prof. Fernando Antonio Guimar�es Ten�rio 
#
#  Trabalho: Em grupo, voc�s devem construir uma calculadora que realize as seguintes opera��es:
#
#	Soma;
#	Subtra��o;
#	Multiplica��o;
#	Divis�o;
#	Raiz quadrada;
#
#
#	O programa deve utilizar TODOS os conceitos vistos em aula;
#	Acr�scimo de opera��es ser� um diferencial.
#	Todo o c�digo deve estar comentado.
#
#
# 
#    
#  
#   
#   
#   
#   
#   
#    
#    
#

.data
# Texto do uso no total para a calculadora:

resultado: .asciiz "\n= " #- String
imp1:      .asciiz "\nImpute um numero: " #- String
imp2:      .asciiz "\nImpute dois numeros:\n" #- String
vir_:      .asciiz ", " #- String
pular:     .asciiz "\n" # \n Pular linha / Quebra de linha / Espa�amento para organiza��o


potenciap:    .asciiz "\nEscreva a base e o expoente, respectivamente:\n" # Texto para a opera��o de pot�ncia - String

dividendod:  .asciiz "\nEscreva o dividendo: " # Textos para a opera��o de divis�o - String
divisor:     .asciiz "Escreva o divisor: "
resto:       .asciiz "resto dessa divis�o: "
quociente:   .asciiz "\nquociente: "

#Principal Menu  - Mensagem Erro

menu_txt:     .asciiz "\n 1. Soma\n 2. Subtra��o\n 3. Multiplica��o\n 4. Divis�o\n 5. Raiz quadrada \n 6. Pot�ncia \n 7. Fatorial \n 8. Finalizar o programa\n" # Texto do menu para o usuario #- String

invalida_msg: .asciiz "Valor imputado invalido!!!" # Caso escreva um valor de op��o que nao esteja apresente msg de erro: #- String

.text


#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-MENU=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#======================MENU principal do usuario======================

menu:
	# Imprimir a mensagem de opera��es disponiveis no menu 
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, menu_txt # Carrega menu_txt em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t0, $v0 	# Guarda o valor retornado

# Op��es do menu - Jump para op��o desejada pelo usuario  #  Op��es possiveis digitada pelo usuario  = $t0 
							  # Fazer a separa��o e escolha da opera�ao respectivamente imputado pelo usuario = $t1 
opcoes_usuario:
	
	li $t1, 1
	beq $t0, $t1, soma          # Se o usuario da calculadora escolher a op��o 1, entao ser� feito um jump para soma ( fazendo assim a soma dos valores) t0 = 1
	li $t1, 2
	beq $t0, $t1, subtracao     # Se o usuario da calculadora escolher a op��o 2, entao ser� feito um jump para subtracao ( fazendo assim a subtracao dos valores) t0 = 2
	li $t1, 3
	beq $t0, $t1, multiplicacao # Se o usuario da calculadora escolher a op��o 3, entao ser� feito um jump para multiplica��o ( fazendo assim a multiplica��o dos valores) t0 = 3
	li $t1, 4
	beq $t0, $t1, divisao       # Se o usuario da calculadora escolher a op��o 4, entao ser� feito um jump para divis�o ( fazendo assim a divis�o dos valores) t0 = 4
	li $t1, 5
	beq $t0, $t1, raiz          # Se o usuario da calculadora escolher a op��o 5, entao ser� feito um jump para raiz ( pritando assim a raiz do valor) t0 = 5
	li $t1, 6
	beq $t0, $t1, potencia      # Se o usuario da calculadora escolher a op��o 6, entao ser� feito um jump para potencia ( pritando assim a potencia do valor) t0 = 6
	li $t1, 7
	beq $t0, $t1, fatorial      # Se o usuario da calculadora escolher a op��o 7, entao ser� feito um jump para fatorial ( pritando assim o fatorial do valor) t0 = 7 
	li $t1, 8
	beq $t0, $t1, encerrar      #Se o usuario da calculadora escolher a op��o 8, Finalizara o programa t0 = 8
	

	# Caso seja um valor que n�o esteja no menu
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, invalida_msg # Carrega invalida_msg em a0
	syscall # Executa chamada de sistema

	j menu #Voltar ao menu


#=========================== Opera��es Aritimetricas - Calculadora Assembly===========================#


# Soma (+) 
#
# Soma dois numeros inteiros imputados e apresenta o resultado 


soma:
	# Imprime a mensagem de entrada de dois valores
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, imp2 # Carrega imp2 em a0
	syscall # Executa chamada de sistema

	# Ler primeiro valor imputado usuario
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t0, $v0 	# Guarda o valor retornado

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t1, $v0 	# Guarda o valor retornado

	
	add $t0, $t0, $t1 #  soma $t0 = $t0 + $t1

	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resultado # Carrega resultado em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t0 	# Guarda o valor retornado
	syscall # Executa chamada de sistema
 
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu


# Subtra��o (-)
#
#  Subtrai dois numeros inteiros imputados e apresenta o resultado 

subtracao:
	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, imp2 # Carrega imp2 em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t0, $v0 	# Guarda o valor retornado

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t1, $v0 	# Guarda o valor retornado

	
	sub $t0, $t0, $t1 # subtra��o $t0 = $t0 - $t1

	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resultado # Carrega resultado em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t0 	# Guarda o valor retornado
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu


# Multiplica��o (*)
#
#  Multiplica dois numeros inteiros imputados e apresenta o resultado 

multiplicacao:
	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, imp2 # Carrega imp2 em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t0, $v0 	# Guarda o valor retornado

	# Ler segundo valor imputado usuario
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t1, $v0 	# Guarda o valor retornado

	
	mult $t0, $t1 #  multiplic�o $t0 * $t1

	# Salvar valores contidos dos registradores 'lo' e 'hi'
	mflo $t2
	mfhi $t3



	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resultado # Carrega resultado em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t2
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu


#Divis�o
#
#  Divide dois numeros inteiros (dividendo e divisor) imputados, e apresenta o resultado   


divisao:
	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, dividendod # Carrega dividendod em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t0, $v0 	# Guarda o valor retornado

	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, divisor # Carrega divisor em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema

	
	move $t1, $v0 	# Guarda o valor retornado


	
	div $t0, $t1 # Faz a divisão $t0 / $t1

	
	mflo $t2  # Guarda quociente e do resto 
	mfhi $t3

	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, quociente # Carrega quociente em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t2 	# Guarda o valor retornado
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resto # Carrega resto em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t3 	# Guarda o valor retornado
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu





# Raiz quadrada 
#
#  Extrai a raiz quadrada de um numero inteiro positivo, e apresenta o resultado 


raiz:
	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, imp1 # Carrega imp1 em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema


	
	move $t0, $v0 	# Guarda o valor retornado

	li $t1, 0  # contador
	li $t2, 0  # auxiliar

raiz_loop:
	bgt $t2, $t0, raiz_fim  # se $t1^2 > $t0, chegou ao resultado
	addi $t1, $t1, 1        # contador++
	mul $t2, $t1, $t1       # $t2 = $t1^2
	j raiz_loop             # repete

raiz_fim:
	subi $t1, $t1, 1  # t1-- (valor anterior)

	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resultado # Carrega resultado em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t1 	# Guarda o valor retornado
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu


#----------------- OPERA��ES EXTRAS -------------------------------------------------------------------#
# 												       #
# Potencia 											       #
# Fatorial											       #
#												       #
########################################################################################################		




# Potencia (**)
#
#  Exponencias�o entre dois numeros inteiros (base e expoente), e apresenta o resultado 


potencia:

	# (base e expoente)
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, potenciap # Carrega potenciap em a0
	syscall # Executa chamada de sistema

	# Ler primeiro valor imputado usuario  - base
	li $v0, 6 # L� um float
	syscall # Executa chamada de sistema

	# Salva o valor lido
	mov.s $f1, $f0

	# Para verificar overflow
	
	mtc1 $t2, $f3       # Carrega o valor

	

	#  expoente
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema


	
	move $t0, $v0 	# Guarda o valor retornado

	# Carrega os valores ($f2 = valor acumulado, $t1 = contador)
	mov.s $f2, $f1
	li $t1, 1 # Chamada de sistema para imprimir inteiro

potencia_loop:
	beq $t1, $t0, potencia_fim  # Até contador = expoente
	mul.s $f2, $f2, $f1         # Valor acumulado *= base
	addi $t1, $t1, 1            # Contador++

	c.eq.s $f2, $f3             # Compara com o resultado obtido


	j potencia_loop             # Repete

potencia_fim:
	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resultado # Carrega resultado em a0
	syscall # Executa chamada de sistema

	li $v0, 2 #Imprime um float
	mov.s $f12, $f2
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu


# Fatorial
#
#  Fatorial de um numero inteiro positibo, e apresenta o resultado 


fatorial:
	
	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, imp1 # Carrega imp2 em a0
	syscall # Executa chamada de sistema

	
	li $v0, 5 #Chamada de sistema para ler inteiro
	syscall # Executa chamada de sistema


	# Carrega  v0 em a0 e faz o jump para fat, onde se calcula o fatorial
	move $a0, $v0 	# Guarda o valor retornado
	jal fat


	move $t0, $v0 	# Guarda o valor retornado

	

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, resultado # Carrega resultado em a0
	syscall # Executa chamada de sistema

	li $v0, 1 # Chamada de sistema para imprimir inteiro
	move $a0, $t0 	# Guarda o valor retornado
	syscall # Executa chamada de sistema

	li $v0, 4 #Chamada de sistema para imprimir string
	la $a0, pular # Carrega pular em a0
	syscall # Executa chamada de sistema

	
	j menu #Voltar ao menu



# Fat ( FATORIAL) 
#  Faz o calculo do fatorial do inteiro contido em a0 e manda para v0 Calcula (de forma recursiva) o valor do fatorial do inteiro em $a0 e retorna
#  em $v0
#
#  Componentes : a0 - Numero imputado pelo usuario para calcular o seu fatorial
#                v0 - Valor do fatorial que foi calculado


fat:
	addi $sp, $sp, -8   # Move o ponteiro da pilha
	sw $a0, 0($sp)      # salva o valor de $a0
	sw $ra, 4($sp)      # Guarda o valor de $ra

	beqz $a0, fat_retorna_1  # Verifica condição de parada
	addi $a0, $a0, -1        # Carrega em $a0 o elemento anterior
	jal fat                  # Chamada recursiva: fat(n-1)
	addi $a0, $a0, 1         # Restaura o valor original
	mul $v0, $v0, $a0        # Realiza multiplica��o
	j fat_fim                # Pula para o fim (ignora fat_retorna_1)

fat_retorna_1:
	li $v0, 1  # na condi��o de parada n = 0 ,retorna 1  # Chamada de sistema para imprimir inteiro

fat_fim:
	lw $ra, 4($sp)    # restaura valor de $ra
	lw $a0, 0($sp)    # restauro valor de $a0
	addi $sp, $sp, 8  # move de volta o ponteiro da pilha
	jr $ra            # retorna

#---------------------FINAL PROGRAMA----------------------########################
# Encerrar (X)
#
#  Encerra o programa


encerrar:
	li $v0, 10 #  Encerra o programa
	syscall # Executa chamada de sistema


##################################################################################
