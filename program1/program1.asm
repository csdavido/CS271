TITLE Program Template     (template.asm)

; Author: David Rider
; Last Modified: 01/15/2019
; OSU email address: riderda@oregonstate.edu
; Course number/section: CS 271
; Project Number: 01                Due Date: 01/21/2019
; Description:  This program displays name and program information, gives instructions, 
; prompts the user to enter numbers, uses those numbers to make calculations, and
; displays a terminating message.

INCLUDE Irvine32.inc

; (insert constant definitions here)
.data
; (insert variable definitions here)
intro_1		BYTE "Hello, welcome to my first assmebly program! My name is David Rider and this program's title is Program 1.", 0
prompt_1	BYTE "Please enter an integer. ", 0
num_1		DWORD ?
prompt_2	BYTE "Please enter another integer. ", 0
num_2		DWORD ?
sum			DWORD ?
sumResult	BYTE "+", 0
equals		BYTE "=", 0
difference	DWORD ?
difResult	BYTE "-", 0
product		DWORD ?
proResult	BYTE "x", 0
quotient	DWORD ?
remainder	DWORD ?
quoResult_1	BYTE "/", 0
quoResult_2 BYTE "  Remainder: ", 0
goodBye		BYTE "Thank you for using my program. Goodbye!", 0
eCredit_1	BYTE "EC: Program repeats until user chooses to quit.", 0
eCredit_2	BYTE "EC: Program validates num_2 is less than num_1.", 0
eCredit_3	BYTE "EC: Program calculates and displays the quotient as a floating-point number, rounded to the nearest .001.", 0

.code
main PROC

; (insert executable instructions here)
; INTRODUCTION
	mov		edx, OFFSET intro_1
	call WriteString
	call CrLf
; GET DATA
	mov		edx, OFFSET prompt_1
	call WriteString
	call ReadInt
	mov num_1, eax

	mov		edx, OFFSET prompt_2
	call WriteString
	call ReadInt
	mov		num_2, eax
; CALCULATIONS
; SUM
	mov		eax, num_1
	add		eax, num_2
	mov		sum, eax
;DIFFERENCE
	mov		eax, num_1
	sub		eax, num_2
	mov		difference, eax
;PRODUCT
	mov		eax, num_1
	mov		ebx, num_2
	mul		ebx
	mov		product, eax
;QUOTIENT
	mov		edx, 0
	mov		eax, num_1
	mov		ebx, num_2
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
;DIFFERENCE
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
;PRODUCT
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
;QUOTIENT
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
; GOODBYE
	mov		edx, OFFSET goodBye
	call WriteString
	call CrLf	
	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
