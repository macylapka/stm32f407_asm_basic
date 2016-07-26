.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.section  .text
.weak     _main              /* that's because of declaring it as an entry point */
.type     _main, %function  

_main:
    mov r0, #1
    mov r1, #2
    add r0, r0, r1
    b _main

.size _main, . - _main

.section .int_vector_table, "a", %progbits   /* interrupt table */
                                             /* "a" - tells that section is allocatable  */
                                             /* (see ld manual) */
                                             /* %progbits - tells that section contains data */
                                             /* (see gas manual) */
.type basic_vectors, %object

basic_vectors:
    .word   _estack             /* stack top address (declared in basic.ld) - the last SRAM address */
    .word   _main              /* the address of a reset handler */

    .size   basic_vectors, . - basic_vectors

