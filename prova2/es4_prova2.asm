.text

	addi $s0, $zero, 9 # x = 9
	addi $s1, $zero, 6 # y = 6
	addi $s2, $zero, 0 # w = 0
	
	and $t0, $s0, $s1
	beq $t0, $zero, label0
	addi $s2, $s2, 1 # se x & y -> w = 1
	j label1
	
label0:

	#per il logical and basta verificare che #
	beq $s0, $zero, label1
	beq $s1, $zero, label1
	addi $s2, $s2, 2 
	
label1: