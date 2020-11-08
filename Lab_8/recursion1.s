	.data
ask:	.asciiz "Please enter a number: "

	.text

main: 
addi $sp, $sp, -4 # make room on the stack for local variables
li $v0, 4 # syscall 4 prints out "please enter a number"
la $a0, ask
syscall 
li $v0, 5 # syscall 5 prompts user input
syscall 
move $a0, $v0 # moves user input into $a0 (for argument to recursion function)
move $v0, $zero # $v0 = 0 (for return value later)
jal recursion
sw $v0, 0($sp) 
lw $a0, 0($sp)	
li $v0, 1		 
syscall			
j end

recursion:
addi $sp, $sp, -12 # makes room in stack for 3 words (return addresses)
sw $ra, 8($sp) # stores return address back to main in the stack
addi $t0, $zero, 10
bne $t0, $a0, notTen # checks if input = 10
addi $v0, $v0, 2 # return 2
j finishRecursion

notTen:
addi $t0, $zero, 11
bne $t0, $a0, notEleven
addi $v0, $v0, 1 # return 1
j finishRecursion

notEleven:	
sw $a0, 4($sp) 	
addi $a0, $a0, 2 # m = m + 2
jal recursion # Call recursion(m + 2)
lw $a0, 4($sp) # return back
addi $a0, $a0, 1 # m = m + 1
jal recursion # Call recursion(m + 1)
lw $a0, 4($sp) # return back
add $v0, $v0, $a0 # adds recursion(m + 2) + m + recursion(m + 1) 
j finishRecursion

finishRecursion: 
lw $ra, 8($sp) # retrieve value for program to return to main
addi $sp, $sp, 12
jr $ra

end:
addi $sp, $sp, 14
li $v0, 10
syscall