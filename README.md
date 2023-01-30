# uC1_2022_Sampen_Jefferson

**Curso:* Microcontroladores I*

**Autor:* Sampen Chancafe, Jefferson Armando*
 
**Tarjeta:* Curiosity nano PIC18F57Q84*

**Entorno:* MPLAB X IDE v6.00*

**Lenguaje:* ASM - C*

**Universidad:* UNIVERSIDAD NACIONAL DE PIURA*

-  **TE1: Librería para implementación de retardos**

	> Esta es una librería con múltiples subrutinas de retardos, desde 10µs hasta 250ms utilizando una frecuencia de 4MHz, sabiendo que el ciclo máquina "Tcy"  tarda  = 4 x 1/4MHz = 1 µs.
-  **TE2: Practica de puertos**
     -  **P1-Corrimiento_Leds**
     > Este es un programa que permite realizar el corrimiento de leds conectados al puerto C, sabiendo que los corrimientos impares irán con un retardo de 250 ms, mientras que los corrimientos pares irán con un retardo de 500ms. Y al presionar el pulsador se iniciará el corrimiento y se detiene cuando se vuelve a presionar. Además se agregará dos leds en los pines RE0 (impar) y RE1 (par), para visualizar cuando se da el corrimiento de alguno de ellos.
     -  **P2-Display_7SEG**
	> Este es un programa que permita mostrar los valores alfanuméricos (0-9 y A-F) en un display de 7 segmentos ánodo común, conectados al puerto D con un retardo de 1s.  El display empezará a contar solamente los valores numéricos  (0-9)  sin que esté presionado el pulsador y  al mantenerlo presionado solamente mostrará las letras (A-F).
