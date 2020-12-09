;prog46.asm
;Programa en ensamblador el cual dibuja la bandera de Islandia

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
		
		Pinta 17h, 0000h, 184Fh ;azul
		Pinta 77h, 0012h, 1818h ;blanco
		Pinta 77h, 0A00h, 0D4Fh ;blanco
		Pinta 47h, 0014h, 1816h ;rojo
		Pinta 47h, 0B00h, 0C4Fh ;rojo
		
		ReadKey
		Control
			
	END inicio