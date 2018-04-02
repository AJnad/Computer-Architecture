# Ajay Nadhavajhala
# 1/21/2018
# Lab 2- Hands On: Hello World in MIPS
# This program will output various syscall statements 


	.data
hello_msg: .asciiz    "Hello World!\n"
last_name: .asciiz    "Nadhavajhala\n"
student_id: .asciiz   "20207734\n"
syllabus1: .asciiz     "A prereq. to this course includes: CS1A, 2A, or 3A.\n"
syllabus2: .asciiz     "You need to achieve at least a 93% to earn an A grade.\n"
syllabus3: .asciiz     "By the end of the course, a student will know how to write system calls.\n"


	.text
main:
	la $a0, hello_msg # load the addr of hello_msg into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	la $a0, last_name # load the addr of last_name into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	la $a0, student_id # load the addr of student_id into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	la $a0, syllabus1 # load the addr of syallbus1 into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	la $a0, syllabus2 # load the addr of syllabus2 into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	la $a0, syllabus3 # load the addr of syllabus3 into $a0.
	li $v0, 4         # 4 is the print_string syscall.
	syscall           # do the syscall.
	
	
	li $v0, 10        # 10 is the exit syscall.
	syscall           # do the syscall
