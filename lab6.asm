# Ajay Nadhavajhala
# 2/27/2018
# Lab 6- Hands On: MIPS Arithmetic; Exceptions and Exception Handlers
# This program will compute the sum of (1*2)+(2*3)+...(10*11) 
# through the use of the hi and lo register. In this program, 
# we only make use of the low register. 


# Registers used:
# a0 - holds the student's last name and student id
# t0 - holds the value of the computed sum
# s1 - holds value of 1
# s2 - holds value of 2
# s3 - place holder for n
# v0 - syscall parameter 
# sp - refers to stack pointer
# t0 - holds the value of every subsequent number
# t1 - holds the sum of the total value

.data 
	student_name: .asciiz    "Ajay Nadhavajhala\n"
	student_id: .asciiz   "20207734\n"
.text 
	la $a0, student_name # load the addr of student_name into $a0.
	li $v0, 4         
	syscall           
	
	la $a0, student_id # load the addr of student_id into $a0.
	li $v0, 4        
	syscall 
	
	# assigning s1 and s2 registers values of
	# 1 and 2
	addi $s1,$zero,1
	addi $s2,$zero,2
	
	#s3 is a place holder for every subsequent 
	# value that comes after 2
	add $s3,$zero,$zero
	
	# goes up to 11
	addi $t0,$zero,11

loop:
	# multiply the first two values (1*2)
	mult $s1,$s2
	
	# the t1 lo register will hold the sum
	mflo $t1
	add $s3,$s3,$t1
	
	#increment by one
	addi $s1,$s1,1
	addi $s2,$s2,1
	
	#loop until it hits 11
	bne $s1,$t0,loop
	li $v0,1
	move $a0,$s3
	
	# print the sum
	syscall



		
	



	
	
	
