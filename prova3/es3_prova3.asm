.data

array: .word 0,1,2,3,4,5,6,7



.text

	#definisco le variabili
	addi $s0, $zero, 6 # elem = 6
	addi $s1, $zero, 8 # n = 8 -> dim vettore
	addi $s2, $zero, -1 # found = -1 
	srl $s3, $s1, 1 # i = n/ 2
	addi $s4, $zero, 0 # low = 0
	addi $s5, $s1, -1 # up = n -1 
	
	#inizio del while#
loop:
	#verifica condizioni
	slt $t0, $s2, $zero
	beq $t0, $zero, exit
	beq $s4, $s5, exit
	
	sll $t1, $s3, 2 # indice * 4 per avere posizione word nell'array
	
	lw $t1, array($t1) # carico arr[i]
	
	bne $t1, $s0, else # if(arr[i]==elem)
	add $s2, $s3, $zero # found = i
	j endloop
	
else:
	slt $t2, $s0, $t1 
	beq $t2, $zero, else1
	add $s5, $s3, $zero # up = i
else1:
	add $s4, $s3, $zero # low = i
	
endloop:
	add $t3, $s4, $s5
	srl $s3, $t3, 1 # i = (up+low)/2
	j loop
	
exit:
#fine del programma

	addi $a0, $s2, 0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall