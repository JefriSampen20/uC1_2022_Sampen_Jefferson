;-------------------------------------------------------------------------------------------------------
; @file   Display_7SEG.s  	
; @date   14/01/2023
; @brief  Programa para el conteo de números y letras, a base del pulsador de placa. Cuando el pulsador
; de placa no se presiona mostrará los valores numéricos del 0 al 9, y cuando se presiona se muestran los valores de A
; hasta F.
; @author Jefferson Armando Sampen Chancafe
;------------------------------------------------------------------------------------------------------
    
PROCESSOR 18F57Q84
#include "BitConfig.inc"     /config statements should precede project file includes./
#include <xc.inc>
#include "Retardos.inc" 

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
 Main:
    CALL Config_OSC,1
    CALL Config_Port,1
    MOVLW 00000000B	    ; Colocamos en el registro W el valor 0
    MOVWF TRISD,1		    ; Movemos el valor del WREG al registro TRISD, todos los pines del puerto C son configurados como salidas

Loop:
    CALL    Delay_1s
    BTFSC   PORTA,3,0	    ; PORTA<3> =0?  -  Button press?
    GOTO    Numero	    

Letras:
    
    MOVLW   0001000B	    ; Colocamos en el registro W la letra A
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo
    
    MOVLW   0000011B	    ; Colocamos en el registro W la letra B
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo
    
    MOVLW   1000110B	    ; Colocamos en el registro W la letra C
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo
    
    MOVLW   0100001B	    ; Colocamos en el registro W la letra D
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo
    
    MOVLW   0000110B	    ; Colocamos en el registro W la letra E
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo
    
    MOVLW   0001110B	    ; Colocamos en el registro W la letra F
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo
    
    GOTO Letras
    
Numero:
    
    MOVLW   1000000B	    ; Colocamos en el registro W el número 0
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   1111001B	    ; Colocamos en el registro W el número 1
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0100100B	    ; Colocamos en el registro W el número 2
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0110000B	    ; Colocamos en el registro W el número 3
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0011001B	    ; Colocamos en el registro W el número 4
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0010010B	    ; Colocamos en el registro W el número 5
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0000010B	    ; Colocamos en el registro W el número 6
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   1111000B	    ; Colocamos en el registro W el número 7
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0000000B	    ; Colocamos en el registro W el número 8
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1
    
    MOVLW   0011000B	    ; Colocamos en el registro W el número 9
    MOVWF   PORTD,1	    ; Cargo el registro PORTB con el W.
    CALL    Delay_1s
    CALL    Reseteo1

    GOTO Loop 
    
 Config_OSC:
    ;Configuracion del oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1 
    MOVLW   0x60        ;Seleccionamos el bloque del osc con un div:1
    MOVWF   OSCCON1,1
    MOVLW   0x02        ; Seleccionamos una frecuencia de 4MHz
    MOVWF   OSCFRQ ,1
    RETURN
   
 Config_Port:  ;PORT-LAT-ANSEL-TRIS	BUTTON:RA3
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1	; PORTA<7:0> = 0
    CLRF    ANSELA,1	; PortA digital
    BSF	    TRISA,3,1	; RA3 como entrada
    BSF	    WPUA,3,1	; Activamos la resistencia Pull-Up del pin RA3
    RETURN 
    
Reseteo: 
    BTFSC   PORTA,3,0  ;PORTA<3> = 0? - Button press?
    GOTO    Loop
    RETURN
    
Reseteo1:
    BTFSS   PORTA,3,0  ;PORTA<3> = 1? - Button press?
    GOTO    Letras
    RETURN
    
END resetVect 