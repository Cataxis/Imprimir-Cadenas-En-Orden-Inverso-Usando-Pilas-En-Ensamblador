.MODEL SMALL
.STACK


.DATA


    arr db 5 dup(' '), '$' ;Array para los datos a ingresar
    mensaje1 db "Ingresa los caracteres que se almacenan en la pila: ", 10, "$"
    mensaje2 db 10, "Los elementos de la pila al reves son: ", 10, "$"
    mensaje3 db 10, "Los elementos de la pila en orden son: ", 10, "$"
.CODE


    MOV AX, @DATA ;Mover las variables al segmento ax
    MOV DS, AX ;Mover a ds para usar las variables
    MOV CL, 4 ;A CL MOVER 4 PARA EL CONTADOR PARA QUE SE REPITA EL CICLO EN NO. DE VECES QUE SE ASIGNEN




    MOV AH, 09H ;Servicio de mostrar cadena
    MOV DX, offset mensaje1 ;Llamamos la variable mensaje
    int 21h




ingresar: ;Método para ingresar caracteres  
    MOV AH, 01H ;Servicio para ingresar caracteres
    int 21h ;
    push ax ;Meter a la pila de ax la tecla pulsada




loop ingresar


    MOV AH, 09H ;Servicio para mostrar cadena
    MOV DX, offset mensaje2 ;Llamamos a la variable mensaje
    int 21h


    MOV CL, 04 ;Iniciamos el contador para que repita n veces el ciclo
    MOV si, 03h ;Movemos a si para inicializarla para tomar la posición del arreglo


sacar: ;Métoddo para sacar de la pila


    pop AX ;Se toma el último dato de la pila y se almacena en AX
    ;El POP se almacena en el caracter de la pila


    MOV AH, 02H ;Servicio para imprimir caracteres
    MOV DL, AL ;Movemos a DL para imprimir
    int 21h


    mov arr[si], AL ;Tomar posición del array con SI para moverlo a AL
    dec si ;Decrementamos para obtener la posición anterior del array


loop sacar


    MOV AH,09H ;Servicio para mostrar cadena
    MOV DX, offset mensaje3 ;Var mensaje
    int 21h


mostrar:
    MOV AH, 09H ;Imprimir cadena
    MOV DX, offset arr ;Imprimir la cadena
    int 21h


Salir:
    MOV AH, 4CH ;Servicio para terminar programa
    int 21h


END
