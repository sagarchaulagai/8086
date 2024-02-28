data SEGMENT
    arr   DW 0010H, 52H, 30H, 40H, 50H   ; Array of words
    lar DW ?                           ; Variable to store the largest element
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data

START:
    MOV AX, data     ; Load data segment address into AX
    MOV DS, AX       ; Initialize DS with the base address of the data segment

    MOV CX, 05H      ; Set CX to the number of elements in the array
    LEA SI, arr        ; Load effective address of array X into SI
    MOV AX, [SI]     ; Load the first element into AX
    DEC CX           ; Decrement the counter

UP:
    CMP AX, [SI + 2] ; Compare current element with the next element
    JA CONTINUE      ; Jump if the next element is greater

    MOV AX, [SI + 2] ; Update AX with the greater element

CONTINUE:
    ADD SI, 2        ; Move to the next element in the array
    DEC CX           ; Decrement the counter
    JNZ UP           ; Jump if not zero (more elements to check)

    MOV lar, AX      ; Store the largest element in LAR

    ; Terminate the program
    MOV AH, 4CH
    INT 21H

code ENDS
END START
