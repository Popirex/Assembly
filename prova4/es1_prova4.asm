.text

	#inizializzo le variabili#
	
	addi $s0, $zero, 16 # x = 16
	addi $s1, $zero, 0 # y = 0
	addi $s2, $zero, 0 # i = 0
	
	addi $t0, $zero, 32 #inizializzo il limite del while
	
loop:
	beq $s2, $t0, endloop # while(i < 32)
	
	andi $t1, $s0, 1 # x & 1
	add $s1, $s1, $t1 # y = y + (x & 1)
	
	srl $s0, $s0, 1 # x =  x/2 o x = x>>1
	
	addi $s2, $s2, 1 # i = i + 1  
	
	j loop # ritorno alla condizione del while
	
endloop:

	andi $a0, $s1, 1 # verifico la parita p = y % 2
	
	li $v0, 1
	
	syscall
	
	li $v0, 10
	syscall


	