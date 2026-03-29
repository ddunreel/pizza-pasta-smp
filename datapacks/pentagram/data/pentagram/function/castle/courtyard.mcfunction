# COURTYARD BUILDINGS - Chapel, barracks, armory, stable, market

# ============================================
# CHAPEL (NE corner of courtyard)
# ============================================
fill ~18 ~ ~-33 ~33 ~12 ~-20 stone_bricks
fill ~19 ~ ~-32 ~32 ~12 ~-21 air
fill ~18 ~ ~-33 ~33 ~1 ~-20 mossy_stone_bricks
fill ~19 ~ ~-32 ~32 ~1 ~-21 air

# Chapel entrance
fill ~24 ~ ~-20 ~27 ~5 ~-20 air
setblock ~24 ~6 ~-20 stone_brick_stairs[facing=east]
setblock ~27 ~6 ~-20 stone_brick_stairs[facing=west]
fill ~24 ~6 ~-20 ~27 ~6 ~-20 chiseled_stone_bricks
setblock ~24 ~6 ~-20 stone_brick_stairs[facing=east]
setblock ~27 ~6 ~-20 stone_brick_stairs[facing=west]

# Chapel peaked roof
fill ~18 ~12 ~-34 ~33 ~12 ~-19 spruce_slab
fill ~19 ~13 ~-32 ~32 ~13 ~-21 spruce_slab
fill ~20 ~14 ~-31 ~31 ~14 ~-22 spruce_slab
fill ~21 ~15 ~-30 ~30 ~15 ~-23 spruce_slab
fill ~22 ~16 ~-29 ~29 ~16 ~-24 spruce_slab
fill ~23 ~17 ~-28 ~28 ~17 ~-25 spruce_slab
fill ~24 ~18 ~-27 ~27 ~18 ~-26 spruce_slab

# Bell tower
fill ~25 ~12 ~-28 ~26 ~20 ~-27 stone_bricks
fill ~25 ~18 ~-28 ~26 ~19 ~-28 air
fill ~25 ~18 ~-27 ~26 ~19 ~-27 air
setblock ~25 ~21 ~-28 spruce_slab
setblock ~26 ~21 ~-28 spruce_slab
setblock ~25 ~21 ~-27 spruce_slab
setblock ~26 ~21 ~-27 spruce_slab
setblock ~26 ~22 ~-28 spruce_fence
setblock ~26 ~23 ~-28 bell

# Chapel interior
fill ~19 ~-1 ~-32 ~32 ~-1 ~-21 polished_andesite
# Pews
fill ~20 ~ ~-24 ~23 ~ ~-24 oak_stairs[facing=north]
fill ~28 ~ ~-24 ~31 ~ ~-24 oak_stairs[facing=north]
fill ~20 ~ ~-26 ~23 ~ ~-26 oak_stairs[facing=north]
fill ~28 ~ ~-26 ~31 ~ ~-26 oak_stairs[facing=north]
fill ~20 ~ ~-28 ~23 ~ ~-28 oak_stairs[facing=north]
fill ~28 ~ ~-28 ~31 ~ ~-28 oak_stairs[facing=north]
fill ~20 ~ ~-30 ~23 ~ ~-30 oak_stairs[facing=north]
fill ~28 ~ ~-30 ~31 ~ ~-30 oak_stairs[facing=north]

# Altar
fill ~24 ~ ~-31 ~27 ~ ~-31 polished_andesite
setblock ~25 ~1 ~-31 brewing_stand
setblock ~26 ~1 ~-31 candle[lit=true]
setblock ~24 ~1 ~-31 candle[lit=true]
setblock ~27 ~1 ~-31 candle[lit=true]

# Chapel carpet
fill ~25 ~ ~-21 ~26 ~ ~-31 purple_carpet

