;prog45.asm
;Programa en ensamblador el cual dibuja la bandera de Italia
Pinta MACRO Color, eIni, eFin
	mov ah, 06h
	mov al, 00h
	mov bh, Color 
	mov cx, eIni
	mov dx, eFin
	int 10h
ENDM

Datos MACRO
	mov ax, @Data 
	mov ds, ax
ENDM

ReadKey MACRO
	mov ah, 08h				
	int 21h
ENDM

Control MACRO
	mov ax, 4c00h 
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA

.CODE
	inicio: 
		Datos
		
		Pinta 27h, 0000h, 181Ah
		Pinta 77h, 001Bh, 1834h
		Pinta 47h, 0035h, 184Fh
		
		ReadKey
		Control
			
	END inicio