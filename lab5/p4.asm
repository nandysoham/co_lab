.data
    str1 : .asciiz "enter number of array elements \n"
    str2 : .asciiz "enter array elements\n"
    str3 : .asciiz "the sorted array is \n"
    arr : .space 400            #holds upto 100 integers

.text
.globl main
main:
    # prompting for taking the number of elements in the array
    li $v0, 4
    la $a0, str1
    syscall

    #taking the input of n
    li $v0, 5
    syscall

    move $t7, $v0
    subu $t7, 1
    mul $t7, $t7, 4         # total number of bytes required

    # printing str2
    li $v0,4
    la $a0,str2
    syscall

    jal takeinput

    jal sort

    jal printoutput

    li $v0,10
    syscall

# --------------------------functions --------------------

# function to take input
takeinput:

    # taking the inputs of arr[i]
    li $v0,5
    syscall

    beq $t0, $t7, exit
    sb  $v0, arr($t0)
    add $t0, $t0, 4

    j takeinput		
    

    exit:
        jr $ra

swap: #Below function does swapping of two integers
    sll $t1,$a1,2    
    add $t1,$a0,$t1       #$t1 stores the address of the kth element of the array in t1 (Assuming that $a1 contains k and a0 has the address of the first element of array
    lw $t0,0($t1)         #$t0 has the value of the kth element
    lw $t2,4($t1)         #$t2 has the value of the k+1 th element

    sw $t2,0($t1)         #We save the value in reg t2 to the kth place 
    sw $t0,4($t1)         #We save the value in reg t0 to the k+1 th place

    jr $ra



#function to sort the array -- bubble sort
sort:
addi $sp,$sp,-20
sw $ra,16($sp)
sw $s3,12($sp)
sw $s2, 8($sp)
sw $s1, 4($sp)
sw $s0, 0($sp)

move $s2,$a0
move $s3,$a1

move $s0,$zero
#foro represents outer loop
foro:   slt $t0,$s0,$s3
	beq $t0,$zero, exit1
	addi $s1,$s0,-1
	#fori represents inner loop
	fori:	slti $t0,$s1,0
		bne $t0,$zero,exit2
		sll $t1,$s1,2
		add $t2,$s2,$t1
		lw $t3,0($t2)
		lw $t4,4($t2)
		slt $t0,$t4,$t3
		beq $t0,$zero,exit2
		
		move $a0,$s2
		move $a1,$s1
		jal swap
		
		addi $s1,$s1,-1
		j fori
		exit2: addi $s0,$s0,1
		j foro
		
		
exit1:  lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addi $sp,$sp,20
	
jr $ra
	
		
#function for pinting the array
printoutput:
    lw $t6,array($t0)

    li $t0,0
    li $v0,1
    lw $a0,array($t0)
    syscall
    beq $t0,$t7,exit
    add $t0,$t0,4
    j output
