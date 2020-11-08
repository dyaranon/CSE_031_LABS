        .data
ask:    .asciiz "Enter a number: "




        .text
main: 		
addi $sp, $sp, -4 # Moving stack pointer to make room for storing local variables (push the stack frame)
# TPS 2 #3 (display statement)
li $v0, 4
la $a0, ask
syscall
		
# TPS 2 #4 (read user input)
li $v0, 5
syscall
move $a0, $v0 # $a0 = user input ($a0 used for argument to recursion functino)
move $v0, $zero # $v0 = 0

jal recursion # Call recursion(x)

# TPS 2 #6 (read user input)
sw $v0, 0($sp) #prints the final return value
lw $a0, 0($sp)	
# a0 stores input argument, v0 stores return value
li $v0, 1		 
syscall	

j end # Jump to end of program


# Implementing recursion
recursion:	
addi $sp, $sp, -12 # Push stack frame for local storage

# TPS 2 #7 
sw $ra, 8($sp) # stores value of return address onto the stack (first thing stored)

addi $t0, $a0, 1 # if $a0 is -1, then adding 1 to is will make it zero, then we can compare in the next line
bne $t0, $zero, not_minus_one # branch to 'not_minus-one' if $t0 != 0 ($a0 still same value)
		
# TPS 2 #8 (update returned value)
addi $v0, $v0, 1 # $v0 = $v0 + 1 (return 1)
		
j end_recur
			
not_minus_one:	
bne $a0, $zero, not_zero # branch to 'not_zero' if $a0 != 0

# TPS 2 #9 (update returned value)
addi $v0, $v0, 3 # return 3	
		
j end_recur		

not_zero:	
sw $a0, 4($sp) 
	
# TPS 2 #11 (Prepare new input argument, i.e. m - 2)
addi $a0, $a0, -2				
jal recursion # Call recursion(m - 2)

# TPS 2 #12 
lw $a0, 4($sp)
		
# TPS 2 #13 (Prepare new input argument, i.e. m - 1)
addi $a0, $a0, -1
		
jal recursion # Call recursion(m - 1)
		
# TPS 2 #14 (update returned value)
add $v0, $v0, $a0	
		
j end_recur
		

# End of recursion function	
end_recur:	
# TPS 2 #15 
lw $ra, 8($sp) # retrieve value for program to return to main		
addi $sp, $sp, 12 # pop stack 
jr $ra

# Terminating the program
end:	
addi $sp, $sp 4 # Moving stack pointer back (pop the stack frame)
li $v0, 10 
syscall
