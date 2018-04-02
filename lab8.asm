# Ajay Nadhavajhala
# 3/13/18
# Lab 8- Hands On: Multitasking and Context Switching; Pipelining
# This program shows a data hazard. The hazard shown is t0 is not 
# available for forwarding because the instruction "lw" must reach 
# the MEM stage. However, the instruction add makes fowarding no 
# longer possible as it has reached the EX stage. This creates a 
# read-after-write data hazard. 


#  Registers used:
# a0 - holds the student's last name and student id
# v0 - syscall parameter 
# t0 - holds the value of every subsequent number
# t1 - holds value of t1
# t2 - holds the sum of the total value

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

	# RAW data hazard- Explanation found in comment header
	lw $t0, 0($t1) 
	add $t2, $t0, $t1 
	