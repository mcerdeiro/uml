OUT_DIR	= out

vpath %.png $(OUT_DIR)
vpath %.uml uml

UML_FILES += $(wildcard uml/*.uml)
PNG_FILES += $(notdir $(patsubst %.uml,%.png,$(UML_FILES)))

all: $(PNG_FILES)

%.png : %.uml
	@echo ""
	@echo ==================================================
	@echo Converting $< to $@
	@echo ""
	java -jar plantuml.jar $< -o ../$(OUT_DIR)

info:
	@echo Input UMLs: $(UML_FILES)
	@echo Out PNGs: $(PNG_FILES)

clean:
	rm out/*
