
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

    //BASE_BANK 15;expanded area
    //BASE_BANK 16;expanded area
    //BASE_BANK 17;expanded area
    //BASE_BANK 18;expanded area
    //BASE_BANK 19;expanded area
    //BASE_BANK 20;expanded area
    //BASE_BANK 21;expanded area
    //BASE_BANK 22;expanded area
    //BASE_BANK 23;expanded area
    //BASE_BANK 24;expanded area
    //BASE_BANK 25;expanded area
    //BASE_BANK 26;expanded area
    //BASE_BANK 27;expanded area
    //BASE_BANK 28;expanded area
    //BASE_BANK 29;expanded area
    //BASE_BANK 30;expanded area

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

    .include "banksel_hijack.asm"

  .bank 6 slot "ROM-LO"
  	.orga $B366
    ;  STA $7FEE,X  //cause bug(why this is exist?)
    NOP
    NOP
    NOP

  .bank 15 slot "ROM-LO"
  	.orga $8000
FONT_2BPP:
	.incbin "font.bin"
FONT_2BPP_END:


	.bank 31 slot "ROM-HI"	
   .orga $F500
MAPPER165BANK:
	PHA                      
	ASL A                    
	PHA                      
	LDA #BANKSEL.PRGLO                 
	STA MMC3BANKSEL                
	PLA                      
	STA MMC3BANKDATA               
	PHA                      
	LDA #BANKSEL.PRGHI                 
	STA MMC3BANKSEL                
	PLA                      
	CLC                      
	ADC #$01                 
	STA MMC3BANKDATA               
	PLA                      
	RTS  

RESET:                
  LDA #$00                 
  STA MMC3IRQLATCH                
  STA MMC3IRQDISABLE               
  LDA #$FF                 
  STA MMC3MIRROR                
  LDA #$80  
  STA MMC3PRGRAMPROTECT

  JSR INIT_CHR_RAM
               
  LDA #13                 
  JSR MAPPER165BANK

  JMP $C075  


INIT_CHR_RAM:              
  LDA #15                 
  JSR MAPPER165BANK             
            
	LDA #0                    
	JSR MAPPER165CHRHI1     
	JSR MAPPER165CHRHI2
 
  //backup $0000
  LDA $00                  
  PHA                      
  LDA $01                  
  PHA                      
  
  //initialize X and Y
  LDX #$00                 
  LDY #$00                 
  
  //Write where font is located on $0000
  LDA #<FONT_2BPP                 
  STA $00                  
  LDA #>FONT_2BPP                
  STA $01 
              
  //Do something on $1FD0... I don't know
  LDA #$1F                 
  STA PPUADDR         
  LDA #$D0                 
  STA PPUADDR
  LDA PPUDATA         
  LDA PPUDATA

  //Size of copy byte
  LDX #>(FONT_2BPP_END-FONT_2BPP)            
  LDY #<(FONT_2BPP_END-FONT_2BPP)

  //SELECT PPU $1000
  LDA #$10                 
  STA PPUADDR         
  LDA #$00                 
  STA PPUADDR

//Load font
LOOP_803A:  
  LDA ($00), Y              
  STA PPUDATA         
  INY                      
  BNE LOOP_803A                
  INC $01                  
  DEX                      
  BNE LOOP_803A   

   //Do something on $1FE0... I don't know
  LDA #$1F                 
  STA PPUADDR         
  LDA #$E0                 
  STA PPUADDR
  LDA PPUDATA         
  LDA PPUDATA

  //restore backup
  PLA                      
  STA $01                  
  PLA                      
  STA $00                  
  RTS     

MAPPER165CHRLO1:
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA                      
  TSX                           
  LDA #BANKSEL.CHRLO1                
  JMP MAPPER165CHR_COMMON1                                       
           
MAPPER165CHRLO2:
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA                      
  TSX                   
  LDA #BANKSEL.CHRLO2                    
  JMP MAPPER165CHR_COMMON1     

 MAPPER165CHRHI1:           
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA  
  TSX                      
  LDA #BANKSEL.CHRHI1
  JMP MAPPER165CHR_COMMON1                                       
                                  
MAPPER165CHRHI2:            
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA  
  TSX                                
  LDA #BANKSEL.CHRHI2            
  JMP MAPPER165CHR_COMMON1                                        
                              
MAPPER165CHR_COMMON1:   
  PHA           
  LDA $0103,X              
  NOP                      
  ASL A                    
  ASL A                    
  TAY
  PLA
  TAX   
  STX MMC3BANKSEL               
  STY MMC3BANKDATA  
  PLA                      
  TAY                      
  PLA                      
  TAX                      
  PLA                      
  RTS  

                    


.orga $FFFC
  .dw RESET
