;--------------------------------------------------------------------------------------------
; @file   Retardos.inc
; @author Jefferson Armando Sampen Chancafe    	
; @date   14/01/2023
; @IDE    MPLAB X IDE v6.00
; @brief  Librería con múltiples subrutinas de retardos, utilizando una frecuencia de 4MHz,
; sabiendo que cada ciclo máquina son 4 ciclos de reloj resulta que  cada ciclo máquina tarda 
; "Tcy" = 4 x 1/4MHz = 1 µs  
;--------------------------------------------------------------------------------------------

PSECT udata_acs
    contador1: DS 1		    ;reserva 1 byte en access ram
    contador2: DS 1		    ;reserva 1 byte en access ram
    contador3: DS 1		    ;reserva 1 byte en access ram
    
PSECT code    
    
    Delay_132ms:		    ;  CALL aporta 2Tcy
	MOVLW   132		    ;  1Tcy, siendo este el valor de "L"
	MOVWF   contador2,0	    ;  1Tcy
    Ciclo1:		    
	MOVLW   249		    ;  L*1Tcy. Este es el valor de "M".
	MOVWF   contador1,0	    ;  L*1Tcy
    Ciclo2:
	NOP			    ;  M*L*1Tcy
	DECFSZ  contador1,1,0	    ;  (M-1)*L*1Tcy + L*3Tcy
	GOTO    Ciclo2		    ;  (M-1)*L*2Tcy
	DECFSZ  contador2,1,0	    ;  (L-1)*1Tcy + 3Tcy
	GOTO    Ciclo1		    ;  (L-1)*2Tcy
	RETURN			    ;  RETURN aporta 2Tcy
    
    Retardo_250ms:		    ;  CALL aporta 2Tcy
	MOVLW   250		    ;  1Tcy, siendo este el valor de "L"
	MOVWF   contador2,0	    ;  1Tcy
    Ciclo3:		    
	MOVLW   249		    ;  L*1Tcy. Este es el valor de "M"
	MOVWF   contador1,0	    ;  L*1Tcy
    Ciclo4:
	NOP			    ;  M*L*1Tcy
	DECFSZ  contador1,1,0	    ;  (M-1)*L*1Tcy + L*3Tcy
	GOTO    Ciclo4		    ;  (M-1)*L*2Tcy
	DECFSZ  contador2,1,0	    ;  (L-1)*1Tcy + 3Tcy
	GOTO    Ciclo3		    ;  (L-1)*2Tcy
	RETURN			    ;  RETURN aporta 2Tcy
	
    Retardo_500ms:		    ;  CALL aporta 2Tcy
	MOVLW   50		    ;  1Tcy, siendo este el valor de "L"
	MOVWF   contador3,0	    ;  1Tcy
    Ciclo5:	
	MOVLW   10		    ;  L*1Tcy. Este es el valor de "M"
	MOVWF   contador2,0	    ;  L*1Tcy
    Ciclo6:    
	MOVLW   250		    ;  M*L*1Tcy. Este es el valor de "K"
	MOVWF   contador1,0	    ;  M*L*1Tcy
    Ciclo7:
	NOP			    ;  K*M*L*1Tcy
	DECFSZ  contador1,1,0	    ;  (K-1)*M*L*1Tcy + M*L*3Tcy
	GOTO    Ciclo7		    ;  (K-1)*M*L*2Tcy
	DECFSZ  contador2,1,0	    ;  (M-1)*L*1Tcy + 3*L*Tcy
	GOTO    Ciclo6		    ;  (M-1)*L*2Tcy
	DECFSZ  contador3,1,0	    ;  (L-1)*1Tcy + 3*Tcy
	GOTO    Ciclo5		    ;  (L-1)*2Tcy
	RETURN			    ;  RETURN aporta 2Tcy  
	
;-------------------------------------------------------------------------------------------