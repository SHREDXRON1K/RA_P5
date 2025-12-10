// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe2.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:

	mov	r0, #3
	push	{lr}

	bl	up1
	bl	up2
	bl	up3
	
	pop		{pc}

// UP1 benutzt nur Scratchregister und stellt keine Blattroutine dar (ruft somit weitere
// Unterprogramme auf)	
up1:

	MOV	r12, lr		@save lr in scratchg register (no pushing)
			
	
	BL	upfrom1		@return, no stack, non leaf style

	ADD 	r0, r0, r0
	
	BX	r12		@return using scratch level LR
	

upfrom1:
	MOV	r0, r0, LSL #2
	BX	lr	


// UP2 benutzt nur Scratchregister und stellt eine Blattroutine dar (ruft somit keine weiteren
// Unterprogramme auf)
up2:
	MVN	r0, #0 		@ r0 = -1
	BX	lr


//UP3 benutzt Nicht-Scratchregister und stellt keine Blattroutine dar
up3:
	PUSH	{r5, r6, lr}		@r5 is non scratch, so must be saved
	MVN	r6, #0
	MOV	r5, r6, LSL #2
	BL 	upfrom3			@ non leaf, so calls subroutine
	POP	{r5, r6, pc}		@ restore r5 and return
	
upfrom3:
	MOV	r0, r0, ASR #2
	BX	lr
	



.Lfe1:
	.size	main,.Lfe1-main

// End of File


