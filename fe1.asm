
    .include "include/layout.asm"

    .include "include/constants/misc.asm"



    .macro BASE_BANK args BANKID

        .if BANKID < 31
            .bank BANKID slot "ROM-LO"
        .endif

        .if BANKID == 31
            .bank BANKID slot "ROM-HI"
        .endif

        .if BANKID >= 32
            .bank BANKID slot "CHR"
        .endif

        .org 0

        .if BANKID < 32
            .incbin "fe1-expand.nes" skip 16 + BANKID*$4000 read $4000
        .else
            .incbin "fe1-expand.nes" skip 16 + (32*$4000) + ((BANKID-32)*$1000) read $1000
        .endif

    .endm

    ; WRAM

    .include "include/wram.asm"
    .include "include/sram.asm"

    ; Base ROM data

    ; PRG banks
    BASE_BANK 0
    BASE_BANK 1
    BASE_BANK 2
    BASE_BANK 3
    BASE_BANK 4
    BASE_BANK 5
    BASE_BANK 6
    BASE_BANK 7
    BASE_BANK 8
    BASE_BANK 9
    BASE_BANK 10
    BASE_BANK 11
    BASE_BANK 12
    BASE_BANK 13
    BASE_BANK 14
    BASE_BANK 15
    BASE_BANK 16
    BASE_BANK 17
    BASE_BANK 18
    BASE_BANK 19
    BASE_BANK 20
    BASE_BANK 21
    BASE_BANK 22
    BASE_BANK 23
    BASE_BANK 24
    BASE_BANK 25
    BASE_BANK 26
    BASE_BANK 27
    BASE_BANK 28
    BASE_BANK 29
    BASE_BANK 30
    BASE_BANK 31

    ; CHR banks
    BASE_BANK 32
    BASE_BANK 33
    BASE_BANK 34
    BASE_BANK 35
    BASE_BANK 36
    BASE_BANK 37
    BASE_BANK 38
    BASE_BANK 39
    BASE_BANK 40
    BASE_BANK 41
    BASE_BANK 42
    BASE_BANK 43
    BASE_BANK 44
    BASE_BANK 45
    BASE_BANK 46
    BASE_BANK 47
    BASE_BANK 48
    BASE_BANK 49
    BASE_BANK 50
    BASE_BANK 51
    BASE_BANK 52
    BASE_BANK 53
    BASE_BANK 54
    BASE_BANK 55
    BASE_BANK 56
    BASE_BANK 57
    BASE_BANK 58
    BASE_BANK 59
    BASE_BANK 60
    BASE_BANK 61
    BASE_BANK 62
    BASE_BANK 63

    ; DISASSEMBLED DATA

  

    ; .bank 11 slot "ROM-LO"

   
    .bank 31 slot "ROM-HI"

    .orga $C000
   