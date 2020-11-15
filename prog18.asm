;Prog18.asm
;Programa en ensamblador el cual lee dos digitos y al final muestra el resultado 
;de la suma de los mismos, UTILIZANDO REGISTROS.
;Funciona correctamente para acarreos en unidades o en decenas 

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que muestra algunos ejemplos de la utilidad '
	         	DB 'la funcion aaa. '
				DB 0Ah, 0dh, 0ah,'$'    					
	cFinProg	DB 0Ah, 0Ah, '---------------- El programa ha terminado de ejecutarse ----------------$'
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		mov ax, 8                	;
    	add al, 1              	 	;    
     	aaa                    	    ;AX=0009h

     	mov ax, 8                	;
     	add al, 2                	;
     	aaa                      	;AX=0100h

    	mov ax,11110001b         	;
     	add al,1                 	;
     	aaa                      	;AX=0002h

     	mov ax, 8                	;
     	add al, 7                	;
     	aaa                      	;AX=0105h

     	add al, 4                	;
     	aaa                      	;AX=0109h

     	add al, 9                	;
     	aaa                      	;AX=0208h
	
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h

			mov ah, 08h				
			int 21h				

			mov ax, 4c00h
			int 21h
		
	END inicio