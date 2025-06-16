.text

	addi $s0, $zero, 47 # a = 47
	addi $s1, $zero, 4 # b = 4
	
	add $a0, $s0, $zero # argomento P = a
	add $a1, $s1, $zero # argomento n = b
	
	jal ror
	
	add $s2, $v0, $zero # v = ritorno funzione
	j exit
	
ror:
#gestione dello stack
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	
	addi $s0, $zero, 32
	sub $s0, $s0, $a1 # 32 - n in $s0
	
	sllv $s0, $a0, $s0 # q = p << (32-n)
	
	srlv $s1, $a0, $a1 # p = p >> n
	
	or $v0, $s1, $s0 # ricompongo il risultato
	
	
	#ristoro lo stack
	lw $ra, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	
	jr $ra
	
	
exit:
	add $a0, $s2, $zero
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $v0, 10
	syscall
	