	.data
prompt: .asciiz "Please Enter a Number"
yes:	.asciiz "Yes It is divisible by 7"
no:	.asciiz "No it is not divisble by 7 "

	.text
	
main: 
	la $a0,prompt
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0 # random number is in $t0
	
check: 
	li $t1,7
	div $t0,$t1 
	mfhi $t0
	
	beq $t0,$0,YES
	la $a0,no
	j display
	
YES: 
	la $a0,yes
	
display: 
	li $v0,4
	syscall 
	
	
	li $v0,10
	syscall
