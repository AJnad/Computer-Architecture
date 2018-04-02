# Ajay Nadhavajhala
# 2/06/2018
# Lab 5- Hands On: Calling Functions; The Stack; Recursion
# This program will take two values and find the average. 
# This procedure will be done through the implementation of
# the stack which will allow us to modify the value of a 
# register only within the procedure. 


# Registers used:
# a0 - holds the student's last name and student id
# t0 - holds the value of the computed sum
# s0 - holds value of num1 (12)
# s1 - holds value of num2 (2)
# v0 - syscall parameter 
# sp - refers to stack pointer
# t1 - used to allocate memory space
# t2 - used to allocate memory space
# ra - jump register

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
	
main:
	# using the integers 12 and 2 
	li $s0, 12
	li $s1, 2
		
	# allocating memory in the stack 
	addiu $sp, $sp, -12
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	# calls procedure to compute average 
	jal average
	
	lw $t0, ($sp)
	li $v0, 1
	move $a0, $t0
	
	# restoring memory in the stack (8+4 = 12)
	addiu $sp, $sp, 12
	li $v0, 10
	syscall

average:
	# loads the integers that are saved in the 
	# allocated memory sapce
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	
	# does the operation "12+2"
	add $t0, $t1, $t2
	
	# does the operation "14/2"
	div $t0, $t0, 2
	
	# store the value computed in the stack into $t0
	sw $t0, ($sp)
	
	jr $ra
