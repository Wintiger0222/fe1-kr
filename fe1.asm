
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

  

    .bank 5 slot "ROM-LO"
	.orga $810E;1410E
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $8113;14113
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
   
	.orga $85E9;145E9
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	
	.orga $880E;1480E
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2
   
	.orga $8D25;14D25
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	
	.orga $962F;1562F
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A2F8;162F8
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A382;16382
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A3D6;163D6
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1	
	.orga $A413;16413
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A527;16527
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A584;16584
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A642;16642
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A6DE;166DE
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A77E;1677E
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A807;16807
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A86E;1686E
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A890;16890
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A911;16911
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A962;16962
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A9A1;169A1
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $A9F1;169F1
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $AA64;16A64
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $AAD1;16AD1
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $AB16;16B16
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $AB69;16B69
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $ACB6;16CB6
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1

    .bank 7 slot "ROM-LO"
	.orga $AC35;1EC35
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2

    .bank 11 slot "ROM-LO"
	.orga $9BF2;2DBF2
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2

	.orga $9EB9;2DEAE
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2


	
	
    .bank 13 slot "ROM-LO"
	.orga $8036;34036
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2
	
	.orga $83AB;343AB
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	
	;2006 생략
	.bank 14 slot "ROM-LO"
	.orga $AE56;3AE56
	;db fe -> fa(tile?)

	; bank 15 slot "ROM-LO"

	
	
	.bank 31 slot "ROM-HI"
	.orga $C108;3C108
	;sta $4023
	;db $a9
	;db $03
    ;sta $4023
	;db $a9
	;db $e8
    ;sta $408A
	;db $a9
	;db $80
	;sta $4080
	
	.orga $C1b7;3C1b7
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2
	.orga $C1F2;3C1F2
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	.orga $C1F7;3C1F7
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2
	.orga $C1FD;3C1FD
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $C205;3C1FD
	JSR MAPPER165BANK	;STA MMC3BANKDATA


;2006 생략	

	.orga $C99F;3C99F
	JSR MAPPER165BANK	;STA MMC3BANKDATA

	.orga $C9AA;3C9AA
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $C9B2;3C9B2
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $C9BA;3C9BA
	JSR MAPPER165CHRLO2	;STA  MMC4CHRLO2
	.orga $C9C2;3C9C2
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	.orga $C9CA;3C9CA
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2
	.orga $C9D2;3C9D2
	JSR MAPPER165MIRROR	;STA  MMC4MIRROR
	.orga $C9DA;3C9DA
	JSR MAPPER165MIRROR	;STA  MMC4MIRROR

	.orga $CF28;3CF28
	JSR MAPPER165CHRHI1	;STA  MMC4CHRHI1
	JSR MAPPER165CHRHI2	;STA  MMC4CHRHI2
	
;2006 생략	
	.orga $E414;3E414
	JSR MAPPER165CHRLO1	;STA  MMC4CHRLO1
	.orga $E422;3E422
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $E43E;3E43E
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	
	
	.orga $E6A1;3E6A1
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $E6AB;3E6AB
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $E6BA;3E6BA
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $E6F1;3E6F1
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $E71D;3E71D
	JSR MAPPER165BANK	;STA MMC3BANKDATA
	.orga $E736;3E736
	JSR MAPPER165BANK	;STA MMC3BANKDATA

   .orga $FA00
MAPPER165BANK:
	PHA                      
	ASL A                    
	PHA                      
	LDA #$06                 
	STA MMC3BANKSEL                
	PLA                      
	STA MMC3BANKDATA               
	PHA                      
	LDA #$07                 
	STA MMC3BANKSEL                
	PLA                      
	CLC                      
	ADC #$01                 
	STA MMC3BANKDATA               
	PLA                      
	RTS  

   ; .orga $FA20	
; MAPPER165CHRLO1: 
  ; STA $03F0                
  ; JMP MAPPER165_FA40                
    ; .orga $FA28          
; MAPPER165CHRLO2: 
  ; STA $03F1                
  ; JMP MAPPER165_FA40                
    ; .orga $FA30
