
.text

	addi $s0, $zero, 4 # a = 4 in $s0
	addi $s1, $zero, 10 # b = 10 in $s1
	addi $s2 $zero, 8 # c = 8 in $s2
	addi $s3, $s2, 0 # x = c in $s3
	
	
	slt $t0, $s1, $s0 # $t0 = 1 se b < a
	slt $t1, $s2, $s0 # $t1 = 1 se c < a
	
	
	and $t2, $t0, $t1 # (b < a) && (c < a)
	
	bne $t2, $zero, label0 #vado a label0 se a è il maggiore
	
	slt $t3, $s2, $s1 # $t3 = 1 se c < b
	beq $t3, $zero, exit
	
	#se b è il piu grande
	addi $s3, $s1, 0 # x = b
	
	j exit # salto alla exit
	
	
	
	
	
label0:
	addi $s3, $s0, 0 # x = a
	
	
exit:

#stampo il numero piu grande#
	addi $a0, $s3, 0 # $a0 = x per stampare il risultato
	addi $v0, $zero, 1 # $v0 = 1 per stampare un intero
	syscall
	
#esco dal programma#
	addi $v0, $zero, 10
	syscall
	

