# GRAND KEEP - 24x24, 25 blocks high, centered

# Main structure
fill ~-12 ~ ~-12 ~12 ~22 ~12 stone_bricks
fill ~-11 ~ ~-11 ~11 ~22 ~11 air

# Deepslate base (first 3 blocks)
fill ~-12 ~ ~-12 ~12 ~2 ~12 deepslate_bricks
fill ~-11 ~ ~-11 ~11 ~2 ~11 air

# Deepslate mid-band
fill ~-12 ~10 ~-12 ~12 ~10 ~12 deepslate_brick_slab[type=top]
fill ~-11 ~10 ~-11 ~11 ~10 ~11 air

# Floors
fill ~-11 ~-1 ~-11 ~11 ~-1 ~11 polished_deepslate
fill ~-11 ~7 ~-11 ~11 ~7 ~11 dark_oak_planks
fill ~-11 ~14 ~-11 ~11 ~14 ~11 dark_oak_planks
fill ~-11 ~21 ~-11 ~11 ~21 ~11 dark_oak_planks

# Grand entrance (south)
fill ~-3 ~ ~12 ~3 ~7 ~12 air
fill ~-3 ~8 ~12 ~3 ~8 ~12 chiseled_stone_bricks
setblock ~-3 ~7 ~12 stone_brick_stairs[facing=east]
setblock ~3 ~7 ~12 stone_brick_stairs[facing=west]
# Columns at entrance
fill ~-4 ~ ~12 ~-4 ~7 ~12 stone_brick_wall
fill ~4 ~ ~12 ~4 ~7 ~12 stone_brick_wall

# Back entrance (north)
fill ~-2 ~ ~-12 ~2 ~5 ~-12 air
fill ~-2 ~6 ~-12 ~2 ~6 ~-12 stone_brick_slab

# Side entrances
fill ~-12 ~ ~-2 ~-12 ~5 ~2 air
fill ~12 ~ ~-2 ~12 ~5 ~2 air

# === WINDOWS (large arched) ===
# Ground floor
setblock ~-12 ~3 ~-7 glass_pane
setblock ~-12 ~4 ~-7 glass_pane
setblock ~-12 ~5 ~-7 glass_pane
setblock ~-12 ~3 ~7 glass_pane
setblock ~-12 ~4 ~7 glass_pane
setblock ~-12 ~5 ~7 glass_pane
setblock ~12 ~3 ~-7 glass_pane
setblock ~12 ~4 ~-7 glass_pane
setblock ~12 ~5 ~-7 glass_pane
setblock ~12 ~3 ~7 glass_pane
setblock ~12 ~4 ~7 glass_pane
setblock ~12 ~5 ~7 glass_pane
setblock ~-7 ~3 ~-12 glass_pane
setblock ~-7 ~4 ~-12 glass_pane
setblock ~-7 ~5 ~-12 glass_pane
setblock ~7 ~3 ~-12 glass_pane
setblock ~7 ~4 ~-12 glass_pane
setblock ~7 ~5 ~-12 glass_pane

# Second floor
setblock ~-12 ~10 ~-7 glass_pane
setblock ~-12 ~11 ~-7 glass_pane
setblock ~-12 ~12 ~-7 glass_pane
setblock ~-12 ~10 ~7 glass_pane
setblock ~-12 ~11 ~7 glass_pane
setblock ~-12 ~12 ~7 glass_pane
setblock ~12 ~10 ~-7 glass_pane
setblock ~12 ~11 ~-7 glass_pane
setblock ~12 ~12 ~-7 glass_pane
setblock ~12 ~10 ~7 glass_pane
setblock ~12 ~11 ~7 glass_pane
setblock ~12 ~12 ~7 glass_pane

# Third floor - large stained glass windows
setblock ~-12 ~17 ~-5 orange_stained_glass_pane
setblock ~-12 ~18 ~-5 orange_stained_glass_pane
setblock ~-12 ~19 ~-5 yellow_stained_glass_pane
setblock ~-12 ~17 ~5 orange_stained_glass_pane
setblock ~-12 ~18 ~5 orange_stained_glass_pane
setblock ~-12 ~19 ~5 yellow_stained_glass_pane
setblock ~12 ~17 ~-5 orange_stained_glass_pane
setblock ~12 ~18 ~-5 orange_stained_glass_pane
setblock ~12 ~19 ~-5 yellow_stained_glass_pane
setblock ~12 ~17 ~5 orange_stained_glass_pane
setblock ~12 ~18 ~5 orange_stained_glass_pane
setblock ~12 ~19 ~5 yellow_stained_glass_pane

