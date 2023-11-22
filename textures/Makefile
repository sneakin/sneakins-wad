all: sneakin-tex.wad

clean:
	rm -f sneakin-tex.wad

sneakin-tex.wad: $(shellglob,flats/*.png patches/*.png textures/*.txt)
	deutex -overwrite -build wadinfo.txt $@
