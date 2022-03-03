	.data
msg:	.asciiz "The Random odd Number is:"
	.text
	
	jal GenOdd
	move $t2,$a0 
	
	la $a0,msg
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall

	li $v0,10
	syscall
	
GenOdd: 
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t0,0 # put the odd number here
	
	# genereate random number [1,99]
	li $v0,42
	li $a1,99
	syscall
	addi $a0,$a0,1

	jal checkodd 
	
	beq $0, $v0,repeat
	j end
repeat: 
	jal GenOdd

end:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
checkodd:  
	li $t0, 2
	div $a0, $t0
	mfhi $t0
	beq $t0, $0, return
	li $v0, 1
	jr $ra
return:	li $v0, 0
	jr $ra
	
	

	
