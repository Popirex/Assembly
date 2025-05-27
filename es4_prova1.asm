.text


main:
	addi $s0, $zero, 7 # x = 18
	addi $s1, $zero, 0 # y = 0
	addi $s2, $zero, 0 # n = 0
	addi $s3, $zero, 0 # i = 0
	addi $t0, $zero, 32 # limite del loop
	
	
loop:
	beq $s3, $t0, exit # se i = 32 termino il programma
	
	andi $s1, $s0, 1 # y = x & 1
	add $s2, $s2, $s1 # n = n + y
	srl $s0, $s0, 1 # x = x >> 1
	addi $s3, $s3, 1 # i = i + 1
	
	j loop # torno all'inizio di loop
	
	
	
exit:

	#voglio stampare il risultato
	addi $a0, $s2, 0 # salvo in $a0 il valore di n
	
	addi $v0, $zero, 1 # preparo $v0 per stampare
	syscall


	# TERMINO IL PROGRAMMA
	addi $v0, $zero, 10
	syscall