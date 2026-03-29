# GRAND GATEHOUSE - South entrance

# Gate towers (two massive flanking towers)
# Left tower
fill ~-10 ~ ~33 ~-4 ~22 ~39 stone_bricks
fill ~-9 ~ ~34 ~-5 ~22 ~38 air
fill ~-10 ~ ~33 ~-4 ~1 ~39 mossy_stone_bricks
fill ~-9 ~ ~34 ~-5 ~1 ~38 air
fill ~-10 ~22 ~33 ~-4 ~24 ~39 deepslate_bricks
fill ~-9 ~22 ~34 ~-5 ~24 ~38 air
fill ~-9 ~24 ~34 ~-5 ~24 ~38 spruce_slab
fill ~-8 ~25 ~35 ~-6 ~25 ~37 spruce_slab
setblock ~-7 ~26 ~36 spruce_slab
setblock ~-7 ~27 ~36 spruce_fence
setblock ~-7 ~28 ~36 red_banner

# Right tower
fill ~4 ~ ~33 ~10 ~22 ~39 stone_bricks
fill ~5 ~ ~34 ~9 ~22 ~38 air
fill ~4 ~ ~33 ~10 ~1 ~39 mossy_stone_bricks
fill ~5 ~ ~34 ~9 ~1 ~38 air
fill ~4 ~22 ~33 ~10 ~24 ~39 deepslate_bricks
fill ~5 ~22 ~34 ~9 ~24 ~38 air
fill ~5 ~24 ~34 ~9 ~24 ~38 spruce_slab
fill ~6 ~25 ~35 ~8 ~25 ~37 spruce_slab
setblock ~7 ~26 ~36 spruce_slab
setblock ~7 ~27 ~36 spruce_fence
setblock ~7 ~28 ~36 red_banner

# Gate passage (between towers, overhead)
fill ~-3 ~ ~35 ~3 ~8 ~37 stone_bricks
fill ~-3 ~ ~36 ~3 ~7 ~36 air
# Gate opening
fill ~-3 ~ ~35 ~3 ~7 ~35 air
fill ~-3 ~ ~37 ~3 ~7 ~37 air

# Portcullis (iron bars)
setblock ~-3 ~6 ~35 iron_bars
setblock ~-2 ~7 ~35 iron_bars
setblock ~-1 ~7 ~35 iron_bars
setblock ~0 ~7 ~35 iron_bars
setblock ~1 ~7 ~35 iron_bars
setblock ~2 ~7 ~35 iron_bars
setblock ~3 ~6 ~35 iron_bars

# Gate arch decoration
fill ~-3 ~8 ~35 ~3 ~8 ~37 chiseled_stone_bricks
setblock ~-3 ~7 ~35 stone_brick_stairs[facing=east]
setblock ~3 ~7 ~35 stone_brick_stairs[facing=west]
setblock ~-3 ~7 ~37 stone_brick_stairs[facing=east]
setblock ~3 ~7 ~37 stone_brick_stairs[facing=west]

# Murder holes above gate passage
setblock ~-1 ~8 ~36 air
setblock ~0 ~8 ~36 air
setblock ~1 ~8 ~36 air

# Gate tower windows
setblock ~-10 ~8 ~36 air
setblock ~-10 ~9 ~36 air
setblock ~-10 ~14 ~36 air
setblock ~-10 ~15 ~36 air
setblock ~10 ~8 ~36 air
setblock ~10 ~9 ~36 air
setblock ~10 ~14 ~36 air
setblock ~10 ~15 ~36 air
setblock ~-7 ~8 ~39 air
setblock ~-7 ~9 ~39 air
setblock ~7 ~8 ~39 air
setblock ~7 ~9 ~39 air

# Banners above gate
setblock ~-2 ~7 ~34 red_wall_banner[facing=south]
setblock ~0 ~7 ~34 red_wall_banner[facing=south]
setblock ~2 ~7 ~34 red_wall_banner[facing=south]

# Torches flanking gate
setblock ~-4 ~4 ~34 wall_torch[facing=south]
setblock ~4 ~4 ~34 wall_torch[facing=south]
setblock ~-4 ~4 ~38 wall_torch[facing=north]
setblock ~4 ~4 ~38 wall_torch[facing=north]
