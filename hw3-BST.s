		;		BST Program, search for value given in R0, return the address if found in R1. Return 0 in R1 if not found.
		;		left   right  value
node1	DCD		0x10C, 0x130, 4
node2	DCD		0x118, 0x124, 2
node3	DCD		0,	  0,	    1
node4	DCD		0,	  0,	    3
node5	DCD		0x13C, 0x148, 6
node6	DCD		0,     0,	    5
node7	DCD		0,	  0,	    7
		
		LDR		R0, =0
		LDR		R1, =0x100
loop		LDR		R2, [R1, #8]
		CMP		R2, R0
		BEQ		found
		CMP		R2, R0
		BLT		right
		CMP		R2, R0
		BGT		left
		
left
		LDR		R1, [R1]
		CMP		R1, #0  ; end search if address = 0
		BEQ		exit
		B		loop
		
right	LDR		R1, [R1, #4]
		CMP		R1, #0  ; end search if address = 0
		BEQ		exit
		B		loop
		
found	ADD		R1, R1, #8  ; return mem address containing the found value
		B		exit
		
exit
		END
