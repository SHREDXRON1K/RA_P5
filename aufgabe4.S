// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe4.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
	
main:

// In MU1 the ADD-instruction operand was modified in memory each loop.
// On ARM, code is stored in the .text section (typically ROM or Flash).
// ROM cannot be modified at runtime and instructions are fetched via an
// instruction pipeline, often separated from data memory by I/D caches.
// Therefore self-modifying code would require cache invalidation + ISB.
// We avoid this by placing all changing values in RAM (.data) and using
// a pointer to iterate through the table instead of rewriting code.


    LDR r4, =Total          @ pointer to Total        (RAM)
    LDR r5, =Table          @ pointer to Table        (RAM)
    LDR r6, =Count          @ pointer to Count        (RAM)

Loop:
    LDR r0, [r4]            @ r0 = Total
    LDR r1, [r5], #4        @ r1 = *Table; increment pointer to next entry
    ADD r0, r0, r1          @ Total += table value
    STR r0, [r4]            @ write back

    LDR r2, [r6]            @ load Count
    SUB r2, r2, #1          @ Count--
    STR r2, [r6]
    CMP r2, #0
    BNE Loop                @ loop until Count reaches 0
    

Halt:
    B Halt                  @ stop here forever


.Lfe1:
	.size	main,.Lfe1-main

	.data
//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	5
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17

	

// End of File

