OUT_DIR	= out

vpath *.png $(OUT_DIR)

UML_FILES += $(wildcard *.uml)

PNG_FILES += $(notdir $(patsubst %.uml,%.png,$(UML_FILES)))

all: $(PNG_FILES)

%.png : %.uml
	@echo ""
	@echo ==================================================
	@echo Converting $< to $(OUT_DIR)$(DS)$@
	@echo ""
	java -jar plantuml.jar $< -o $(OUT_DIR)

clean:
	rm out/*
