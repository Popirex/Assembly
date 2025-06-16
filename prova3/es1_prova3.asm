.text

	addi $s0, $zero, 16 # x = 16
	addi $s1, $zero, 0 # y = 0
	addi $s2, $zero, 0 # p = 0
	addi $s3, $zero, 0 # i = 0
	
	addi $t0, $zero, 32 # limite while
	
loop:
	beq $s3, $t0, exit # se i = 32 salto a exit
	
	andi $t1, $s0, 1 # x & 1 -> $t1
	
	add $s1, $s1, $t1 # y = y + $t1
	
	addi $s3, $s3, 1 # i = i +1 
	j loop
	
	
exit:

	andi $s2, $s1, 1 # p = y % 2
	
	add $a0, $s2, $zero
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall
