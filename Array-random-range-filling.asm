	.data
arr: 		.space 40
length:		.word  10
space: 		.asciiz " "

	.text
main:

	#int arr[] 
	lw $s0,length
	la $s1,arr
	# int i=0;
	li $t0,0
	# int j=0;
	li $t1,0 
	
loop: 
	#random number range[11-100]
	li $v0,42 
	li $a1,10
	syscall
	addi $a0,$a0,10
	
	# save random number into index in arr
	sw $a0,0($s1)
	# increment i++ every time we add a number into the array
	addi $t0,$t0,1
	# increment index in the array arr[x]
	add $s1,$s1,4
	# if i<n keep looping 
	slt $t1,$t0,$s0 
	bne  $t1,$0,loop
	
	la $s1,arr
	
display: 
	lw $s2,0($s1)
	addi $t1,$t1,1
	add $s1,$s1,4
	# display
	move $a0,$s2
	li $v0,1
	syscall
	li $v0,4 
	la $a0,space
	syscall
	slt $t2,$t1,$s0
	bne $t2,$0,display
	
	li $v0,10
	syscall
	
