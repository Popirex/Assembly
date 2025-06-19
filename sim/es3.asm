.text


	addi $s0, $zero, 7 # a = 7
	addi $s1, $zero, 4 # b = 4
	addi $s2, $zero, 4 # c = 4
	addi $s3, $zero, 2 # d = 2
	
	
	#carico argomenti della funzione#
	add $a0, $s0, $zero
	add $a1, $s1, $zero
	add $a2, $s2, $zero
	add $a3, $s3, $zero
	
	jal dist
	
	addi $s4, $v0, 0 # salvo il ritorno della funzione in $s4
	
	j exit
dist:
	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	
	add $s0, $a0, $a1 # a + b
	sub $s1, $a2, $a3 # c - d
	srlv $s0, $s0, $s1 # (a + b) >> (c - d)
	sllv $s1, $a1, $a3 # b << d
	
	add $s2, $s0, $s1 # sommo tutto assieme
	
	addi $v0, $s2, 0 # salvo per ritornare questo valore
	
	
	#ristoro stack#
	
	lw $ra, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	
	addi $sp, $sp, 16
	
	jr $ra
	
	
exit: 
	addi $a0, $s4, 0 # salvo il valore di ritorno in a per stamparlo
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall