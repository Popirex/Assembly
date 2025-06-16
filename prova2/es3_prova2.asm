.data


.text

	addi $s0, $s0, 7 # a = 7 in $s0
	addi $s1, $s1, 4 # b = 4 in $s1
	addi $s2, $s2, 4 # c = 4 in $s2
	addi $s3, $s3, 2 # d = 2 in $s3
	
	addi $a0, $s0, 0 # salvo il primo argomento della funzione
	addi $a1, $s1, 0 # salvo il secondo argomento della funzione
	addi $a2, $s2, 0 # salvo il terzo argomento della funzione
	addi $a3, $s3, 0 # salvo il quarto argomento della funzione
	
	jal dist
	
	addi $s4, $v0, 0
	
	j exit ## salto a exit incodizionatamente per stampare l'output
	#e terminare il programma
	
	
	
dist:
	addi $sp, $sp, -16	#libero spazio nello stack
	sw $s0, 0($sp) 	#tengo traccia di $s0 in posizione 0 dello stack
	sw $s1, 4($sp)	#tengo traccia di $s1 in posizione 4 dello stack
	sw $s2, 8($sp)	#tengo traccia di $s2 in posizione 8 dello stack
	sw $ra, 12($sp) # salvo anche $ra perche per le funzioni ricorsive è necessario 
	#ed è buona pratica farlo
	
	add $s0, $a0, $a1 # a + b
	sub $s1, $a2, $a3 # c - d
	sllv $s2, $a1, $a3 # b << d
	srlv $s0, $s0, $s1 # (a+b) >> (c-d)
	add $v0, $s0, $s2 # ((a+b) >> (c-d)) + (b << d)
	
	#ho salvato in $v0 questo risultato perche sarebbe il valore di ritorno della funzione, ora posso liberare la memoria
	
	#ricordo la regola last in, first out#
	lw $ra, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 16
	
	#dopo che ho liberato lo spazio posso tornare alla funzione
	
	jr $ra 	#ritorno al chiamante



exit:
#	Da ricordarsi di usare la li per salvare il codice della syscall
#	in $v0 poiche con addi ci potrebbero essere errori
#
	addi $a0, $s4, 0
	li $v0, 1
	syscall
	li $v0, 10
	syscall