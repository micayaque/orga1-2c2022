;pseudocodigo
;MOV R0 0x20  	;curvas atravesadas	
;[0xF0] = 0x0F 	;velocidad
;[0xF1] = 0x02 	;bocina

;rai: 	if [0xF0] == 0x0C then 
;			[0xF0] = 0x0F
;			DEC R0
;		else
;			[0xF0] = 0x0C
;		end if
		
;bocina:
;		if R0 == 0x00 then 
;			INC [0xF1] 
;			MOV R0,0x20
;		end fi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;asm

main:	SET R0, 0x20 ; 	curvas atravesadas
		SET R1, 0x0F ; 	velocidad
		STR [0xF0], R1
		SET R2, 0x02 ; 	intensidad de la bocina
		STR [0xF1], R2

intensidad: LOAD R2, [0xF1]
			INC R2
			STR [0xF1], R2

rai: 	CMP R1, 0x0C
		JZ velocidadFinCurva
		CMP R1, 0x0F
		JZ velocidadInicioCurva
		IRET

velocidadFinCurva: 	SET R1, 0x0F
					STR [0xF0], R1
					DEC R0
					CMP R0, 0x00
					JZ intensidad
					IRET

velocidadInicioCurva: 	SET R1, 0x0C
						STR [0xF0], R1
						IRET