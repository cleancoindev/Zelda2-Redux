//*******************************************************************
//		New GFX (by darthvaderx)
// Combines assets from Rev Edition (Revility) and
// New Link Sprites (Falchion22) into Zelda 2 Redux
//******************************************************************* 

bank 0;
// Palette for Falling Animation
org $A849	// 0x02859
	db $0F,$07,$37,$29	// Originally [0F 18 36 2A]
// Palette for Flashing Link
org $A9F0	// 0x02A00
	db $12,$16,$29		// Originally [12 16 2A]
org $AA05	// 0x02A15
	db $01,$29,$11		// Originally [01 2A 11]

bank 1;
// Palette for West Hyrule Grass
org $8036	// 0x04046
	db $0F,$29,$27,$17	// Originally [0F 29 19 09]
// Palette for Link (Grass, Desert, Swamp, Graveyard and Lava)
org $809E	// 0x040AE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palette for Link (Forest)
org $80AE	// 0x040BE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palette for Link (Unknown)
org $80BE	// 0x040CE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palette for Link (Unknown)
org $80CE	// 0x040DE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]

bank 2;
// Palette for East Hyrule Forest
org $8036	// 0x008046
	db $0F,$29,$27,$17	// Originally [0F 29 19 09]
// Palette for Link (Grass, Desert, Swamp, Graveyard and Lava)
org $809E	// 0x0080AE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palette for Link (Palisade Pass)
org $80AE	// 0x0080BE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palette for Link (Unknown)
org $80BE	// 0x0080CE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palette for Link (Unknown)
org $80CE	// 0x0080DE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]

bank 3;
// Palettes for East Hyrule Forest
org $8072	// 0x00C082
	db $0F,$30,$17,$07	// Originally [0F 30 29 17]
org $8092	// 0x00C0A2
	db $0F,$30,$17,$07	// Originally [0F 30 29 17]
// Palette for Link (Grass, Desert, Swamp, Graveyard and Lava)
org $809E	// 0x00C0AE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palettes for Link (Unknown)
org $80AA	// 0x00C0BE
	db $FF,$0F,$11,$37	// Originally [FF 0F 13 36] 
	db $FF,$07,$37,$29
org $80BA	// 0x00C0CA
	db $FF,$01,$2D,$37	// Originally [FF 03 10 36]
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
org $80CE	// 0x00C0DE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
org $80DE	// 0x00C0EE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]

bank 4;
// Palettes for Palaces Type A/B
// Palettes for Link (Unknown)
org $809E	// 0x0100AE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
org $80AE	// 0x0100BE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A] 
org $80BE	// 0x0100BE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
org $80CE	// 0x0100DE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palettes for Palaces (A/B)
// Palace 1 Entrance
org $8474	// 0x010484
	db $22,$0F,$27,$30	// Originally [22 0F 10 30]
// Palace 2 Entrance
org $8484	// 0x010494
	db $22,$0F,$11,$31	// Originally [22 0F 1C 3C]
// Palace 3 Entrance
org $8494	// 0x0104A4
	db $22,$0F,$1C,$3C	// Originally [22 0F 06 26]
// Palettes for Palaces
org $BF04	// 0x013F14
	db $0F,$17,$27,$30	// Originally [0F 00 10 30]
	db $0F,$17,$16,$30	// Originally [0F 00 16 30]
org $BF14	// 0x013F24
	db $0F,$0F,$0A,$2A	// Originally [0F 0C 1C 3C]
	db $0F,$0A,$16,$30	// Originally [0F 0C 16 30]
org $BF24	// 0x013F34
	db $0F,$0C,$1C,$3C	// Originally [0F 0F 06 26]
	db $0F,$0C,$16,$30	// Originally [0F 06 16 30]
org $BF44	// 0x013F54
	db $0F,$0F,$11,$31	// Originally [0F 0F 0A 2A]
	db $0F,$11,$16,$30	// Originally [0F 0A 16 30]

bank 5;
// Palettes for Great Palace
// Palettes for Link (Unknown)
org $809E	// 0x0140AE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
org $80AE	// 0x0140BE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A] 
org $80BE	// 0x0140BE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
org $80CE	// 0x0140DE
	db $FF,$07,$37,$29	// Originally [FF 18 36 2A]
// Palettes for Intro
org $AF40	// 0x016F50
	db $0F,$28,$11,$16	// Originally [0F 30 1C 15]
	db $0F,$27,$0F,$07	// Originally [0F 2B 0F 00]
org $AF54	// 0x016F64
	db $0F,$27,$0F,$07	// Originally [0F 2B 0F 00]
	db $0F,$0C,$00,$30	// Originally [0F 16 26 30]
// Palette for Selection Screen (Link)
org $BC08	// 0x017C18
	db $0F,$07,$37,$29	// Originally [0F 18 36 2A]

bank 7;
// Table for a Link Palette PPU Transfer
org $8453	// 0x01C463
	db $0F,$07,$37,$29	// Originally [0F 18 36 2A]
	db $FF			// End byte
// Table for an Overworld Palette PPU Transfer
	db $3F,$00,$20		// PPU Transfer to $3F00
	db $0F,$18,$2A,$1A	// Originally [0F 30 29 19]
org $8467	// 0x01C477
	db $0F,$30,$38,$21	// Originally [0F 30 36 21]
	db $0F,$07,$37,$29	// Originally [0F 18 36 2A]

bank 8;
// Import the new graphics
org $20000	// 0x020000
	incbin code/optional/RevilityGFX.bin

