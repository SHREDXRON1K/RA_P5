// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe3.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
	
	
	
main:
	LDR	r4, =Total
	LDR	r5, =Table
	LDR	r6, =Count
	


//Das MU1-Programm wurde in ARM umgesetzt, ohne Selbstmodifikation.
//Der Tabellenzugriff erfolgt durch einen Pointer (r5), welcher nach jedem
//LDR-Befehl mit post-increment (#4) auf den nächsten Eintrag zeigt.
//Der Simulator führt den Code korrekt aus, da keine Trennung zwischen
//Instruktions- und Datencache auftritt. Mit Breakpoints kann man den
//sich ändernden Speicherwert Total beobachten.
	
	
	
	
Loop:
	LDR	r0, [r4]
	LDR	r1, [r5], #4	@post increment, wb
	ADD	r0, r0, r1
	STR r0, [r4]            @ write total back

    	LDR r2, [r6]            @ load count
    	SUB r2, r2, #1          @ decrement
    	STR r2, [r6]
   	CMP r2, #0
    	BNE Loop


Halt:
	b	Halt

//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	4
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17


.Lfe1:
	.size	main,.Lfe1-main

// End of File
