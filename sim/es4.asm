.text

	addi $s0, $zero, 9 # x = 9
	addi $s1, $zero, 6 # y = 6
	addi $s2, $zero, 0 # w = 0
	
	and $t0, $s0, $s1
	beq $t0, $zero, else
	
	addi $s2, $zero, 1 # w = 1
	j, exit
	
else:
	beq $s0, $zero, exit
	beq $s1, $zero, exit
	addi $s2, $zero, 2 # w = 2
	
	
	
exit:

	addi $a0, $s2, 0 
	li $v0, 1
	syscall
	
	 li $v0, 10
	 syscall 