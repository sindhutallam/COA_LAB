ORG 100h              
MOV AH, 09h            
MOV DX, OFFSET msg_output  
INT 21h                


MOV DL, '1'            
MOV AH, 02h            
INT 21h                

MOV DL, '5'           
MOV AH, 02h            
INT 21h                


MOV AH, 4Ch            
INT 21h                

msg_output DB 0Dh, 0Ah, 'The two-digit number is: $'  