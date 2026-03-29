# DUNGEON - Underground beneath the keep

# Stairway down from keep (trap door entrance)
setblock ~5 ~ ~11 iron_trapdoor[facing=south,open=true]

# Spiral stairs going down
fill ~5 ~-1 ~11 ~6 ~-1 ~12 stone_brick_stairs[facing=south]
fill ~5 ~-2 ~12 ~6 ~-2 ~13 stone_brick_stairs[facing=south]
fill ~5 ~-3 ~13 ~6 ~-3 ~14 stone_brick_stairs[facing=south]
fill ~5 ~-4 ~14 ~6 ~-4 ~15 stone_brick_stairs[facing=south]
fill ~5 ~-5 ~15 ~6 ~-5 ~16 stone_brick_stairs[facing=south]

# Dungeon room (large underground chamber)
fill ~-10 ~-8 ~-10 ~10 ~-4 ~16 stone_bricks
fill ~-9 ~-7 ~-9 ~9 ~-4 ~15 air
fill ~-10 ~-8 ~-10 ~10 ~-6 ~16 mossy_stone_bricks
fill ~-9 ~-7 ~-9 ~9 ~-6 ~15 air

# Floor
fill ~-9 ~-7 ~-9 ~9 ~-7 ~15 mossy_cobblestone

# Dungeon cells (iron bars)
# Cell 1
fill ~-9 ~-6 ~-9 ~-6 ~-4 ~-9 iron_bars
fill ~-9 ~-6 ~-6 ~-6 ~-4 ~-6 iron_bars
fill ~-9 ~-6 ~-9 ~-9 ~-4 ~-6 stone_bricks
fill ~-6 ~-6 ~-9 ~-6 ~-4 ~-6 stone_bricks
setblock ~-7 ~-6 ~-9 iron_bars
setblock ~-7 ~-5 ~-9 iron_bars
fill ~-8 ~-7 ~-8 ~-7 ~-7 ~-7 mossy_cobblestone
# Chain and skull
setblock ~-8 ~-4 ~-8 chain
setblock ~-8 ~-5 ~-8 chain

# Cell 2
fill ~-9 ~-6 ~-4 ~-6 ~-4 ~-4 iron_bars
fill ~-9 ~-6 ~-1 ~-6 ~-4 ~-1 iron_bars
fill ~-9 ~-6 ~-4 ~-9 ~-4 ~-1 stone_bricks
setblock ~-7 ~-6 ~-4 iron_bars
setblock ~-7 ~-5 ~-4 iron_bars
setblock ~-8 ~-4 ~-3 chain
setblock ~-8 ~-5 ~-3 chain

# Cell 3
fill ~-9 ~-6 ~1 ~-6 ~-4 ~1 iron_bars
fill ~-9 ~-6 ~4 ~-6 ~-4 ~4 iron_bars
fill ~-9 ~-6 ~1 ~-9 ~-4 ~4 stone_bricks
setblock ~-7 ~-6 ~1 iron_bars
setblock ~-7 ~-5 ~1 iron_bars
setblock ~-8 ~-4 ~2 chain
setblock ~-8 ~-5 ~2 chain

# Torture room (east side)
fill ~6 ~-6 ~-9 ~9 ~-4 ~-6 stone_bricks
fill ~7 ~-6 ~-8 ~8 ~-4 ~-7 air
setblock ~7 ~-6 ~-8 anvil
setblock ~8 ~-6 ~-8 cauldron

# Storage room (south)
fill ~-4 ~-6 ~10 ~4 ~-4 ~15 stone_bricks
fill ~-3 ~-6 ~11 ~3 ~-4 ~14 air
setblock ~-2 ~-6 ~13 barrel[facing=up]
setblock ~-1 ~-6 ~13 barrel[facing=up]
setblock ~0 ~-6 ~13 barrel[facing=up]
setblock ~1 ~-6 ~13 chest[facing=south]
setblock ~2 ~-6 ~13 chest[facing=south]

# Cobwebs for atmosphere
setblock ~-8 ~-4 ~-7 cobweb
setblock ~-8 ~-4 ~-2 cobweb
setblock ~-8 ~-4 ~3 cobweb
setblock ~7 ~-4 ~-7 cobweb
setblock ~3 ~-4 ~12 cobweb
setblock ~-3 ~-4 ~-5 cobweb
setblock ~5 ~-4 ~5 cobweb

# Skulls
setblock ~-9 ~-6 ~-8 skeleton_skull[rotation=4]
setblock ~-9 ~-6 ~-3 skeleton_skull[rotation=4]
setblock ~8 ~-6 ~-7 skeleton_skull[rotation=12]

# Soul torches for eerie lighting
setblock ~-5 ~-5 ~-9 soul_wall_torch[facing=south]
setblock ~0 ~-5 ~-9 soul_wall_torch[facing=south]
setblock ~5 ~-5 ~-9 soul_wall_torch[facing=south]
setblock ~-5 ~-5 ~15 soul_wall_torch[facing=north]
setblock ~0 ~-5 ~15 soul_wall_torch[facing=north]
setblock ~5 ~-5 ~15 soul_wall_torch[facing=north]
setblock ~-9 ~-5 ~-5 soul_wall_torch[facing=east]
setblock ~-9 ~-5 ~5 soul_wall_torch[facing=east]
setblock ~9 ~-5 ~-5 soul_wall_torch[facing=west]
setblock ~9 ~-5 ~5 soul_wall_torch[facing=west]

# Redstone lanterns (soul lanterns) for cells
setblock ~-8 ~-4 ~-7 soul_lantern[hanging=true]
setblock ~-8 ~-4 ~-2 soul_lantern[hanging=true]
setblock ~-8 ~-4 ~3 soul_lantern[hanging=true]

# Water puddles
setblock ~2 ~-7 ~-3 water
setblock ~-3 ~-7 ~5 water
setblock ~6 ~-7 ~2 water
