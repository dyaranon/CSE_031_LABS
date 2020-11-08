	.data
x:	.word 5
y:	.word 10
p:	.word 0
q:	.word 0

	.text
	
main: la $t0, x	# load address of x into register $t0
      lw $s0, 0($t0)	# s0 = x
      la $t0, y	# load address of y into register $t0
      lw $s1, 0($t0) 	# s1 = y 
      
      add $a0, $zero, $s0	#$a0 (arguement 1 for add function) = $s0 ($a0 = x)
      add $a1, $zero, $s1	#a1 (argument 2 for add function) = #s1 ($a1 = y)
      
      # add $s1, $s0, $s1	# y = y + x (or $s1 = $s0 + $s1)
      jal sum
      
sum: add $t0, $a1, 1 # register $t0 = $a1 (y) + 1  
     add $t1, $a0, 1 # register $t1 = $a0 (x) + 1
     jal sub
     
     la $t0, p       #load address of p into register $t0
     lw $s0, 0($t0)  #load value of $t0 into $s0
     add $s0, $s0, $v0 # p = sun(y+1, x+1); done above
     
     addi $t0, $a0, -1 # register $t0 = $a1 (y) - 1  
     addi $t1, $a0, -1 # register $t1 = $a0 (x) - 1
     jal sub
     
     la $t0, q       #load address of q into register $t0
     lw $s1, 0($t0)  #load value of $t0 into $s1
     add $s0, $s0, $v0 # q = sun(y-1, x-1); done above
     
     add $s0, $s0, $s1 # P + q
     addi $ra, $zero, 4194340
     jr $ra
     
     
sub: sub $v0, $t1, $t0 # b - a
     jr $ra
     	