//***********************************************************
//	ZELDA II - ADVENTURE OF LINK REDUX
//***********************************************************

//****************************************
// 	Table file
//****************************************
table code/text/text.tbl

//***********************************************************
//	Manual save
//***********************************************************

bank 0;
// Change save input from controller 2 to controller 1
org $A19F	// 0x021AF
	lda.b $F7	// Originally LDA $F8, Controller 2
	
org $A1B3	// 0x021C3
	jsr save_count	// $A8A0, Originally LDA #$05
	nop		// Originally STA $0736
	nop

// Change save input from controller 2 to controller 1 at Pause Pane
org $A1DD	// 0x021ED
	lda.b $F7	// Originally LDA $F8, Controller 2

org $A251	// 0x02261
	lda.b #$9C	// Originally LDA #$FA, Controller 1? (Magic bag tile?)

org $A25D	// 0x0226D
	jsr l_ABA0	// $ABA0, Originally LDA $F7, Controller 1
	fill $06,$EA
	rts

org $A826	// 0x02836
	jsr $AD00	// Originally STA $9607

// UNUSED / FREE SPACE
org $A8A0	// 0x028B0
save_count:
	lda.b #$1E
	sta.w $00FE
	lda.b #$05
	sta.w $0736	// Game mode address
	rts 

// UNUSED SPACE - (POSSIBLY NMI FOR ANIMATION/SWAP)
org $AA40	// 0x02A50
	lda.b $12	// Load Frame counter
	and.b #$30
	lsr
	lsr
	lsr
	lsr
	tay
	lda.w l_AA70,y	// Load table at $AA70
	sta.w $A000
	lda.w l_AA80,y
	sta.w $A000
	lda.w l_AA90,y
	sta.w $A000
	lda.w l_AAA0,y
	sta.w $A000	
	lda.w l_AAB0,y
	sta.w $A000
	rts
org $AA70
l_AA70:
	db $10,$10,$10,$10
org $AA80
l_AA80:
	db $08,$01,$00,$01
org $AA90
l_AA90:
	db $04,$00,$01,$01
org $AAA0
l_AAA0:
	db $02,$01,$01,$01
org $AAB0
l_AAB0:
	db $01,$01,$01,$01


// Unknown ???
org $AB10	// 0x02B20
	lda.w $0707	// Load current world
	rts
	lda.w $0706
	asl
	asl
	clc
	adc.w $0707	// Add into $0707 (World)
	adc.w $0748	// Add into overworld area outside of view
	sec
	sbc.b #$34
	tax
	lda.w l_AB30,x	// Load table at $AB30
	sta.w $0561	// Store into area code address
	jmp $C358
org $AB30	// 0x02B40
l_AB30:
	db $FF,$FF,$FF,$00,$0E,$FF,$00,$FF
	db $0F,$FF,$FF,$23,$FF,$24,$FF,$00



// Life counter change for manual save
org $AB96	// 0x02BA6
	inc.w $0700	// Increment Life counter address
	lda.w $0700	// Load life counter address
	dec.w $0700	// Decrement life counter address
	rts
l_ABA0:
	lda.b $F7	// Load controller 1 inputs
	and.b #$10	// Check if START has been pressed
	beq end		// BEQ $07, branch if equal to RTS
	cmp.b $00	// Compare if $00
	beq end		// BEQ $03, branch if equal to RTS
	jmp $ABB0	// Jump to $ABB0
end:
	rts

org $ABB0	// 0x02BC0
l_ABB0:
	lda.b #$00
	cmp.w $0727	// Load ??? from RAM
	beq routine	// BEQ $04, branch if equal to 
	inc.w $0524	// Increment Routine index
	rts
routine:
	lda.b #$58	// Load $58 into accumulator
	sta.w $0244	// Store at $0244 in RAM
	lda.b #$89	// Load $89 into accumulator
	sta.w $0245
	lda.b #$01
	sta.w $0246
	lda.b #$70
	sta.w $0247
	lda.b #$58
	sta.w $0248
	lda.b #$8B
	sta.w $0249
	lda.b #$01
	sta.w $024A
	lda.b #$78
	sta.w $024B
	lda.b #$58
	sta.w $024C
	lda.b #$8D
	sta.w $024D
	lda.b #$01
	sta.w $024E
	lda.b #$80
	sta.w $024F
	lda.b #$58
	sta.w $0250
	lda.b #$8F
	sta.w $0251
	lda.b #$01
	sta.w $0252	
	lda.b #$88
	sta.w $0253
	lda.b #$58
	sta.w $0254
	lda.b #$91
	sta.w $0255
	lda.b #$01
	sta.w $0256
	lda.b #$90
	sta.w $0257
	lda.b #$58
	sta.w $0258
	lda.b #$93
	sta.w $0259
	lda.b #$01
	sta.w $025A
	lda.b #$98
	sta.w $025B

	inc.w $0524	// Increment Routine index
	lda.b #$18	// Load $18 into accumulator
	cmp.w $00FE
	beq cont2	// BEQ $06, branch if equal to
	lda.b #$18
	sta.w $00FE
	rts
