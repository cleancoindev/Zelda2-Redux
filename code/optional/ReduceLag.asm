//****************************************************************
// Reduce screen lag by reducing max number of spawnable enemies
//****************************************************************

bank 1;
org $9B3B	// 0x05B4B
// Reduce maximum number of enemies from the spawner from $05 to $02
	ldx.b $02
