//****************************************************************
//	Remove the Text printing sound from Dialog boxes
//****************************************************************

bank 3;
// Sound for Text printing per-character
org $B746	// 0x0F756
	lda.b #$00	// Originally LDA #$60
	sta.b $EC	// Originally STA $EC, SFX Type 1
// Changed SFX Type from 1 to 3
