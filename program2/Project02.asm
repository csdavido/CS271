TITLE   Program02  (program2.asm)

; Author: David Rider
; Last Modified: 01/27/2019
; OSU email address: riderda@oregonstate.edu
; Course number/section: CS 271
; Project Number: 02                Due Date: 01/27/2019
; Description:  This program display program and author information, prompts the user and requests information, validates
; input, calculates and dissplays fibonacci numbers, and, finally, displays a parting message.

INCLUDE Irvine32.inc
LOWEST_INT = 0
HIGHEST_INT = 46
; (insert constant definitions here)
.data
; (insert variable definitions here)
intro_1		BYTE "Hello, welcome to my seccond assembly program!", 0
intro_2		BYTE "My name is David Rider and this program's title is Program 2.", 0
prompt_1	BYTE "Please enter your name. ", 0
intro_3		BYTE "Hello, ", 0
intro_4		BYTE ". Nice to meet you.", 0
userName	BYTE 33 DUP (0)
prompt_2	BYTE "Please enter the number of Fibonacci terms to display. ", 0
prompt_3	BYTE "The number must be between 1 and 46. ", 0
userData	DWORD	?
error		BYTE "Invalid number. Please enter a number between 1 and 46.", 0
case1		BYTE "1", 0
case2		BYTE "1     1", 0
spacer		BYTE "     ", 0
num_1		DWORD	?
num_2		DWORD	?
counter		DWORD	?
holder		DWORD	?
goodbye_1	BYTE "Thank you for using program2, ", 0
goodbye_2	BYTE ". Goodbye!", 0
continue	BYTE "Enter 0 to quit, or any other number to run the program again. ", 0
cinput		DWORD ?
quit		DWORD 0
.code
main PROC

;INTRO
begin:
	mov		edx, OFFSET intro_1
	call WriteString
	call CrLf
	mov		edx, OFFSET intro_2
	call WriteString
	call CrLf
;GETUSERNAME
	mov		edx, OFFSET prompt_1
	call WriteString
	call CrLf
	mov		edx, OFFSET userName
	mov		ecx, 32
	call ReadString
	mov		edx, OFFSET intro_3
	call WriteString
	mov		edx, OFFSET userName
	call WriteString
	mov		edx, OFFSET intro_4
	call WriteString
	call CrLf
;INSTRUCTIONS/GET USER DATA
getUserData:
	mov		edx, OFFSET prompt_2
	call WriteString
	call CrLf
	mov		edx, OFFSET prompt_3
	call WriteString
	call ReadInt
	mov		userData, eax
	call CrLf
;VALIDATE USER DATA
	cmp		userData, LOWEST_INT
	jl		getUserData
	cmp		userData, HIGHEST_INT
	jg		getUserData
;INPUT IS 1 or 2
	mov		eax, userData
	cmp		userData, 1
	je		userEntered1
	mov		eax, userData
	cmp		userData, 2
	je		userEntered2
	jmp		set_up
userEntered1:
	mov		edx, OFFSET case1
	call WriteString
	jmp		goodbye
userEntered2:
	mov		edx, OFFSET case2
	call WriteString
	jmp		goodbye
;SET UP
set_up:
	mov		ecx, eax
	mov		eax, 2
	sub		ecx, eax

	mov		eax, 2
	mov		counter, eax

	mov		eax, 1
	mov		num_1, eax
	call WriteDec
	mov		edx, OFFSET spacer
	call WriteString
	mov		eax, 1
	mov		num_2, eax
	call WriteDec
	mov		edx, OFFSET spacer
	call WriteString
;LOOP
fibo_1:
	mov		eax, num_1
	add		eax, num_2
	mov		holder, eax
	call WriteDec
	mov		edx, OFFSET spacer
	call WriteString
	inc		counter
	mov		ebx, 5
	mov		eax, counter
	cmp		eax, ebx
	jge		fibo_2
	jle		fibo_3
fibo_2:
	call CrLf
	mov		eax, 0
	mov		counter, eax
fibo_3:
	mov		eax, num_2
	mov		num_1, eax
	mov		eax, holder
	mov		num_2, eax
	loop	fibo_1
;FAREWELL
goodbye:
	call CrLf
	mov		edx, OFFSET goodbye_1
	call WriteString
	mov		edx, OFFSET userName
	call WriteString
	mov		edx, OFFSET goodbye_2
	call WriteString
	call CrLf
;CONTINUE UNTIL USER QUITS
	call CrLf
	call CrLf
	mov		edx, OFFSET continue
	call WriteString
	call ReadInt
	call CrLf
	call CrLf
	cmp		eax, quit
	jne		begin
	exit	
main ENDP
END main