; MAPPER165CHRHI1:
  ; STA $03F2                
  ; JMP MAPPER165_FA60                
	; .orga $FA38
; MAPPER165CHRHI2:
  ; STA $03F3                
  ; JMP MAPPER165_FA60                

	; .orga $FA40
; MAPPER165_FA40:
  ; PHA                      
  ; ASL A                    
  ; ASL A                    
  ; PHA                      
  ; LDA #$00                 
  ; STA MMC3BANKSEL                
  ; PLA                      
  ; STA MMC3BANKDATA               
  ; CLC                      
  ; ADC #$02                 
  ; PHA                      
  ; LDA #$01                 
  ; STA MMC3BANKSEL                
  ; PLA                      
  ; STA MMC3BANKDATA               
  ; PLA                      
  ; RTS           
	.orga $FA60	
MAPPER165_FA60:
  PHA                      
  ASL A                    
  ASL A                    
  PHA                      
  LDA #$02                 
  STA MMC3BANKSEL                
  PLA                      
  STA MMC3BANKDATA               
  CLC                      
  ADC #$01                 
  PHA                      
  LDA #$03                 
  STA MMC3BANKSEL                
  PLA                      
  STA MMC3BANKDATA               
  CLC                      
  ADC #$01                 
  PHA                      
  LDA #$04                 
  STA MMC3BANKSEL                
  PLA                      
  STA MMC3BANKDATA               
  CLC                      
  ADC #$01                 
  PHA                      
  LDA #$05                 
  STA MMC3BANKSEL                
  PLA                      
  STA MMC3BANKDATA               
  PLA                      
  RTS                  

	.orga $FAA0	
MAPPER165MIRROR:
  STA MMC3MIRROR               
  RTS                      
  .orga $FAB0	
RESET:
  LDA #$FF                 
  STA $A000                
  STA $A001                
  LDA #$00                 
  STA $C000                
  STA $E000                
  LDA #$06                 
  STA MMC3BANKSEL                
  LDA #$1A                 
  STA MMC3BANKDATA               
  LDA #$07                 
  STA MMC3BANKSEL                
  LDA #$1B                 
  STA MMC3BANKDATA               
  JMP $C075    

  
	.orga $FAE0	
MAPPER165FAE0:
  STA $03F8                
  STA PPUADDR         
  RTS                      
	.orga $FAF0
MAPPER165FAF0:
  STA $03F9                
  STA PPUADDR         
  RTS                      


  
MMC3_F524:
  STX $8000                
  STY $8001                
  RTS   
  
MAPPER165CHRLO1:
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA                      
  TSX                      
  LDA $0103,X              
  NOP                      
  ASL A                    
  ASL A                    
  TAY                      
  LDX #$00                 
  JSR MMC3_F524                        
  PLA                      
  TAY                      
  PLA                      
  TAX                      
  PLA                      
  RTS                      

MAPPER165CHRLO2:
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA                      
  TSX                      
  LDA $0103,X              
  NOP                      
  ASL A                    
  ASL A                    
  TAY                      
  LDX #$01                 
  JSR MMC3_F524                        
  PLA                      
  TAY                      
  PLA                      
  TAX                      
  PLA                      
  RTS  

MAPPER165CHRHI1:            
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA                      
  TSX                      
  LDA $0103,X  
  NOP  
  ASL A                    
  ASL A                    
  TAY                      
  LDX #$02                 
  JSR MMC3_F524               
  PLA                      
  TAY                      
  PLA                      
  TAX                      
  PLA                      
  RTS 

MAPPER165CHRHI2:            
  PHA                      
  TXA                      
  PHA                      
  TYA                      
  PHA                      
  TSX                      
  LDA $0103,X              
  NOP
  ASL A                    
  ASL A                    
  TAY                      
  LDX #$04                 
  JSR MMC3_F524               
  PLA                      
  TAY                      
  PLA                      
  TAX                      
  PLA                      
  RTS                      


.orga $FFFC
  .dw RESET

; MAPPER165BANK	f500
; MAPPER165CHRLO1	f570
; MAPPER165CHRLO2	xxxx
; MAPPER165CHRHI1	xxxx
; MAPPER165CHRHI2	f530