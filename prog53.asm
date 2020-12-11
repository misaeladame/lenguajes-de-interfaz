;prog53.asm
;Programa en ensamblador el cual dibuja un cuadro, el cual se desplaza
;en la ventana mediante teclas de desplazamiento

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

Mensaje MACRO cadena
	mov ah, 09h
	mov dx, offset cadena
	int 21h
ENDM

Control MACRO
	mov ax, 4c00h 
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	cDespedida DB 0Ah, 0Dh, 'Adios, programa terminado$'
.CODE
	inicio: 
		Datos
		Pinta 07h, 0000h, 184Fh ;limpiamos la pantalla
		Pinta 27h, 0000h, 0305h 
		
		eDesplaza:
			ReadKey
			
			cmp al, 'd'
			je  eAvanza
			
			cmp al, 'a'
			je  eRetrocede
			
			cmp al, 's'
			je  eAbajo
			
			cmp al, 'w'
			je  eArriba
			
			cmp al, 0Dh
			jne eNoFinProg  ;Se hace de esta manera debido a que antes con la instruccion eFinProg
							;salia un error de Jump out of range by "n byte(s)", por lo que se 
							;compara de manera opuesta
			
			jmp eFinProg
			
		eNoFinProg:
			jmp eDesplaza
		
		eAvanza:
			cmp dl, 4Fh
			je eDesplaza
			
			Pinta 07h, cx, dx
			
			add cl, 01h 
			add dl, 01h
			
			Pinta 27h, cx, dx
			
			jmp eDesplaza
				
		eRetrocede:
			cmp cl, 00h
			je eDesplaza
			
			Pinta 07h, cx, dx
			
			sub cl, 01h
			sub dl, 01h
			
			Pinta 27h, cx, dx
			
			jmp eDesplaza
			
		eAbajo:
			cmp dh, 18h
			je eDesplaza
			
			Pinta 07h, cx, dx
			
			add ch, 01h
			add dh, 01h
			
			Pinta 27h, cx, dx
			
			jmp eDesplaza
		
		eArriba:
			cmp ch, 00h
			jne eArriba2
			
			jmp eDesplaza
			
		eArriba2:
			Pinta 07h, cx, dx
			
			sub ch, 01h
			sub dh, 01h
			
			Pinta 27h, cx, dx
			
			jmp eDesplaza
			
		eFinProg:
			Mensaje cDespedida
			ReadKey
			Control
			
	END inicio