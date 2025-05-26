.data

array: .word 0, 1, 4, 2, 7, 8, 4, 6 # salvo l'array con l'etichetta 'array'

.text

	addi $s0, $zero, 4 # i = 1
	lw $s1, array($zero) # x = array[0]
	addi $t0, $zero, 32 # dimensione massima dell'array
	
	#in ogni caso devo entrare nel while
loop:
	beq $s0, $t0, exit # se i = 32 salto a exit
	
	lw $t1, array($s0) # $t1 = array[i]
	
	slt $t2, $s1, $t1 # $t2 = 1 se x < array[i]
	beq $t2, $zero, label # se x >= array[i] -> i+=4
	
	addi $s1, $t1, 0 # x = array[i]
	
	
	
	
label: 
	addi $s0, $s0, 4 # i += 4
	j loop
	
exit:
	addi $a0, $s1, 0 # salvo in $a0 il numero piu grande
	addi $v0, $zero, 1 # imposto $v0 per stampare un intero
	syscall
	
	addi $v0, $zero,10 # imposto $v0 per terminare il programma
	syscall
	
	
	
	