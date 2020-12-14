;prog54.asm
;Programa en ensamblador el cual dibuja una barra horizontal que va
;creciendo automaticamente, sin necesidad de presionar ninguna tecla

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
		Pinta 07h, 0000h, 184Fh ;limpiamos la pantalla
		Pinta 17h, 0000h, 1800h ;azul
		
;		eTecla:
;			mov ah, 00h
;			int 16h
			
;			cmp ah, 4Bh
;			je  eDecrece
			
;			cmp ah, 4Dh
;			je  eCrece
			
;			Control
		
		eCrece:
			cmp cl, 4Fh 
			je  eFinProg
			
			add cl, 01h
			add dl, 01h
			
			Pinta 17h, cx, dx
			push cx
			
			mov cx, 0000h
			
			eDelay2:
			
				mov bx, 0000h
				
				eDelay1:
					inc bx
					cmp bx, 0FFFFh
					jb eDelay1
					
				inc cx
				cmp cx, 1FFFh 
				jb eDelay2
				
			pop cx
				
			jmp eCrece
			
;		eDecrece:
;			cmp cl, 00h
;			je  eTecla
			
;			Pinta 07h, cx, dx 
			
;			sub cl, 01h
;			sub dl, 01h
			
;			jmp eTecla
			
		eFinProg:
			Control
			
	END inicio