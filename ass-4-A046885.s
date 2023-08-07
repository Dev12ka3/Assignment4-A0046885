    .data
gradeA: .asciz "Congratulations! You got an A.\n"
gradeB: .asciz "Good job! You got a B.\n"
gradeC: .asciz "Not bad, you got a C.\n"
gradeF: .asciz "Sorry, you got an F.\n"

    .text
    .global _start

_start:
    MOV R5, #75

    CMP R5, #90
    BGE is_grade_A

    CMP R5, #75
    BGE is_grade_B

    CMP R5, #50
    BGE is_grade_C

    B is_grade_F

is_grade_A:
    LDR R0, =gradeA
    B print_message

is_grade_B:
    LDR R0, =gradeB
    B print_message

is_grade_C:
    LDR R0, =gradeC
    B print_message

is_grade_F:
    LDR R0, =gradeF
    B print_message

print_message:
    MOV R7, #4
    MOV R1, R0
    MOV R2, #0x100
    MOV R0, #1


exit_program:
    MOV R7, #1
    SWI 0x11

    .end
