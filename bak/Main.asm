; do not delete this code; it is required to run the program.
; 10 SYS (2064)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $30, $36, $34, $29, $00, $00, $00



; program entrance
*=$0810
PROGRAM_START
; start your code here

;Copy Sprite Data 
        LDX #63
build_ant_loop
        LDA ANT_DATA,X
        STA $2E80,X
        DEX
        BNE build_ant_loop

;Set the Sprite pointer for Sprite 0

        ;Value after dividing the memory address for the first pixel of the 
        ;sprite by 64
        LDA #186

        ;Store Sprite at locations
        LDX #8
store_sprite_loop
        STA $07F7,X
        DEX
        BNE store_sprite_loop
        ;Set Sprite Locations
        

;Set the sprites color position and then make it visible
        ;Set Sprite Color
        LDA #0
        STA $D027
        ;Set Sprite (x,y) Position
        LDX #15
set_sprite_position_loop
        LDA #100
        STA $D000,X
        STA $D001,X
        DEX
        BNE set_sprite_position_loop
        ;Enable all sprites
        LDA #128
        STA $D015
; do not write code past this line
; the following rts instruction is required to exit the program
        RTS

; pixel data for the ant
ANT_DATA
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$01
 BYTE $00,$00,$61
 BYTE $00,$00,$11
 BYTE $00,$00,$0E
 BYTE $00,$00,$1F
 BYTE $00,$00,$1F
 BYTE $0F,$1F,$B5
 BYTE $10,$A0,$7F
 BYTE $2F,$CF,$DF
 BYTE $5F,$DF,$BF
 BYTE $5F,$DF,$BA
 BYTE $BF,$DF,$A9
 BYTE $BF,$BF,$C4
 BYTE $FA,$1F,$A0
 BYTE $92,$12,$90
 BYTE $21,$24,$88
 BYTE $21,$24,$48
 BYTE $21,$24,$44
 BYTE $00

