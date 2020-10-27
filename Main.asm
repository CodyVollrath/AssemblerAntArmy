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

;Set the Sprite pointer for Sprites
        LDA #186 ;First memory Location for ANT_DATA ($2E80) divided by 64
        LDX #7
store_sprite_loop
        STA $07F8,X
        DEX
        BPL store_sprite_loop

;Change Background color
        LDA #8
        STA $D021

;Set Sprite Color
        LDX #7
set_sprite_color_loop
        STX $00FB   ;Unused Zero Page memory location to hold X register's value
        LDA $00FB   ;Store the current X value in the accumulator
        STA $D027,X ;Load the X value at the Xth position of the memory range
        DEX
        BPL set_sprite_color_loop

;Set X Position
        LDA #170 ;Starting at 170 for the X position
        LDX #14
set_sprite_x_position
        STA $D000,X
        DEX
        DEX
        BPL set_sprite_x_position

;set Y position
        LDA #70 ;Start at 70 for the Y position
        LDX #15
set_sprite_y_position
        DEX
        STA $D001,X
        ADC #18 ;Increase the Y position by 18 for each odd interval
        DEX
        BPL set_sprite_y_position

;Enable all sprites (Make visible)
        LDA #255
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

