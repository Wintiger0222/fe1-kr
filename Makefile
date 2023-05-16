
PATH := tools/bin:$(PATH)

WLA6502 := wla-6502
WLALINK := wlalink

NFLATE := nflate


BASEROM := fe1-expand.nes
ROM := fe1.nes
LINK := fe1.link

SOURCE := fe1.asm
OBJECT := fe1.o

# DEPENDS := $(shell find code include data -type f -name '*.asm')

all: $(BASEROM) $(ROM)


$(ROM): $(OBJECT) header.bin
	$(WLALINK) -S -v $(LINK) $(ROM)

$(OBJECT): $(SOURCE) $(DEPENDS)
	$(WLA6502) -o $@ $<

$(BASEROM):	fe1-base.nes
	./nflate  < nflate_command.txt

clean:
	@rm -rf *.o
	@rm -rf *.sym
	@rm -rf fe1-expand.nes