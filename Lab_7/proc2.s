		.data
x:		.word 5
y:		.word 10
m:		.word 15
n:		.word 2

		.text
MAIN:	la $t0, x
		lw $s0, 0($t0)	# s0 = x
		la $t0, y
		lw $s1, 0($t0) 	# s1 = y
		
		# Prepare to call sum(x)
		add $a0, $zero, $s0	# Set a0 as input argument for SUM
		jal SUM
		add $t0, $s1, $a0
		add $s1, $t0, $v1
		addi $a0, $s1, 0 
		li $v0, 1		 
		syscall	
		j END

		
SUM: 	la $t0, m
		lw $s0, 0($t0)		# s0 = m
		addi $sp, $sp, -4
		sw $a0, 0($sp)		
		add $a0, $s0, $a0	# Update a0 as new argument for SUB
		jal SUB
		lw $a0, 0($sp)
		addi $sp, $sp, 4
		add $v1, $a0, $v0
		addi $ra, $zero, 4194336
		jr $ra		
		
SUB:	la $t0, n
		lw $s0, 0($t0)		# s0 = b
		addi $sp, $sp, -4
		sw $v0, 0($sp)		# Backup s0 from SUM
		sub $v0, $a0, $s0
		lw $v1, 0($sp)		# Restore s0 from SUM
		addi $sp, $sp, 4
		jr $ra
END:
