

.text
	addi $s0, $zero, 16 # x = 16
	addi $s1, $zero, 18 # y = 18
	addi $s2, $zero, 0 # p = 0
	addi $s3, $zero, 0 # i = 0
	addi $t0, $zero, 32 # limite while
	
while:
	beq $s3, $t0, exit # while(i < 32)
	
	andi $t1, $s1, 1 # tmp = y & 1
	
	beq $t1, $zero, if # if(tmp != 0)
	
	add $s2, $s2, $s0 # p = p + x
	
if:
	
	srl $s1, $s1, 1 # y = y >> 1	-> y = y/2
	sll $s0, $s0, 1 # x = x << 1	-> x = x*2
	
	addi $s3, $s3, 1 # i = i + 1
	
	j while
	
	
exit:

	addi $a0, $s2, 0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall