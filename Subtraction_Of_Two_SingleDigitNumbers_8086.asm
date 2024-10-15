ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter the first digit: "
MOV DX, OFFSET msg_input1  ; Load the address of the first input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read the first single-digit integer
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer (0-9)
MOV BL, AL         ; Store the first digit in BL

; Display message "Enter the second digit: "
MOV DX, OFFSET msg_input2  ; Load the address of the second input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read the second single-digit integer
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer (0-9)
MOV CL, AL         ; Store the second digit in CL

; Perform subtraction (BL - CL)
SUB BL, CL         ; BL = first digit - second digit

; Convert result back to ASCII
ADD BL, '0'        ; Convert integer back to ASCII

; Print the message "The result of subtraction is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the output message

; Print the result
MOV DL, BL         ; Move the result to DL
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character

; Print a newline for better output formatting
MOV DL, 0Dh        ; Carriage return
MOV AH, 02h
INT 21h            ; Print carriage return
MOV DL, 0Ah        ; Line feed
INT 21h            ; Print line feed

; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output   DB 0Dh, 0Ah, 'The result of subtraction is: $'

END                ; End of program