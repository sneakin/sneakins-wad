all: sneakin-tex.wad

clean:
	rm -f sneakin-tex.wad

lumps/animdefs.lmp: lumps/animdefs.lmp.erb
	erb -T - $< > $@

textures/texture2.txt: textures/texture2.txt.erb
	erb -T - $< > $@

sneakin-tex.wad: textures/texture2.txt lumps/animdefs.lmp $(wildcard flats/*.png patches/*.png)
	deutex -overwrite -build wadinfo.txt $@
