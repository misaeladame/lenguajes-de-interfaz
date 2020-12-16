;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL 

;prog55.asm
;Programa que simula dos hojas de la cortina abren verticalmente a partir del centro, es decir, 
;al abrirse la cortina se irán viendo dos rectángulos en los extremos de la ventana;
;de manera similar hay que hacer lo mismo para cuando se desee cerrar la cortina.

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
	cNombreAlumno DB 'Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL'
				  DB 0Ah, 0Ah, 0Dh, '$'
	cDescripcion  DB 'Programa en lenguaje ensamblador mediante el cual se simule una ventana con '
				  DB 'una cortina de dos hojas la cual se abre o cierra dependiendo de lo que desee '
				  DB 'el usuario'
				  DB 0Ah, 0Dh, 0ah, '$'
	cCerrar		  DB 'Tecla A: Cerrar la cortina'
				  DB 0Ah, 0Dh, '$'
	cAbrir        DB 'Tecla D: Abrir la cortina'
				  DB 0Ah, 0Ah, 0Dh, '$'
	cInstruccion  DB 'Presione cualquier tecla para continuar con el programa...'
				  DB 0Ah, 0Dh, '$'	
	cDespedida 	  DB 0Ah, 0Dh, 'Adios, programa terminado$'
	cAbierta      DB 'La cortina ya esta completamente abierta y no se puede abrir mas'
				  DB 0Ah, 0Dh, '$'
	cCerrada      DB 'La cortina ya esta completamente cerrada y no se puede cerrar mas'
				  DB 0Ah, 0Dh, '$'
.CODE
	inicio: 
		Datos
		
		Mensaje cNombreAlumno
		
		Mensaje cDescripcion
		
		Mensaje cCerrar
		Mensaje cAbrir
		
		Mensaje cInstruccion
		
		ReadKey
		
		Pinta 17h, 0000h, 184Fh 
		Pinta 77h, 0027h, 1827h 
		
		eTecla:
			ReadKey
			
			cmp al, 'a'
			je  eCerrar
	
			cmp al, 'd'
			je  eAbrir
			
			cmp al, 0Dh
			jne eNoFinProg  
			
			jmp eFinProg
		
		eNoFinProg:
			jmp eTecla
			
		eAbrir:
			cmp cl, 00h
			je eMensajeAbierto
			
			push cx
			push dx
			Pinta 17h, 0000h, 184Fh 
			pop dx
			pop cx
			
			sub cl, 01h 
			add dl, 01h
			
			Pinta 77h, cx, dx
			
			jmp eTecla
		
		eCerrar:
			cmp cl, 27h
			je eMensajeCerrado
			
			push cx
			push dx
			Pinta 17h, 0000h, 184Fh 
			pop dx
			pop cx
				
			add cl, 01h
			sub dl, 01h
			
			Pinta 77h, cx, dx
			
			jmp eTecla 
		
		eMensajeAbierto:
			push cx
			push dx
			Pinta 77h, 0000h, 184Fh
			Pinta 07h, 1800h, 184Fh
			Mensaje cAbierta
			pop dx 
			pop cx
			jmp eTecla
		
		eMensajeCerrado:
			push cx
			push dx
			Pinta 17h, 0000h, 184Fh
			Pinta 07h, 1800h, 184Fh
			Mensaje cCerrada 
			pop dx 
			pop cx
			jmp eTecla
			
		eFinProg:
			Pinta 07h, 1800h, 184Fh
			Mensaje cDespedida
			ReadKey
			Control
			
	END inicio