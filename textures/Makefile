all: sneakin-tex.wad

clean:
	rm -f sneakin-tex.wad

sneakin-tex.wad: $(wildcard flats/*.png patches/*.png textures/*.txt lumps/*.lmp)
	deutex -overwrite -build wadinfo.txt $@
