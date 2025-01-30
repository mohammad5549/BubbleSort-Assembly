# MIPS Assembly Code for Sorting an Array Using Sort and Swap Procedures

	.macro printString(%str)
    		li $v0, 4                       # System call to print a string
    		la $a0, %str                    # Print message
    		syscall
	.end_macro

	.macro printArray(%arr, %size)

		print_array:
		    move $t0, %size                   # Load size of the array into $t0 (counter)
		    move $t1, %arr                   # Load base address of the array into $t1

		print_loop:
		    beqz $t0, print_exit            # Exit loop if counter is 0
		    lw $t2, 0($t1)                  # Load the current element into $t2
		    li $v0, 1                       # System call for print integer
		    move $a0, $t2                   # Move the value to be printed into $a0
		    syscall                         # Print integer

		    li $v0, 4                       # System call for print string
		    la $a0, space                   # Print space between numbers
		    syscall

		    addi $t1, $t1, 4                # Move to the next element in the array
		    addi $t0, $t0, -1               # Decrement the counter
		    j print_loop                    # Repeat loop
    
		print_exit:

	.end_macro

	.macro exit
		li $v0, 10
		syscall
	.end_macro

.data
array:		.word		5, 7, 3, 2, 1          
size:		.word		5                       
msg_sorted:	.asciiz 	"Sorted array:   "
before:		.asciiz 	"\nBefore Sorting: "
tab:		.asciiz 	"                "
newLine:	.asciiz 	"\n"
space:		.asciiz 	" "                  

.text
.globl main

# Main Program
main:

	printString before
    
    	la	$a0, array                   # Load address of array into $a0
    	lw 	$a1, size                    # Load size of the array into $a1
    
    	printArray $a0 $a1
    	printString newLine

    	# Load the base address of the array and its size into $a0 and $a1
    	la	$a0, array                   # Load address of array into $a0
    	lw	$a1, size                    # Load size of the array into $a1

    	# Call the sort procedure
    	jal	sort                        # Call sort

    	# Print "Sorted array: "
    	printString msg_sorted

	la	$a0, array		# Reload array base address
    	lw 	$a1, size		# Reload array's size
    
    	printArray $a0 $a1
    	exit

# Swap Procedure
swap:
	sll	$t1, $a1, 2                  # reg $t1 = k * 4
	add	$t1, $a0, $t1                # reg $t1 = v + (k * 4)
	lw 	$t0, 0($t1)                  # reg $t0 (temp) = v[k]
	lw 	$t2, 4($t1)                  # reg $t2 = v[k+1]
    	sw 	$t2, 0($t1)                  # v[k] = reg $t2
    	sw 	$t0, 4($t1)                  # v[k+1] = reg $t0 (temp)
    	jr 	$ra                          # Return to calling routine

# Sort Procedure
sort:
    	# Save registers
	addi	$sp, $sp, -20              # Make room on stack for 5 registers
    	sw 	$ra, 16($sp)                 # Save return address
    	sw 	$s3, 12($sp)                 # Save $s3 on stack
    	sw 	$s2, 8($sp)                  # Save $s2 on stack
    	sw 	$s1, 4($sp)                  # Save $s1 on stack
    	sw 	$s0, 0($sp)                  # Save $s0 on stack

    	# Move parameters
    	move 	$s2, $a0                   # Copy parameter $a0 into $s2 (save $a0)
    	move 	$s3, $a1                   # Copy parameter $a1 into $s3 (save $a1)

    	# Outer loop
    	move 	$s0, $zero                 # i = 0

for1: 

	slt 	$t0, $s0, $s3               # reg $t0 = 1 if $s0 < $s3 (i < n)
    	beq 	$t0, $zero, exit1           # Exit loop if $s0 >= $s3

    	addi 	$s1, $s0, -1                # j = i - 1

for2: 

	slt 	$t0, $s1, $zero             # reg $t0 = 1 if $s1 < 0 (j < 0)
    	bne 	$t0, $zero, exit2           # Exit loop if $s1 < 0

    	sll 	$t1, $s1, 2                 # reg $t1 = j * 4
    	add 	$t2, $s2, $t1               # reg $t2 = v + (j * 4)
    	lw 	$t3, 0($t2)                 # reg $t3 = v[j]
    	lw 	$t4, 4($t2)                 # reg $t4 = v[j+1]
    	slt 	$t0, $t4, $t3               # reg $t0 = 1 if $t4 < $t3
    	beq 	$t0, $zero, exit2           # Exit inner loop if $t4 >= $t3

    	# Call swap
    	move 	$a0, $s2                    # 1st parameter of swap is v
    	move 	$a1, $s1                    # 2nd parameter of swap is j
    	jal 	swap                        # Call swap procedure

    	addi 	$s1, $s1, -1                # j = j - 1
    
    	printString tab
    	la 	$a0, array		
    	lw 	$a1, 	size
    	printArray $a0 $a1
    	printString newLine
    
    	j 	for2	                     # Jump to inner loop test

exit2: 
	addi 	$s0, $s0, 1                 # i = i + 1
    	j 	for1                        # Jump to outer loop test

exit1:
	# Restore registers
	lw 	$s0, 0($sp)                  # Restore $s0 from stack
    	lw 	$s1, 4($sp)                  # Restore $s1 from stack
    	lw 	$s2, 8($sp)                  # Restore $s2 from stack
    	lw 	$s3, 12($sp)                 # Restore $s3 from stack
    	lw 	$ra, 16($sp)                 # Restore return address
    	addi 	$sp, $sp, 20                 # Restore stack pointer

    	jr 	$ra                          # Return to calling routine
