.data
str1: .asciiz "Enter value 1\n"
str2: .asciiz "Enter value 2\n"
str3: .asciiz "the sum is\n"

.text
.globl main
main:

   #Prompting input from User for value 1

   li $v0,4     #printf str1
   la $a0,str1  
   syscall



   li $v0,5  # scanf n 
   syscall   # syscall saves user entered input into $v0
   move $t0,$v0     


    li $v0,4     #printf str2
   la $a0,str2  #Move address of string to be printed to $a0
   syscall

   #Taking Input From User for n

   li $v0,5  # scanf n 
   syscall   # syscall saves user entered input into $v0
   move $t1,$v0      

    add $t2,$t1,$t0   #adding the numbers and putting into t2
    move $s2,$t2
   #Printing integers

   li $v0,4     
   la $a0,str3  #printf str3
   syscall

   li $v0, 1  #printf n
   move $a0, $s2 
   syscall


   #Terminating the program
   li $v0, 10  #return
   syscall
