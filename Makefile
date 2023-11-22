all: sneakin.wad sneakin-maps.wad sneakin-tex.wad

clean:
	rm -rf build release full_wadinfo.txt sneakin.wad sneakin-maps.wad sneakin-tex.wad
	make -C textures clean

release: release/sneakins-wad.tgz release/sneakins-wad.zip

release/sneakins-wad:
	mkdir -p $@
release/sneakins-wad/README.md: README.md ./release/sneakins-wad
	cp $< $@
release/sneakins-wad/README.html: README.md ./release/sneakins-wad ./release/sneakins-wad/images/screenshots/base1-00.png
	markdown_py $< > $@
./release/sneakins-wad/images/screenshots:
	mkdir -p $@
./release/sneakins-wad/images/screenshots/base1-00.png: ./images/screenshots/base1-00.png ./release/sneakins-wad/images/screenshots
	cp $< $@
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
	
sneakin.wad: ./build build/full_wadinfo.txt
	cd build && \
		cp -r ../levels . && \
		cp -r ../textures/flats ../textures/patches ../textures/textures . && \
		deutex -overwrite -build full_wadinfo.txt $@ && \
		ln -nsf build/$@ ../$@

sneakin-maps.wad: maps_wadinfo.txt $(shellglob,levels/*)
	deutex -overwrite -build maps_wadinfo.txt $@

textures/sneakin-tex.wad: textures/wadinfo.txt textures/textures/texture2.txt
	make -C textures

sneakin-tex.wad: textures/sneakin-tex.wad
	ln -nsf $< $@
