# Ajay Nadhavajhala
# 1/21/2018
# Lab 3- Hands On: Instruction Set Architecture
# This program will showcase the adding, subtracting,
# multiplying, and dividing features by using the 
# length of my student ID and last name 

.data
	myID: .word 25	
	nLet: .word 12	
	family_name: .asciiz    "My family name is Nadhavajhala\n"
	student_id: .asciiz   "My student ID is 20207734\n"
	myID_val: .asciiz     "The value of my ID is 25\n"
	lastName_val: .asciiz    "The number of characters in my last name is 12\n"


# expression1: nLet + myId
# expression2: myID - nLet
# expression3: nLet * 4
# expression4: (nLet + myID) / 2 

.text

	li $s0, 25
	li $s1, 12
	
	la $a0, family_name # load the addr of hello_msg into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	
	la $a0, student_id # load the addr of hello_msg into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	
	la $a0, myID_val # load the addr of hello_msg into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	
	la $a0, lastName_val # load the addr of hello_msg into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	
	
	# expression1 (ADDING)
	add $t1, $s0, $s1	# $t1 = $t0 + $t1
	li $v0, 1
	move $a0, $t1
	
	
	
	
	#expression2 (SUBTRACTING)
	sub $t2, $s0, $s1	# $t2 = $s0 - $s1
	li $v0, 1
	move $a0, $t2
	
	
	
	# expression3 (MULTIPLICATION)
	mul  $t3, $s1, 4	# $t3 = $s1 * 4
	li $v0, 1
	move $a0, $t3
	
	
	
	# expression4 (DIVISION)
	andi $t4, $t1 2
	div $t4, $t1, 2		# $t4 / 2
	li $v0, 1
	move $a0, $t4
	
	

	
	
