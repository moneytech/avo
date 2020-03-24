// Code generated by command: go run asm.go -out issue122.s -stubs stub.go. DO NOT EDIT.

#include "textflag.h"

// func Triangle(n uint64) uint64
TEXT ·Triangle(SB), NOSPLIT, $0-16
	MOVQ n+0(FP), AX

	// Initialize sum register to zero.
	XORQ CX, CX

loop_even:
loop_odd:
	// Loop until n is zero.
	CMPQ AX, $0x00
	JE   done

	// Add n to sum.
	ADDQ AX, CX

	// Decrement n.
	DECQ AX

	// Jump to one of the loop labels depending on parity.
	TESTQ $0x00000001, AX
	JZ    loop_even
	JMP   loop_odd

done:
	// Store sum to return value.
	MOVQ CX, ret+8(FP)
	RET
