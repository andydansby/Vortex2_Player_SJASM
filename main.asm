;Test codes (commented)
;Entry and other points
;START initialize playing of module at MDLADDR
;START+3 initialization with module address in HL
;START+5 play one quark
;START+8 mute
;START+10 setup and status flags
;START+11 current position value (byte) (optional)

;START
;	LD HL,MDLADDR	;START
;	JR INIT			;START+3
;	JP PLAY			;START+5
;	JR MUTE			;START+8
;SETUP	DB 0 		;START+10
;CurPos	DB 0 		;START+11

	ORG #8000
	OUTPUT "output.bin"
	
    LD A,2	
    LD (START+10),A
	ld hl, song1
	
    CALL START+3	
    EI

_LP:
	HALT
	
	CALL START+5	
	XOR A	;test keyboard	
	IN A,(#FE)	
	CPL	
	AND 15	
	JR Z, _LP
	
	JP START+8	
ret
	
	ORG #c000
	OUTPUT "PTZX.bin"
	include "PTZX.asm"
	;include "PTxPlay.asm"
; *** Song ***
song1
    incbin "songs\Nostalgy.pt3"
	;incbin "music.pt3"
