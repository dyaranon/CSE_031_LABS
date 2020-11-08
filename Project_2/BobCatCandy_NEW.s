.data 
str0: .asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars!\n"
askPrice: .asciiz "Enter the price of each BobCat Bar:\n "
askWrappers: .asciiz "Enter the number of wrappers needed to exchange for new bar:\n "
askMoney: .asciiz "How much money do you have? \n"
runNum: .asciiz  "Good! Let me run the numbers ...\n"
notEnough1: .asciiz "With $ "
notEnough2: .asciiz " you will receive a maximum of 0 BobCat Bars! \n"
initialPrint1: .asciiz "First, you buy "
initialPrint2: .asciiz " bars. \n"
recPrint1: .asciiz "Then you will get another "
recPrint2: .asciiz " bars. \n"
finalPrint1: .asciiz "With $"
finalPrint2: .asciiz " you will receive a maximum of "
finalPrint3: .asciiz " BobCat Bars!\n"
endless: .asciiz "Come back anytime for endless exchanges of BobCat Bars! "

.text

main:
addi $sp, $sp -4
sw $ra, 0($sp)
addi $t4, $zero, 0

li $v0, 4
la $a0, str0
syscall # prints out greet message
##############################################################################
li $v0, 4
la $a0, askPrice
syscall # asks user to enter price of each candy bar
##############################################################################
li $v0, 5
syscall # takes in user integer input, saves into $v0
add $t0, $v0, $zero # moves user input (price) into register $t0, SO $t0 = price!!!!
##############################################################################
li $v0, 4
la $a0, askWrappers
syscall #asks user to enter number of wrappers to trade in for a free candy bar
##############################################################################
li $v0, 5
syscall #takes in user integer input, saves into $v0
add $t1, $v0, $zero # moves user input(numWraps) into register $t1, SO $t1 = numWraps!!!!
###############################################################################
li $v0, 4
la $a0, askMoney
syscall #asks user to enter amount of money they have
##############################################################################
li $v0, 5
syscall #takes in user integer input, saves into $v0
add $t2, $v0, $zero # moves user input (money) into register $t2, SO $t2 = money!!!!
###############################################################################
li $v0, 4
la $a0, runNum
syscall # prints out running numbers message...
###############################################################################
bge $t2, $t0, else # checks whether user has enough money for at least one candy bar. Prints appropriate message if they do not
li $v0, 4
la $a0, notEnough1
syscall
add $a0, $t2, $zero
li $v0, 1
syscall
li $v0, 4
la $a0, notEnough2
syscall
j end
################################################################################
else: # put temporary registers into a registers as arguments for maxBars
move $a0, $t0 # $a0 = $t0 = price
move $a1, $t1 # $a1 = $t1 = numWrappers
move $a2, $t2 # a2 = $t2 = money

jal maxBars # Call maxBars to calculate the maximum number of BobCat Bars

move $t0, $v0
li $v0, 4
la $a0, finalPrint1
syscall
add $a0, $a2, $zero
li $v0, 1
syscall
li $v0, 4
la $a0, finalPrint2
syscall
add $a0, $t0, $zero
li $v0, 1
syscall
li $v0, 4
la $a0, finalPrint3
syscall
j end

maxBars:
addi $sp, $sp -4
sw $ra, 0($sp)
div $a2, $a0 # calculates how many initial candy bars one can buy
mflo $t0 # puts quotient into temp register $t0 ($t0 = (money / price) = numBars)

li $v0, 4
la $a0, initialPrint1
syscall
add $a0, $t0, $zero
li $v0, 1
syscall
li $v0, 4
la $a0, initialPrint2
syscall
move $a0, $t0 #a0 is mow numBars
jal newBars # $v0 will be return value!


add $t1, $t0, $v0 # $v0 is return value from newBars
addi $v0, $t1, 0
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

		
# End of maxBars

newBars:
addi $sp, $sp, -8
sw $ra, 4($sp)
#This function calculates the number of BobCat Bars a user will receive based on n.
#It takes in 2 arguments ($a0, $a1) as number of wrappers left so far and n.
bne $a1, $zero, elseIf1
addi $v0, $zero, 0 # $v0 is our return value, so return 0 if numWraps == 0
j endRec

elseIf1:
addi $t1, $zero, 1
bne $a1, $t1, elseIf2
addi $v0, $zero, 0 # $v0 is our return value, so return 0 if numWraps == 0
j specialMessage

elseIf2:
bge $a0, $a1, elseRec
addi $v0, $zero, 0 # $v0 is our return value, so return 0 if numWraps == 0
j endRec

elseRec:
move $t2, $a0 # moves $a0 = numBars into temp register $t2
div $t2, $a1 # numBars = numBars / numWraps				
mflo $t3

li $v0, 4
la $a0, recPrint1
syscall
add $a0, $t3, $zero
li $v0, 1
syscall
li $v0, 4
la $a0, recPrint2
syscall  # This and above prints out "Then you will get another..."

add $t4, $t4, $t3
move $a0, $t3		
jal newBars
# End of newBars


endRec:
addi $v0, $t4, 0
lw $ra, 4($sp) # retrieve value for program to return to main
addi $sp, $sp, 8
jr $ra

specialMessage:
li $v0, 4
la $a0, endless
syscall
j end

end: 
addi $sp, $sp, 4
li $v0, 10 
syscall
