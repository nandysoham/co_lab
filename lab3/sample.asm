.data
str1: .asciiz "Enter value\n"
str2: .asciiz "The value entered is "

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
   move $s0,$v0      #s0 = v0, Saving n in reg s0

   #Printing integers

   li $v0,4     
   la $a0,str2  #printf str2
   syscall

   li $v0, 1  #printf n
   move $a0, $s0 #a0 = s0, Load register a0 with value to be printed
   syscall


   #Terminating the program
   li $v0, 10  #return
   syscall
