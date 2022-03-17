.data
str1: .asciiz "Enter value of n\n"

.text
.globl main
main:

   #Prompting input from User for n

   li $v0,4     #printf str1
   la $a0,str1  #Move address of string to be printed to $a0
   syscall

   #Taking Input From User for n

   li $v0,5  # scanf n 
   syscall   # syscall saves user entered input into $v0
    add $v0,$v0,1
    
   move $t1,$v0      # storing in a temporary register t1
    li $t0  1  #initialising the value



   loop:
    beq		$t0, $t1, end	# if $t0 == $t1 then target

        li $v0, 1  
        move $a0, $t0 
        syscall
    addi	$t0, $t0, 1			# $t0 = $t0 + 1
    j loop

  
    end:
        #Terminating the program
        li $v0, 10  #return
        syscall