cont2:
	lda.b #$F8	// Load controller 1 inputs
	sta.w $00FE
	rts

// Force Lives counter to print out max number of 9
org $AC60	// 0x02C70
	lda.w $079E
	lda.w $0700	// Load current number of lives
	sta.w $079E
	lda.b #$09
	cmp.w $079E
	bpl decrement	// BPL $06, Branch on plus to
	lda.b #$0A
	sta.w $079E
	rts
decrement:
	inc.w $079E
	lda.w $079E
	dec.w $079E
	rts


//***********************************************************
//	Permanent Link Dolls
//***********************************************************

bank 7;
// Jump to custom subroutine
org $C182	// 0x1C192
	jsr $FF4C	// Permanent frame counter, jump to $FF4C

// Related to Link Dolls hack
org $C1F6	// 0x1C206
	bmi $0E		// Originally BCC $0E

// Routine to modify the number of lives depending on the number of Link Dolls collected
org $C358	// 0x1C368
	jsr $D3B0	// Originally LDA #$03
	nop		// STA $0700
	nop
// Related to the number of lives
org $CA9C	// 0x1CAAC
	jsr $D3A0	// Originally LDA $079F
org $CAD0	// 0x1CAE0
	jsr $AB10	// Originally JSR $CF30
	cmp.b #$03	// Originally CMP #$0F
	bcs $07		// Originally BEQ $07/$1CADE
org $CADE	// 0x1CAEE
	jsr $AB14	// Originally JSR $C358
	lda.b #$00
	nop
	nop
	nop

// Related to Link Dolls hack
org $C3D4	// 0x1C3E4
	jsr $FF5E	// Originally LDA $0700

// ???
org $C436	// 0x1C446
	jsr $A900	// Originally STA $075F


// Unknown Table (?)
org $C9EA	// 0x1C9FA
	db $07,$26,$07,$26,$20,$C5,$FF	// Originally 12 16 2A 16 20 C5 FF


// HUD Tile mapping PPU transfers
org $D0D1	// 0x1D0E1
	db $20,$78,$06	// PPU transfer to $2078
	db $FB,"LEVEL"	// Triangle + LEVEL tiles
l_D0DA:		// 0x1D0EA
	db $20,$6E,$05	// PPU transfer to $206E
	db $FB,"EXP",$FB// Triangles + EXP tiles
l_D0E2:		// 0x1D0F2
	db $20,$57,$04	// PPU transfer to $2057
	db $C9,"  ",$FA	// Sword and Shield tiles
l_D0E9:		// 0x1D0F9
	db $20,$5D,$01	// PPU transfer to $205D
	db $F8
l_D0ED:		// 0x1D0FD
	db $20,$41,$01	// PPU transfer to $2041
	db " "
l_D0F1:		// 0x1D101
	db $20,$54,$01	// PPU transfer to $2054
	db "0"
l_D0F5:		// 0x1D105
	db $20,$7E,$01
	db $FB		// Triangle tile

// Manual save fix so the game doesn't count saves as Deaths
org $D3A0
	lda.w $0700	// Load number of lives
	beq l_D3A8	// Branch if equal to $00
	lda.b #$FF	// Load $FF into accumulator
	rts
l_D3A8:
	lda.w $079F	// Load number of continues used
	rts
l_D3AC:
	fill $04,$FF
l_D3B0:
	lda.b #$00	// Load $00 into accumulator
	cmp.w $0795	// Compare with value at $0795 ($03)
	beq l_D3BE	// Branch if equal to $03
	lda.w $0795	// Load value at $0795
	sta.w $0700	// Store as number of lives
	rts
l_D3BE:
	lda.b #$03	// Load $03 into accumulator
	sta.w $0795	// Store $03 at $0795
	sta.w $0700	// Store $03 as number of lives
	rts

// Load current life left in Meter for HUD update
org $D4D1	// 0x1D4E1
	lda.w $0774	// Originally LDA $0565

// Jump to new Link Doll routine
org $E818	// 0x1E828
	jsr $FF57	// Originally INC $0700

// Link Doll permanent lives increment
org $FF4C	// 0x1FF5C
	lda.w $0768	// Load PPU register flags
	bne l_FF54	// BNE $03, Branch if not $00
	jsr $AA40	// Jump to $2A30
l_FF54:		// 0x1FF64
	inc.b $12	// Increment frame counter
	rts
l_FF57:		// 0x1FF67
	inc.w $0700	// Increment number of lives
	inc.w $0795	// Increment Max number of lives
	rts
l_FF5E:		// 0x1FF6E
	lda.w $079E	// Load value at $079E (Dolls?)
	lda.b #$09	// Load $09 into accumulator
	cmp.w $0700	// Compare to number of lives
	bpl l_FF69	// BPL $01, Branch on plus
	rts
l_FF69:		// 0x1FF79
	lda.w $0700
	sta.w $079E
	rts
