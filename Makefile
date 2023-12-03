all: sneakin.wad sneakin-maps.wad sneakin-tex.wad

clean:
	rm -rf build release full_wadinfo.txt sneakin.wad sneakin-maps.wad sneakin-tex.wad
	make -C textures clean

REL_WAD=release/sneakins-wad/sneakin.wad

release: release/sneakins-wad.tgz release/sneakins-wad.zip

release/sneakins-wad:
	rm -rf $@ && mkdir -p $@
release/sneakins-wad/README.md: README.md ./release/sneakins-wad release/sneakins-wad/sneakin.wad
	cp $< $@
	echo -e "\n\n# Hashes\n\n* SHA256: $$(sha256sum $(REL_WAD) | cut -f 1 -d ' ')\n* SHA512: $$(sha512sum $(REL_WAD) | cut -f 1 -d ' ')\n" >> $@
release/sneakins-wad/README.html: release/sneakins-wad/README.md ./release/sneakins-wad
	markdown_py $< > $@
release/sneakins-wad/sneakin.wad: sneakin.wad ./release/sneakins-wad
	cp $< $@

release/sneakins-wad.tgz: release/sneakins-wad/README.md release/sneakins-wad/README.html release/sneakins-wad/sneakin.wad
	cd release && tar cvf sneakins-wad.tgz sneakins-wad

release/sneakins-wad.zip: release/sneakins-wad/README.md release/sneakins-wad/README.html release/sneakins-wad/sneakin.wad
	cd release && zip -r -u sneakins-wad.zip sneakins-wad

./build:
	mkdir -p build

build/full_wadinfo.txt: maps_wadinfo.txt textures/wadinfo.txt
	cat $^ > $@
	
sneakin.wad: ./build build/full_wadinfo.txt $(wildcard levels/*.wad textures/*/*.png textures/*/*.txt textures/*/*.lmp)
	cd build && \
		cp -r ../levels . && \
		cp -r ../textures/flats ../textures/patches ../textures/textures ../textures/lumps . && \
		deutex -overwrite -build full_wadinfo.txt $@ && \
		ln -nsf build/$@ ../$@

sneakin-maps.wad: maps_wadinfo.txt $(wildcard levels/*)
	deutex -overwrite -build maps_wadinfo.txt $@

textures/sneakin-tex.wad: textures/wadinfo.txt textures/textures/texture2.txt $(wildcard textures/*/*.png textures/*/*.txt textures/*/*.lmp)
	make -C textures

sneakin-tex.wad: textures/sneakin-tex.wad
	ln -nsf $< $@
