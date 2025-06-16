#Programma che calcola il prodotto di due numeri naturali in una CPU a 32 bit priva di moltiplicatore.#



.text

main:
	addi $s0, $zero, 16 # x = 16 in $s0
	addi $s1, $zero, 18 # y = 18 in $s1
	addi $s2, $zero, 0 # p = 0 in $s2
	
	
	addi $t0, $zero, 0 # i = 0 in $t0
	addi $t1, $zero, 32 # limite del while
	
loop:
	beq $t0, $t1, exit
	
	andi $t2, $s1, 1 # tmp = y & 1
	beq $t2, $zero, else
	add $s2, $s2, $s0 # p = p + x

else:  

	srl $s1, $s1, 1 # y = y >> 1
	sll $s0, $s0, 1 # x = x << 1
	addi $t0, $t0, 1 # i = i + 1
	j loop # torno a loop per verificare che i < 32
	
	
exit:
	addi $a0, $s2, 0 # salvo in $a0 il valore della moltiplicazione
	addi $v0, $zero, 1 # imposto $v0 per stampare un intero
	syscall
	
	addi $v0, $zero, 10 # imposto $v0 per terminare il programma
	syscall
	
	