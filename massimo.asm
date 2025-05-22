.data

	

.text

main:
	#a in $s0, b in $s1, c in $s2 e x in $s3
	addi $s0 , $zero, 4 # a = 4
	addi $s1, $zero, 10 # b = 10
	addi $s2, $zero, 8 # c = 8
	add $s3, $zero, $s2  # x = c
	
	#controllo se a > b
	slt $t0, $s1, $s0
	slt $t1, $s2, $s0
	and $t0, $t0, $t1
	#se a è minore allora salto all'else
	beq $t0, $zero, else
	
	#se a è il max lo salvo in x e salto alla fine del programma
	add $s3, $zero, $s0
	j endif
	
	
	
else:
#controllo se c è minore di b
	slt $t0, $s2, $s1
	#se non lo è salto direttamente alla fine siccome avevo salvato c come max all'inizio
	beq $t0, $zero, endifù
	#se b è il piu grande salvo x = b e poi  vado alla fine del programma
	add $s3, $zero, $s1

endif:
	
	
	add $a0, $zero, $s3
	addi $v0, $zero, 1
	syscall
	
	#terminazione del programma
	li $v0, 10
	syscall