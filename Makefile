.DEFAULT_GOAL := help
#CAD Compiler
QUALITY?=200
PNGOPTIONS=--autocenter --viewall --render --imgsize 1024,768	
SCADC?=openscad -D q=$(QUALITY)
	
PHONY: all images stl help
help: ## This help page
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

stl: ## Gennerate stl of parts to ./stl folder
	mkdir -p stl/
	$(SCADC) -D m=1 -o stl/handle.stl ./assembled.scad
	$(SCADC) -D m=2 -o stl/base.stl ./assembled.scad
	$(SCADC) -D m=3 -o stl/retainer.stl ./assembled.scad

images: ## Generate images of all parts and assembled view to ./images
	mkdir -p images/
	$(SCADC) $(PNGOPTIONS) -D m=1 -o images/handle.png ./assembled.scad
	$(SCADC) $(PNGOPTIONS) -D m=2 -o images/base.png ./assembled.scad
	$(SCADC) $(PNGOPTIONS) -D m=3 -o images/retainer.png ./assembled.scad
	$(SCADC) $(PNGOPTIONS) -o images/full.png ./assembled.scad

