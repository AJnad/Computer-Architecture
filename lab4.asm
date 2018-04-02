# Ajay Nadhavajhala
# 2/06/2018
# Lab 4- Hands On

# Registers used:
# t0 - used to hold the remainder of a number to determine even or odd
# t1 - used to hold the loop of how many times a number needs to be added
# t2 = used to hold the sum of the numbers
# a0 - used to hold the value of what the user inputs
# v0 - syscall parameter 

.data
student_name: .asciiz    "Ajay Nadhavajhala\n"
student_id: .asciiz   "20207734\n"
prompt: .asciiz "Enter top value: "
userVal: .asciiz "You entered "
sum: .asciiz "\nSum: "

.text
	la $a0, student_name # load the addr of student_name into $a0.
	li $v0, 4         
	syscall           
	
	la $a0, student_id # load the addr of student_id into $a0.
	li $v0, 4        
	syscall           
	
	#prompt and read user inputted integer
	li $v0, 4
	la $a0, prompt
	syscall


	#read int and store in $t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	#display the integer the user entered
	li $v0, 4
	la $a0, userVal
	syscall 

	li $v0, 1
	move $a0, $t0
	syscall

	li $t1, 2 #t1 = 2
	
	# determine whether number is even or odd
	div $t0, $t1 #divide the number by 2 
	mfhi $t1 

	beq $t1, 1, odd # if remainder is 1, then it is odd
	sub $t0, $t0, 1 # if remainder is 0, it means it is even 
	# so we will subtract one from its number to make it odd


odd:
	li $t1, 0 # sum = 0
	li $t2, 1 # the starting number for every sum will be 1

loop:
	bgt $t2, $t0, exit # if current number is > than topVal, exit loop
	add $t1, $t1, $t2 
	add $t2, $t2, 2 # add 2 every time the loop passes
	b loop

exit:
	# displays the sum
	li $v0, 4
	la $a0, sum
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall

	#exit
	li $v0, 10
	syscall






