;
;	to compile this code
;	first create an object file
;	nasm -f elf -o main.o main-nasm.asm
;
;	to create an executeable, link it
;	gcc -m32 -o run main.o
;
;	run it:
;	./run

global getDivisorCount1

getDivisorCount1:
	push	ebp
	mov	ebp, esp

;add code from here

    	push	ebx		;pushing previous register values just in case
	push	ecx
	push 	edx

	mov	ebx, 0
	mov	ecx, [esp+20]

	startWhile:
	cmp	ecx, 0 
	je	endWhile

	;division
	mov	edx, 0 		;divison uses register pair edx:eax
	mov 	eax, [esp+20] 	;bp is not used 
	div	ecx		;divides value in eax by ecx

	dec	ecx

	cmp	edx, 0 		;division remainder is stored in edx
	jne 	startWhile	
	inc	ebx		;else increase count and jump back
	jmp	startWhile

	endWhile:
	pop edx
	pop ecx

;to here
	
	mov	eax, ebx
	pop	ebx	
	pop	ebp
	ret

global getDivisorCount2

getDivisorCount2:
	push	ebp
	mov 	ebp, esp

	push	ebx
	push	ecx
	push	edx

	mov	ecx, [ebp+8]	;ebp+8 has leftmost parameter
	mov ebx, 0

	startFor:
	cmp	ecx, 0
	je	endFor

	mov	edx, 0		;division using edx:eax
	mov 	eax, [ebp+8]
	div	ecx

	cmp	edx, 0	
	je	incCount	;jump equals	
	jne	nincCount	;jump not equals

	incCount:
	inc ebx
	nincCount:
	loop 	startFor

	endFor:
	mov	eax, [ebp+12]	;writing return reference to eax
	mov 	[eax], ebx	;writing result in ebx to dereferenced address

	pop	edx
	pop	ecx
	pop ebx
	
	mov eax, 0
	pop ebp
	ret
