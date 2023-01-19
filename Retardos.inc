;-----------------------------------------------------------------------------------------
; @file   Retardos.inc
; @author Jefferson Armando Sampen Chancafe    	
; @date   08/01/2023
; @IDE    MPLAB X IDE v6.00
; @brief  Librería con múltiples subrutinas de retardos, desde 10µs hasta 250ms utilizando
; una frecuencia de 4MHz,sabiendo que cada ciclo máquina son 4 ciclos de reloj resulta que 
; cada ciclo máquina tarda "Tcy" = 4 x 1/4MHz = 1 µs  
;-----------------------------------------------------------------------------------------

PSECT udata_acs
contador1: DS 1			;reserva 1 byte en access ram
contador2: DS 1			;reserva 1 byte en access ram
    
PSECT code    

;RETARDOS de 10µs hasta 500µs
    ;Retardo_10us
    ;T=(3K+7)*Tcy  
    Retardo_10us:			;  CALL aporta 2Tcy
	MOVLW  1			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
    Ciclo1:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo1			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy 

    ;Retardo_25us
    ;T=(3K+7)*Tcy
    Retardo_25us:			;  CALL aporta 2Tcy
	MOVLW  6			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
    Ciclo2:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo2			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy
	
    ;Retardo_50us
    ;T=(3K+8)*Tcy
    Retardo_50us:			;  CALL aporta 2Tcy
	MOVLW  14			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
	NOP				;  1Tcy
    Ciclo3:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo3			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy

    ;Retardo_100us
    ;T=(3K+7)*Tcy
    Retardo_100us:			;  CALL aporta 2Tcy
	MOVLW  31			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
    Ciclo4:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo4			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy
	
    ;Retardo_200us
    ;T=(3K+8)*Tcy
    Retardo_200us:			;  CALL aporta 2Tcy
	MOVLW  64			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
	NOP				;  1Tcy
    Ciclo5:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo5			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy
	
    ;Retardo_250us
    ;T=(3K+7)*Tcy
    Retardo_250us:			;  CALL aporta 2Tcy
	MOVLW  81			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
    Ciclo6:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo6			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy
	
    ;Retardo_500us
    ;T=(3K+8)*Tcy
    Retardo_500us:			;  CALL aporta 2Tcy
	MOVLW  164			;  1Tcy, siendo este el valor de "K"
	MOVWF  contador1,0		;  1Tcy
	NOP				;  1Tcy
	NOP				;  1Tcy
    Ciclo7:
	DECFSZ contador1,1,0		;  (K-1)Tcy + 3*Tcy
	GOTO   Ciclo7			;  (K-1)Tcy * 2Tcy
	RETURN				;  RETURN aporta 2Tcy
	
;-----------------------------------------------------------------------------------------
;RETARDOS de 1ms hasta 250ms
    ;Retardo_(1-5-10-25-50-100-200-250)ms
    ;En tota las subrutinas tardan: (2 + 1 + 2 + (4ML + 4L + 4))Tcy
    Retardo_1ms: 			;  CALL aporta 2Tcy
		MOVLW	1		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_5ms: 			;  CALL aporta 2Tcy
		MOVLW	5		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_10ms: 			;  CALL aporta 2Tcy
		MOVLW	10		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_25ms: 			;  CALL aporta 2Tcy
		MOVLW	25		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_50ms: 			;  CALL aporta 2Tcy
		MOVLW	50		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_100ms: 			;  CALL aporta 2Tcy
		MOVLW	100		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_200ms: 			;  CALL aporta 2Tcy
		MOVLW	200		;  1Tcy, siendo este el valor de "L"
		GOTO	Retardos_ms	;  GOTO aporta 2Tcy
    Retardo_250ms: 			;  CALL aporta 2Tcy
		MOVLW	250		;  1Tcy, siendo este el valor de "L"
;El siguiente bloque "Retardos_ms" tarda:
; = (1 + L + L +  M*L + (M-1)*L + L*3 + (M-1)*L*2 + (L-1) + 3 + (L-1)*2 + 2)Tcy 
; = (4ML + 4L + 4)Tcy, por ejm para L=1 y M=249 supone 1004Tcy = 1004µs = 1.004ms    
    Retardos_ms: 
		MOVWF   contador2,0	;  1Tcy 
    Ciclo9:				  
	    MOVLW   249			;  L*1Tcy. Este es el valor de "M".
	    MOVWF   contador1,0		;  L*1Tcy
    Ciclo8:
	    NOP				;  M*L*1Tcy
	    DECFSZ  contador1,1,0	;  (M-1)*L*1Tcy + L*3Tcy 
	    GOTO    Ciclo8		;  (M-1)*L*2Tcy
	    DECFSZ  contador2,1,0	;  (L-1)*1Tcy + 3Tcy 
	    GOTO    Ciclo9		;  (L-1)*2Tcy
	    RETURN			;  RETURN aporta 2Tcy
	    
;-------------------------------------------------------------------------------------------