all: sneakin-tex.wad

clean:
	rm -f sneakin-tex.wad wadinfo.txt textures/texture2.txt lumps/animdefs.lmp

%.txt: %.txt.erb
	erb -T - $< > $@
%.lmp: %.lmp.erb
	erb -T - $< > $@
	
lumps/animdefs.lmp: lumps/animdefs.lmp.erb
textures/texture2.txt: textures/texture2.txt.erb
wadinfo.txt: wadinfo.txt.erb

sneakin-tex.wad: wadinfo.txt textures/texture2.txt lumps/animdefs.lmp lumps/switches.lmp $(wildcard flats/*.png patches/*.png)
	deutex -overwrite -build wadinfo.txt $@
