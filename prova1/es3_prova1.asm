.text
	addi $s0, $zero, 7 # x = 7 in $s0
	addi $s1, $zero, 4 # y = 4 in $s1
	
	#carico gli argomenti della funzione in $a0 e $a1#
	addi $a0, $s0, 0 # a = x
	addi $a1, $s1, 0 # b = y
	jal dist
	
	addi $s2, $v0, 0 # salvo il valore di ritorno delal funzione in $s2
	
	#salto alla fine
	j exit


dist:
	#libero lo spazione nello stack
	addi $sp, $sp, -8
	sw $t0, 0($sp) # carico il primo argomento nello stack
	sw $t1, 4($sp) # carico il secondo argomento nello stack
	
	slt $t0, $a1, $a0 # b < a -> $t0 = 1
	beq $t0, $zero, label
	#se a > b
	sub $t1, $a0, $a1 # a - b
	j end
	
label:
	sub $t1, $a1, $a0 # return b - a se b > a
	
end: 
	addi $v0, $t1, 0 # salvo il valore di ritorno in $v0
	
	#carico di nuovo gli argomenti e ripristino lo stack
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	addi $sp, $zero, 8
	jr $ra
	
	
	

exit: 
	addi $a0, $v0, 0 # salvo il valore di ritorno della funzione in $a0
	addi $v0, $zero, 1 # imposto $v0 a 1 per stampare interi
	syscall
	
	addi $v0, $zero, 10 # imposto $v0 a 10 per terminare il programma
	syscall