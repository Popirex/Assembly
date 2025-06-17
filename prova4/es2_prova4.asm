.text

	addi $s0, $zero, 47 # a = 47
	addi $s1, $zero, 4 # b = 4
	
	#carico argomenti funzione in $a0 e $a1#
	
	addi $a0, $s0, 0 # arg1 = a
	addi $a1, $s1, 0 # arg2 = b
	
	#inizializzo funzione#
	jal ror
	
	#salvo il valore di ritorno in $a0 e salto a exit
	addi $a0, $v0, 0
	j exit
	
	
ror:
	#creo spazio nello stack#
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	addi $s0, $zero, 32 # registro con numero 32
	
	sub $s0, $s0, $a1 # (32- n)
	
	sllv $s0, $a0, $s0  #  q = p << (32-n)
	
	srlv $s1, $a0, $a1 # p = p >> n
	
	or $v0, $s0, $s1 # result = p | q
	
	#ristoro lo stack#
	lw $ra, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	
	jr $ra
	 



exit: 
	#stampo il risultato in $a0#
	li $v0, 1
	syscall
	
	#termino il programma#
	li $v0, 10
	syscall
	