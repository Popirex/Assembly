.data
#definisco array#
array: .word 0,1,2,4,4,5,6,9


#se output e' -1, numero non trovato#
.text

	addi $s0, $zero, 6 # elem = 6
	addi $s1, $zero, 8 # n = 8
	addi $s2, $zero, -1 # found = - 1 
	srl $s3, $s1, 1 # i = n/2
	addi $s4, $zero, 0 # low = 0
	addi $s5, $s1, -1 # up = n - 1
	
#inizio il loop#
while:
	#verifico prima condizione#
	slt $t0, $s2, $zero
	beq $t0, $zero, exit
	#verifico seconda condizione#
	beq $s4, $s5, exit
	

	#inzio logica while#
	sll $t0, $s3, 2 # i*4 per arr[i] corretto
	
	lw $t1, array($t0) # arr[i]
	
	bne $t1, $s0, else0 # primo if
	
	addi $s2, $s3, 0 # found = i
	
	j endwhile # salto a endloop
	
	
else0:

	
	
	slt $t0, $s0, $t1 # elem < arr[i]
	beq $t0, $zero, else1
	
	addi $s5, $s3, 0 # up = i
	j endwhile
	
else1:
	addi $s4, $s3, 0 # low = i
	
endwhile:

	add $t0, $s4, $s5 # up + low
	srl $s3, $t0, 1 # i = (up+low)/2
	j while # torno al while
	
	
exit:
	#stampo found#
	addi $a0, $s2, 0
	li $v0, 1
	syscall
	
	#termino il programma#
	li $v0, 10
	syscall
	

