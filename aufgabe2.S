// Name:ATHALA, ASTERO WAHYU		Matrikelnummer:1130003
// Name:				Matrikelnummer:
// Datum:

	.file	"aufgabe2.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	LDR	r1, =marke
	
	MOV	r0, #0
	CMP	r0, #3


	BNE	marke
	
	MOV 	r0, #0 @wird nicht durchgefuehrt, wenn springt 


	bx	lr
marke:	.word	0x12345678

	MOV	r0, #1 @wird durchgefuehrt, wenn dieses Branch besucht
	
.Lfe1:
	.size	main,.Lfe1-main

	.data
marke1:	.word 0x87654321

// End of File
