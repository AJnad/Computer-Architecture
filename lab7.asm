# Ajay Nadhavajhala
# 3/6/18
# Lab 7- Hands On: An Example Exception Handler; MIPS Processor Basics
# This program is an exception handler in which it will handle any
# errors that invokes this program. Specfically, w8zerodivideAN will
# have a divide-by-zero error and this program will be used to handle
# that exception

# PLEASE NOTE! Credit to James Larus as there are parts of code that were
# directly used and influenced by his code in commented_trap_handler.asm

# Registers used:
# $12 - status register
# $13 - cause register
# $14 - EPC register
# $k0 - kernel register
# $k1 - kernel register
# $v0 - syscall parameter and return value
# $a0 - syscall parameter


.data
	addressError:	.asciiz	"Exception caused by instruction at Address: "
	errorCode:	.asciiz	"\nException Code = "
	ignoreMsg:	.asciiz	"\nIgnore and continue program.\n"	

.kdata
	_regs:	.word 0:4				

#code for all exceptions start at 0x80000180
.ktext 0x80000180

	# Save $at, $v0, and $a0
	move $k0, $at                           # $k0 = $at
	la $k1, _regs
	sw $a0, 0($k1)                          # save $a0 & v0
	sw $v0, 4($k1)                          

	# prints address of where the exception takes place
	li $v0, 4                # syscall 4 (print_str)
	la $a0, addressError
	syscall

	li $v0, 34              	# syscall 1 (print_int)
	mfc0 $a0, $14            # Address
	syscall
		
	# prints the exception code
	li $v0, 4                # print exception code
	la $a0, errorCode
	syscall

	li $v0, 1              
	mfc0 $k0, $13           
	srl $a0, $k0, 2           
	andi $a0, $a0, 0xf
	syscall
	
	# prints the ignore message 
	li $v0, 4                # Prints exit message
	la $a0, ignoreMsg
	syscall

# Return from (non-interrupt) exception. Skip offending
# instruction at EPC to avoid infinite loop.
# CODE CREDIT TO JAMES LARUS
ret:

	mfc0 $k0, $14            # Get EPC register value
	addiu $k0, $k0, 4         # Skip faulting instruction by skipping
	                        # forward by one instruction
                          	# (Need to handle delayed branch case here)
	mtc0 $k0, $14            # Reset the EPC register

	# Restore registers and reset procesor state
	lw $a0, 0($k1)          # Restore $v0 and $a0
	lw $v0, 4($k1)          

	move $at, $k0            # Restore $at

	mtc0 $0, $13             # Clear Cause register

	mfc0 $k0, $12            # Set Status register
	ori  $k0, 0x1            # Interrupts enabled
	mtc0 $k0, $12
	eret		
