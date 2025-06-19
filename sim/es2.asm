.data
array: .word	0,1,4,2,7,8,4,6

.text

	addi $s0, $zero, 0 # i = 0
	addi $s1, $zero, 1 # ord_c = 1
	addi $s2, $zero, 1 # ord_sc = 1
	addi $s3, $zero, 7 # limite while
	
	lw $s4, array($s0) # array[0]
	
while:
	beq $s0, $s3, exit
	
	addi $s0, $s0, 1 # i = i + 1
	
	sll $t0, $s0, 2 # i = i*4 per elementi array
	
	lw $s5, array($t0) # array[i+1]
	
	slt $t0, $s5, $s4 # array[i+1] < array[i]
	
	beq $t0, $zero, else0
	
	addi $s1, $zero, 0 # ord_c = 0
	
else0:
	bne $s4, $s5, else1
	
	addi $s2, $zero, 0 # ord_sc = 0
	
else1:

	add $s4, $s5, $zero # arr[i] = arr[i+1]
	
	j while # ritorno al while per verificare la condizione
	
	
exit:
	#termino il programma#

	li $v0, 10
	syscall