# Stained glass
setblock ~18 ~5 ~-26 red_stained_glass_pane
setblock ~18 ~6 ~-26 yellow_stained_glass_pane
setblock ~18 ~7 ~-26 blue_stained_glass_pane
setblock ~33 ~5 ~-26 red_stained_glass_pane
setblock ~33 ~6 ~-26 yellow_stained_glass_pane
setblock ~33 ~7 ~-26 blue_stained_glass_pane
setblock ~25 ~5 ~-33 red_stained_glass_pane
setblock ~25 ~6 ~-33 orange_stained_glass_pane
setblock ~25 ~7 ~-33 yellow_stained_glass_pane
setblock ~26 ~5 ~-33 red_stained_glass_pane
setblock ~26 ~6 ~-33 orange_stained_glass_pane
setblock ~26 ~7 ~-33 yellow_stained_glass_pane

# ============================================
# BARRACKS (NW corner)
# ============================================
fill ~-33 ~ ~-33 ~-18 ~8 ~-20 stone_bricks
fill ~-32 ~ ~-32 ~-19 ~8 ~-21 air
fill ~-33 ~ ~-33 ~-18 ~1 ~-20 mossy_stone_bricks
fill ~-32 ~ ~-32 ~-19 ~1 ~-21 air

# Roof
fill ~-33 ~8 ~-34 ~-18 ~8 ~-19 spruce_slab
fill ~-32 ~9 ~-33 ~-19 ~9 ~-20 spruce_slab
fill ~-31 ~10 ~-32 ~-20 ~10 ~-21 spruce_slab

# Barracks entrance
fill ~-24 ~ ~-20 ~-22 ~4 ~-20 air

# Barracks interior - bunk beds
fill ~-32 ~-1 ~-32 ~-19 ~-1 ~-21 oak_planks
# Row 1
setblock ~-31 ~ ~-31 red_bed[facing=east,part=head]
setblock ~-30 ~ ~-31 red_bed[facing=east,part=foot]
setblock ~-31 ~ ~-29 red_bed[facing=east,part=head]
setblock ~-30 ~ ~-29 red_bed[facing=east,part=foot]
setblock ~-31 ~ ~-27 red_bed[facing=east,part=head]
setblock ~-30 ~ ~-27 red_bed[facing=east,part=foot]
setblock ~-31 ~ ~-25 red_bed[facing=east,part=head]
setblock ~-30 ~ ~-25 red_bed[facing=east,part=foot]
# Row 2
setblock ~-20 ~ ~-31 red_bed[facing=west,part=head]
setblock ~-21 ~ ~-31 red_bed[facing=west,part=foot]
setblock ~-20 ~ ~-29 red_bed[facing=west,part=head]
setblock ~-21 ~ ~-29 red_bed[facing=west,part=foot]
setblock ~-20 ~ ~-27 red_bed[facing=west,part=head]
setblock ~-21 ~ ~-27 red_bed[facing=west,part=foot]
setblock ~-20 ~ ~-25 red_bed[facing=west,part=head]
setblock ~-21 ~ ~-25 red_bed[facing=west,part=foot]

# Weapon rack
setblock ~-25 ~1 ~-32 armor_stand
setblock ~-26 ~ ~-32 chest[facing=south]
setblock ~-24 ~ ~-32 chest[facing=south]

# Windows
setblock ~-33 ~3 ~-26 air
setblock ~-33 ~4 ~-26 air
setblock ~-18 ~3 ~-26 air
setblock ~-18 ~4 ~-26 air

# ============================================
# ARMORY / BLACKSMITH (SW corner)
# ============================================
fill ~-33 ~ ~20 ~-20 ~8 ~33 stone_bricks
fill ~-32 ~ ~21 ~-21 ~8 ~32 air
fill ~-33 ~ ~20 ~-20 ~1 ~33 mossy_stone_bricks
fill ~-32 ~ ~21 ~-21 ~1 ~32 air

