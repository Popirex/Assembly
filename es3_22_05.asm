.data

.text

main:

	addi $s0, $zero, 19 # x = 7
	addi $s1, $zero, 4 # y = 4
	addi $s3, $zero, 0 # inizializzo risultato
	
	addi $a0, $s0, 0 # a = x;
	addi $a1, $s1, 0 # b = y
	jal dist	#dist(a, b)
	
	addi $s2, $v0, 0 # salvo il valore di ritorno in $s2

	
	
	
exit: 

	#stampo la distanza
	
	addi $a0, $s2, 0 # salvo in $a0 la distanza
	addi $v0, $zero, 1 # imposto $v0 = 1 per stampare un numero
	syscall

	#termino il programma
	addi $v0, $zero, 10
	syscall
	
dist:
	addi $sp, $sp, -8
	
	sw $t0, 0($sp) # salvo $t0 sullo stack
	sw $t1, 4($sp) # salvo $t1 sullo stack
	
	slt $t0, $a1, $a0 # b < a -> $t3 = 1
	beq $t0, $zero, else # se b > a -> b-a
	
	sub $t1, $a0, $a1 # a - b
	
	j ritorno
	
else:
	sub $t1, $a1, $a0 # b - a
	
ritorno:
	addi $v0, $t1, 0 # salvo il valore di ritorno in $v0
	
	#LIBERO SPAZIO DALLA MEMORIA E TORNO ALLA CHIAMATA#
	lw $t0, 0($sp) # recupero $t0 dallo stack
	lw $t1, 4($sp) # recupero $t1 dallo stack
	addi $sp, $sp, 8 # dealloco lo spazio dallo stack
	
	jr $ra # ritorno al chiamante

	