# === ROOF (peaked with dormers) ===
# Main peaked roof (east-west ridge)
fill ~-12 ~22 ~-13 ~12 ~22 ~13 spruce_slab
fill ~-11 ~23 ~-11 ~11 ~23 ~11 spruce_slab
fill ~-10 ~24 ~-9 ~10 ~24 ~9 spruce_slab
fill ~-9 ~25 ~-7 ~9 ~25 ~7 spruce_slab
fill ~-8 ~26 ~-5 ~8 ~26 ~5 spruce_slab
fill ~-7 ~27 ~-3 ~7 ~27 ~3 spruce_slab
fill ~-6 ~28 ~-2 ~6 ~28 ~2 spruce_planks
fill ~-5 ~29 ~-1 ~5 ~29 ~1 spruce_slab
fill ~-4 ~30 ~0 ~4 ~30 ~0 spruce_slab

# Roof peak flag
setblock ~0 ~31 ~0 spruce_fence
setblock ~0 ~32 ~0 spruce_fence
setblock ~0 ~33 ~0 red_banner

# Keep corner turrets (small, on all 4 corners)
fill ~-14 ~15 ~-14 ~-11 ~24 ~-11 stone_bricks
fill ~-13 ~15 ~-13 ~-12 ~24 ~-12 air
fill ~-13 ~24 ~-13 ~-12 ~24 ~-12 spruce_slab
setblock ~-13 ~25 ~-13 spruce_fence
setblock ~-13 ~26 ~-13 red_banner

fill ~11 ~15 ~-14 ~14 ~24 ~-11 stone_bricks
fill ~12 ~15 ~-13 ~13 ~24 ~-12 air
fill ~12 ~24 ~-13 ~13 ~24 ~-12 spruce_slab
setblock ~12 ~25 ~-13 spruce_fence
setblock ~12 ~26 ~-13 red_banner

fill ~-14 ~15 ~11 ~-11 ~24 ~14 stone_bricks
fill ~-13 ~15 ~12 ~-12 ~24 ~13 air
fill ~-13 ~24 ~12 ~-12 ~24 ~13 spruce_slab
setblock ~-13 ~25 ~12 spruce_fence
setblock ~-13 ~26 ~12 red_banner

fill ~11 ~15 ~11 ~14 ~24 ~14 stone_bricks
fill ~12 ~15 ~12 ~13 ~24 ~13 air
fill ~12 ~24 ~12 ~13 ~24 ~13 spruce_slab
setblock ~12 ~25 ~12 spruce_fence
setblock ~12 ~26 ~12 red_banner

# === GRAND STAIRCASE ===
# Ground to second floor (wide staircase along west wall)
fill ~-10 ~1 ~8 ~-9 ~1 ~8 stone_brick_stairs[facing=north]
fill ~-10 ~2 ~7 ~-9 ~2 ~7 stone_brick_stairs[facing=north]
fill ~-10 ~3 ~6 ~-9 ~3 ~6 stone_brick_stairs[facing=north]
fill ~-10 ~4 ~5 ~-9 ~4 ~5 stone_brick_stairs[facing=north]
fill ~-10 ~5 ~4 ~-9 ~5 ~4 stone_brick_stairs[facing=north]
fill ~-10 ~6 ~3 ~-9 ~6 ~3 stone_brick_stairs[facing=north]
fill ~-10 ~7 ~2 ~-9 ~7 ~2 stone_brick_stairs[facing=north]
# Stair opening in floor
fill ~-10 ~7 ~8 ~-9 ~7 ~3 air

# Second to third floor (east wall)
fill ~9 ~8 ~8 ~10 ~8 ~8 stone_brick_stairs[facing=north]
fill ~9 ~9 ~7 ~10 ~9 ~7 stone_brick_stairs[facing=north]
fill ~9 ~10 ~6 ~10 ~10 ~6 stone_brick_stairs[facing=north]
fill ~9 ~11 ~5 ~10 ~11 ~5 stone_brick_stairs[facing=north]
fill ~9 ~12 ~4 ~10 ~12 ~4 stone_brick_stairs[facing=north]
fill ~9 ~13 ~3 ~10 ~13 ~3 stone_brick_stairs[facing=north]
fill ~9 ~14 ~2 ~10 ~14 ~2 stone_brick_stairs[facing=north]
fill ~9 ~14 ~8 ~10 ~14 ~3 air

# Third to roof (ladder)
setblock ~0 ~15 ~-11 ladder[facing=south]
setblock ~0 ~16 ~-11 ladder[facing=south]
setblock ~0 ~17 ~-11 ladder[facing=south]
setblock ~0 ~18 ~-11 ladder[facing=south]
setblock ~0 ~19 ~-11 ladder[facing=south]
setblock ~0 ~20 ~-11 ladder[facing=south]
setblock ~0 ~21 ~-11 ladder[facing=south]