# Roof
fill ~-33 ~8 ~19 ~-20 ~8 ~34 spruce_slab
fill ~-32 ~9 ~20 ~-21 ~9 ~33 spruce_slab
fill ~-31 ~10 ~21 ~-22 ~10 ~32 spruce_slab

# Entrance
fill ~-24 ~ ~20 ~-22 ~4 ~20 air

# Interior
fill ~-32 ~-1 ~21 ~-21 ~-1 ~32 cobblestone
# Forge
setblock ~-30 ~ ~31 blast_furnace[facing=south]
setblock ~-29 ~ ~31 blast_furnace[facing=south]
setblock ~-28 ~ ~31 smoker[facing=south]
setblock ~-31 ~ ~31 campfire
# Chimney
fill ~-31 ~1 ~32 ~-31 ~10 ~32 stone_bricks
fill ~-31 ~1 ~32 ~-31 ~8 ~32 air

# Anvils
setblock ~-26 ~ ~28 anvil
setblock ~-24 ~ ~28 anvil

# Crafting stations
setblock ~-22 ~ ~30 crafting_table
setblock ~-22 ~ ~29 smithing_table
setblock ~-22 ~ ~28 stonecutter
setblock ~-22 ~ ~27 grindstone[facing=west]
setblock ~-22 ~ ~26 loom

# Weapon display (armor stands)
summon armor_stand ~-30 ~ ~24 {ShowArms:1b,Rotation:[180f,0f]}
summon armor_stand ~-28 ~ ~24 {ShowArms:1b,Rotation:[180f,0f]}
summon armor_stand ~-26 ~ ~24 {ShowArms:1b,Rotation:[180f,0f]}

# Barrels and storage
setblock ~-31 ~ ~24 barrel[facing=up]
setblock ~-31 ~ ~25 barrel[facing=up]
setblock ~-31 ~1 ~24 barrel[facing=up]

# Cauldron with water
setblock ~-27 ~ ~31 water_cauldron[level=3]

# ============================================
# STABLE (SE corner)
# ============================================
fill ~20 ~ ~20 ~33 ~6 ~33 oak_planks
fill ~21 ~ ~21 ~32 ~6 ~32 air
fill ~20 ~-1 ~20 ~33 ~-1 ~33 dirt

# Roof
fill ~20 ~6 ~19 ~33 ~6 ~34 spruce_slab
fill ~21 ~7 ~20 ~32 ~7 ~33 spruce_slab
fill ~22 ~8 ~21 ~31 ~8 ~32 spruce_slab

# Entrance (open front)
fill ~22 ~ ~20 ~31 ~5 ~20 air

# Stalls (fence dividers)
fill ~24 ~ ~21 ~24 ~3 ~32 oak_fence
fill ~27 ~ ~21 ~27 ~3 ~32 oak_fence
fill ~30 ~ ~21 ~30 ~3 ~32 oak_fence
# Gates
setblock ~24 ~ ~24 oak_fence_gate[facing=east]
setblock ~27 ~ ~24 oak_fence_gate[facing=east]
setblock ~30 ~ ~24 oak_fence_gate[facing=east]

# Hay
fill ~22 ~-1 ~28 ~23 ~-1 ~32 hay_block
fill ~25 ~-1 ~28 ~26 ~-1 ~32 hay_block
fill ~28 ~-1 ~28 ~29 ~-1 ~32 hay_block
fill ~31 ~-1 ~28 ~32 ~-1 ~32 hay_block
setblock ~22 ~ ~31 hay_block
setblock ~25 ~ ~31 hay_block
setblock ~28 ~ ~31 hay_block
setblock ~31 ~ ~31 hay_block

# Water troughs
setblock ~23 ~ ~25 water_cauldron[level=3]
setblock ~26 ~ ~25 water_cauldron[level=3]
setblock ~29 ~ ~25 water_cauldron[level=3]
setblock ~32 ~ ~25 water_cauldron[level=3]
