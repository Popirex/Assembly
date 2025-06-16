#definizione dati statici.
.data

#definizione comandi programma
.text

main:

	li $a0, 4
	jal fib
	move $a0, $v0
	li $v0, 1
	syscall


#per terminare il programma
	li $v0, 10
	syscall

fib:

	bgt $a0, 1, ricorsiva
	move $v0, $a0
	jr $ra
	
	
	


ricorsiva:

#siccome è ricorsiva, mi devo salvare i valori di $ra e $a0, perche se no alla seconda chiamata ricorsiva avro perso tutti i valori
	sub $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	#calcolo fib(n-1)
	addi $a0, $a0, -1
	jal fib
	
	#salvo il valore di $v0 nella memoria in modo da non perderlo
	sw $v0, 8($sp)
	
	#calcolo fib(n-2)
	lw $a0, 4($sp)
	addi $a0, $a0, -2
	jal fib
	
	#carico il primo risultato della funzione e poi li sommo assieme
	lw $t0, 8($sp)
	add $v0, $v0, $t0
	
	#ora siccome devo uscire dalla fuzione devo prima recuperare tutto cio che ho salvato nello stack
	
	lw $ra 0($sp)
	addi $sp, $sp, 12
	jr $ra
	




