.data
array: .word 0 ,1 ,4 ,2 ,15 ,8 ,4 ,6

.text

main:
	
	add $s0, $zero, 4 #inizializzo la i = $s0 e la setto = 4 dato che nell'array ho salvato .word = 4 byte

	lw, $s1, array($zero) # inizializzo la x al primo elemento dell'array

	addi $t0, $zero, 32 #salvo in $t0 la dimensione dell'array
	
loop:	
	beq $s0, $t0, endloop #while( i < 8), in questo caso < 32
	
	lw $t1, array($s0)# in $t1 ho array[i]
	
	slt $t2, $s1, $t1 # $t2 = 1 se x < array[i] $t2 = 0 se x >= array[i]
	beq $t2, $zero, etichetta # se x >= array[i] salto a etichetta
	add $s1, $zero, $t1 # se no ( x < array[i]) salvo in x = array[i]
	
	
	
etichetta:
	addi $s0, $s0, 4 # i = i+ 4
	j loop # salto all'inizio del loop
	
	
	
endloop:
	
	addi $a0, $s1, 0	#salvo in $a0 = x
	addi $v0, $zero, 1	#imposto $v0 = 1 per stampare la x in $a0
	syscall #eseguo chiamata a sistema
	
	#termino il programma
	addi $v0, $zero, 10	
	syscall

