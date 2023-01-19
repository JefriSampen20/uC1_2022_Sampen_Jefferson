;--------------------------------------------------------------------------------------------------
; @file   Corrimiento_Leds.s   	
; @date   14/01/2023
; @brief  Programa para el corrimiento de leds en el puerto C y el en puerto E utilizando delays, 
; además detectará cuando sea corrimiento impar RE0 (250ms) y el corrimiento par RE1 (500ms).
; @author Jefferson Armando Sampen Chancafe 
;--------------------------------------------------------------------------------------------------
    
PROCESSOR 18F57Q84
#include "BitConfig.inc"	/config statements should precede project file includes./
#include <xc.inc>
#include "Retardos.inc"
    
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
 Main:
    CALL Config_OSC,1
    CALL Config_Port,1
;---------------------------;
    MOVLW 00000000B	    ; Colocamos en el registro W el valor 0
    MOVWF TRISC		    ; Movemos el valor del WREG al registro TRISC, todos los pines del puerto C son configurados como salidas
    MOVWF TRISE		    ; Movemos el valor del WREG al registro TRISE, todos los pines del puerto E son configurados como salidas

Loop:
    CALL    Delay_132ms
    CALL    Delay_132ms
    BTFSC   PORTA,3,0	    ; PORTA<3> =0?  -  Button press?
    GOTO    Led_stop	    
    
Led_On:
    GOTO    Programa
    
Led_stop:		    ; Esta subrutina detiene el programa
    goto    Loop
    
Programa:  
    
    BSF     PORTC,0,0	    ;Ponemos a 1 RC0
    BSF     PORTE,0,0	    ;Ponemos a 0 RC1
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop         ;Se detiene el led
    
    BSF     PORTC,1,0	    ;Ponemos a 1 RC1
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,2,0	    ;Ponemos a 1 RC2
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,3,0	    ;Ponemos a 1 RC3
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led

    BSF     PORTC,4,0	    ;Ponemos a 1 RC4
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,5,0	    ;Ponemos a 1 RC5
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,6,0	    ;Ponemos a 1 RC6
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,7,0	    ;Ponemos a 1 RC7
    BSF     PORTE,0,0	    ;Ponemos a 0 RC0
    CALL    Retardo_250ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,0,0	    ;Ponemos a 1 RC0
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop         ;Se detiene el led
    
    BSF     PORTC,1,0	    ;Ponemos a 1 RC1
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,2,0	    ;Ponemos a 1 RC2
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,3,0	    ;Ponemos a 1 RC3
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led

    BSF     PORTC,4,0	    ;Ponemos a 1 RC4
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,5,0	    ;Ponemos a 1 RC5
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,6,0	    ;Ponemos a 1 RC6
    BSF     PORTE,1,0	    ;Ponemos a 1 RE1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    BSF     PORTC,7,0	    ;Ponemos a 1 RC7
    BSF     PORTE,1,0	    ;Ponemos a 1 RC1
    CALL    Retardo_500ms
    BTFSS   PORTA,3,0	    ;PORTA<3> = 1? - Button press?
    GOTO    Led_stop	    ;Se detiene el led
    
    GOTO    Programa
    
Config_OSC:
    ;Configuracion del Oscilador Interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW 0x60	    ;seleccionamos el bloque del osc interno con un div:1
    MOVWF OSCCON1,1
    MOVLW 0x02	    ;seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ ,1
    RETURN
 
 Config_Port:  ;PORT-LAT-ANSEL-TRIS  BUTTON:RA3
    
    BANKSEL PORTC
    SETF PORTC,1
    CLRF LATC,1		; Los leds inician apagados  
    
    BANKSEL PORTE
    SETF PORTE,1
    CLRF LATE,1		; Los leds inician apagados 
    
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1	; PORTA<7:0> = 0
    CLRF    ANSELA,1	; PortA digital
    BSF	    TRISA,3,1	; RA3 como entrada
    BSF	    WPUA,3,1	; Activamos la resistencia Pull-Up del pin RA3
    RETURN 
  
END resetVect