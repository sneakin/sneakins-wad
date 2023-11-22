# sneakin's wad

Presently just a single map.

# Requirements

* gzdoom or zdoom
* Doom 2's IWAD, though FreeDoom2 works too.
* Development: make, deutex, Eureka

# Playing

* Download and unzip the archive, or download the Git repository.
* Run Doom with the WAD: `gzdoom -iwad $DOOM2WAD -file sneakins-wad/sneakin.wad`

# Rebuilding

If you downloaded the Git repository then you will need to build the wad
files. The `make` and `deutex` utilities will be needed.

## The wad files

To build `sneakin.wad`, `sneakin-maps.wad`, and `sneakin-tex.wad`:

> make

`sneakin.wad` is the full wad. `sneakin-maps.wad` is just the maps and
`sneakin-tex.wad` is just textures and flats.

## release archive:

To build `release/sneakins-wad.tgz` and `release/sneakins-wad.zip`:

> make release

# Updates / contact

* Github [http://github.com/sneakin/sneakins-wad](http://github.com/sneakin/sneakins-wad)
* X / Twitter [@sneakin](https://x.com/sneakin)
