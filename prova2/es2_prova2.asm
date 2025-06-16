.data

array:	.word 0, 1, 4, 2, 7, 8, 4, 6

.text

	addi $s0, $zero, 1 # ord_c = 1
	addi $s1, $zero, 1 # ord_sc = 1 
	addi $s2, $zero, 0 # i = 0
	
	addi $t0, $zero, 0 # addr per prendere il primo elemento di array
	addi $t1, $zero, 7 # limite del while
	
	lw $t2, array($t0) # array[i] in $t2
	
	
loop:
	beq $s2, $t1, endloop # while (i < 7) -> jump endloop
	
	#per avere l'indirizzo successivo dell'array ho bisogno di addr * 4
	sll $t0, $s2, 2 # shift left di due bit = * 4
	
	lw $t3, array($t0) # array[i+1] in $t3
	
	slt $t4, $t3, $t2
	beq $t4, $zero, label0
	
	add $s0, $zero, $zero # arr[i+1] < arr[1] -> ord_c = 0
	 
label0:
#ormai ho verificato se il numero è crescente, per vedere se è strettamente crescente
#devo verificare se il numero che ho e il successivo sono uguali
	seq $t4, $t3, $t2 
	beq $t4, $zero, label1
	add $s1, $zero, $zero # se sono $t2 = $t3 allora ord_sc = 0
	
label1:
#qui ho terminato tutta la logica, aggiorno la i = i+1
# e dico che $t2 = $t3

	addi $s2, $s2, 1 # i = i+1
	add $t2, $t3, $zero # copio arr[i+1] in arr[i]
	#per evitare una lw al ciclo successivo
	j loop
	
	
endloop:
	#termino esecuzione
	addi $v0, $zero, 1
	syscall