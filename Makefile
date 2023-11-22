all: sneakin.wad sneakin-maps.wad sneakin-tex.wad

clean:
	rm -rf build full_wadinfo.txt sneakin.wad sneakin-maps.wad sneakin-tex.wad
	make -C textures clean

./build:
	mkdir -p build

full_wadinfo.txt: maps_wadinfo.txt textures/wadinfo.txt
	cat $^ > $@
	
sneakin.wad: ./build full_wadinfo.txt
	cd build && \
	cp -r ../levels . && \
	cp -r ../textures/flats ../textures/patches ../textures/textures . && \
	deutex -overwrite -build ../full_wadinfo.txt $@ && \
	ln -nsf build/$@ ../$@

sneakin-maps.wad: maps_wadinfo.txt $(shellglob,levels/*)
	deutex -build maps_wadinfo.txt $@

textures/sneakin-tex.wad: textures/wadinfo.txt textures/textures/texture2.txt
	make -C textures

sneakin-tex.wad: textures/sneakin-tex.wad
	ln -nsf $< $@
