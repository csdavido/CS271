TITLE Program 01     (program1.asm)

; Author: David Rider
; Last Modified: 01/17/2019
; OSU email address: riderda@oregonstate.edu
; Course number/section: CS 271-400
; Project Number: 01                Due Date: 01/21/2019
; Description:  This program displays name and program information, gives instructions, 
; prompts the user to enter numbers, uses those numbers to make calculations, and
; displays a terminating message.

INCLUDE Irvine32.inc
.data
; VARIABLE DEFINITIONS
intro_1		BYTE "Hello, welcome to my first assmebly program! My name is David Rider and this program's title is Program 1.", 0
prompt_1	BYTE "Please enter an integer. ", 0
num_1		DWORD ?
prompt_2	BYTE "Please enter another integer. ", 0
num_2		DWORD ?
sum			DWORD ?
sumResult	BYTE 43, 0
equals		BYTE 61, 0
difference	DWORD ?
difResult	BYTE 45, 0
product		DWORD ?
proResult	BYTE "*", 0
quotient	DWORD ?
remainder	DWORD ?
quoResult_1	BYTE 246, 0
quoResult_2 BYTE "  Remainder: ", 0
goodBye		BYTE "Thank you for using my program. Goodbye! ", 0
; EXTRA CREDIT FUNCTIONALITES
eCredit_1	BYTE "EC: Program repeats until user chooses to quit.", 0
ec1_prompt	BYTE "Enter 0 to quit, or any other number to run the program again. ", 0
ec1_input	DWORD ?
ec1_quit	DWORD 0
eCredit_2	BYTE "EC: Program validates num_2 is less than num_1.", 0
ec2_prompt	BYTE "The second number must be smaller than the first.", 0
ec2_zero	DWORD 0
ec2_0prompt	BYTE "The second number must be greater than zero. ", 0

.code
main PROC
; INTRODUCTION
	mov		edx, OFFSET intro_1
	call WriteString
	call CrLf
; EXTRA CREDIT INFO
	mov		edx, OFFSET eCredit_1
	call WriteString
	call CrLf
	mov		edx, OFFSET eCredit_2
	call WriteString
	call CrLf
; GET DATA
getData:
	mov		edx, OFFSET prompt_1
	call WriteString
	call ReadInt
	mov num_1, eax
num_2_unvalidated:
	mov		edx, OFFSET prompt_2
	call WriteString
	call ReadInt
; CHECK IF GREATER THAN ZERO
	cmp		eax, ec2_zero
	jg		num_2_greaterThan0
	mov		edx, OFFSET ec2_0prompt
	call WriteString
	jmp num_2_unvalidated
; CHECK IF GREATER THAN NUM_1
num_2_greaterThan0:
	cmp		eax, num_1
	jl		num_2_validated
	mov		edx, OFFSET ec2_prompt
	call WriteString
	call CrLf
	jmp		num_2_unvalidated
num_2_validated:
	mov		num_2, eax
	call CrLf
; CALCULATIONS
; SUM
	mov		eax, num_1
	add		eax, num_2
	mov		sum, eax
; DIFFERENCE
	mov		eax, num_1
	sub		eax, num_2
	mov		difference, eax
; PRODUCT
	mov		eax, num_1
	mov		ebx, num_2
	mul		ebx
	mov		product, eax
; QUOTIENT
	mov		edx, 0
	mov		eax, num_1
	mov		ebx, num_2
	cdq
	div		ebx
	mov		quotient, eax
	mov		remainder, edx
; DISPLAY RESULTS
; SUM
	mov		eax, num_1
	call WriteDec
	mov		edx, OFFSET sumResult
	call WriteString
	mov		eax, num_2
	call WriteDec
	mov		edx, OFFSET equals
	call WriteString
	mov		eax, sum
	call WriteDec
	call CrLf
; DIFFERENCE
	mov		eax, num_1
	call WriteDec
	mov		edx, OFFSET difResult
	call WriteString
	mov		eax, num_2
	call WriteDec
	mov		edx, OFFSET equals
	call WriteString
	mov		eax, difference
	call WriteDec
	call CrLf
; PRODUCT
	mov		eax, num_1
	call WriteDec
	mov		edx, OFFSET proResult
	call WriteString
	mov		eax, num_2
	call WriteDec
	mov		edx, OFFSET equals
	call WriteString
	mov		eax, product
	call WriteDec
	call CrLf
; QUOTIENT
	mov		eax, num_1
	call WriteDec
	mov		edx, OFFSET quoResult_1
	call WriteString
	mov		eax, num_2
	call WriteDec
	mov		edx, OFFSET equals
	call WriteString
	mov		eax, quotient
	call WriteDec
	mov		edx, OFFSET quoResult_2
	call WriteString
	mov		eax, remainder
	call WriteDec
	call CrLf
; LOOP UNTIL USER QUITS (EC #1)
	mov		edx, OFFSET ec1_prompt
	call WriteString
	call ReadInt
	cmp		eax, ec1_quit
	jne		getData
; GOODBYE
	mov		edx, OFFSET goodBye
	call WriteString
	call CrLf	
	exit
main ENDP
END main
