;------------------------------------------------------------------------------------------------------
; @file   Retardos.inc
; @author Jefferson Armando Sampen Chancafe    	
; @date   14/01/2023
; @IDE    MPLAB X IDE v6.00
; @brief  Librería con del retardo de 1 seg utilizando una frecuencia de 4MHz,sabiendo que  cada ciclo
; máquina son 4 ciclos de reloj resulta que cada ciclo máquina tarda "Tcy" = 4 x 1/4MHz = 1 µs  
;------------------------------------------------------------------------------------------------------

PSECT udata_acs
    contador1: DS 1		    ;reserva 1 byte en access ram
    contador2: DS 1		    ;reserva 1 byte en access ram
    contador3: DS 1		    ;reserva 1 byte en access ram
    
PSECT code    
    
    Delay_1s:			    ;  CALL aporta 2Tcy
	MOVLW   100		    ;  1Tcy, siendo este el valor de "L"
	MOVWF   contador3,0	    ;  1Tcy
    Ciclo1:	
	MOVLW   10		    ;  L*1Tcy. Este es el valor de "M"
	MOVWF   contador2,0	    ;  L*1Tcy
    Ciclo2:    
	MOVLW   250		    ;  M*L*1Tcy. Este es el valor de "K"
	MOVWF   contador1,0	    ;  M*L*1Tcy
    Ciclo3:
	NOP			    ;  K*M*L*1Tcy
	DECFSZ  contador1,1,0	    ;  (K-1)*M*L*1Tcy + M*L*3Tcy
	GOTO    Ciclo3		    ;  (K-1)*M*L*2Tcy
	DECFSZ  contador2,1,0	    ;  (M-1)*L*1Tcy + 3*L*Tcy
	GOTO    Ciclo2		    ;  (M-1)*L*2Tcy
	DECFSZ  contador3,1,0	    ;  (L-1)*1Tcy + 3*Tcy
	GOTO    Ciclo1		    ;  (L-1)*2Tcy
	RETURN			    ;  RETURN aporta 2Tcy  
	
;-------------------------------------------------------------------------------------------