# COURTYARD DECORATIONS - Gardens, market, well, paths, trees

# ============================================
# MAIN PATH (gate to keep)
# ============================================
fill ~-2 ~-1 ~12 ~2 ~-1 ~34 stone_brick_slab
fill ~-1 ~-1 ~12 ~1 ~-1 ~34 polished_andesite

# Cross paths
fill ~-34 ~-1 ~-1 ~-13 ~-1 ~1 stone_brick_slab
fill ~13 ~-1 ~-1 ~34 ~-1 ~1 stone_brick_slab
fill ~-2 ~-1 ~-18 ~2 ~-1 ~-13 stone_brick_slab

# ============================================
# GRAND FOUNTAIN (center courtyard, south of keep)
# ============================================
# Base pool
fill ~-4 ~-1 ~16 ~4 ~-1 ~24 stone_bricks
fill ~-3 ~-1 ~17 ~3 ~-1 ~23 water
fill ~-3 ~ ~17 ~3 ~1 ~23 air
# Center pillar
fill ~0 ~-1 ~20 ~0 ~3 ~20 stone_brick_wall
setblock ~0 ~4 ~20 water
# Upper basin
fill ~-1 ~2 ~19 ~1 ~2 ~21 stone_brick_slab
# Corner posts
setblock ~-4 ~ ~16 stone_brick_wall
setblock ~4 ~ ~16 stone_brick_wall
setblock ~-4 ~ ~24 stone_brick_wall
setblock ~4 ~ ~24 stone_brick_wall
setblock ~-4 ~1 ~16 lantern[hanging=false]
setblock ~4 ~1 ~16 lantern[hanging=false]
setblock ~-4 ~1 ~24 lantern[hanging=false]
setblock ~4 ~1 ~24 lantern[hanging=false]

# ============================================
# GARDENS (flanking the main path)
# ============================================
# Left garden
fill ~-12 ~-1 ~15 ~-5 ~-1 ~25 grass_block
fill ~-11 ~ ~16 ~-6 ~ ~24 air
# Flowers
setblock ~-10 ~ ~17 rose_bush[half=lower]
setblock ~-10 ~1 ~17 rose_bush[half=upper]
setblock ~-8 ~ ~20 lilac[half=lower]
setblock ~-8 ~1 ~20 lilac[half=upper]
setblock ~-6 ~ ~18 peony[half=lower]
setblock ~-6 ~1 ~18 peony[half=upper]
setblock ~-11 ~ ~22 sunflower[half=lower]
setblock ~-11 ~1 ~22 sunflower[half=upper]
setblock ~-7 ~ ~16 poppy
setblock ~-9 ~ ~19 azure_bluet
setblock ~-11 ~ ~24 cornflower
setblock ~-6 ~ ~21 allium
setblock ~-10 ~ ~23 blue_orchid
setblock ~-8 ~ ~17 dandelion
setblock ~-7 ~ ~23 oxeye_daisy
setblock ~-9 ~ ~22 lily_of_the_valley
# Garden fence
fill ~-12 ~ ~15 ~-5 ~ ~15 oak_fence
fill ~-12 ~ ~25 ~-5 ~ ~25 oak_fence
fill ~-12 ~ ~15 ~-12 ~ ~25 oak_fence
fill ~-5 ~ ~15 ~-5 ~ ~25 oak_fence
setblock ~-8 ~ ~15 oak_fence_gate[facing=south]

# Right garden
fill ~5 ~-1 ~15 ~12 ~-1 ~25 grass_block
setblock ~7 ~ ~17 rose_bush[half=lower]
setblock ~7 ~1 ~17 rose_bush[half=upper]
setblock ~9 ~ ~20 lilac[half=lower]
setblock ~9 ~1 ~20 lilac[half=upper]
setblock ~11 ~ ~18 peony[half=lower]
setblock ~11 ~1 ~18 peony[half=upper]
setblock ~6 ~ ~22 sunflower[half=lower]
setblock ~6 ~1 ~22 sunflower[half=upper]
setblock ~8 ~ ~16 tulip_red
setblock ~10 ~ ~19 azure_bluet
setblock ~6 ~ ~24 cornflower
setblock ~11 ~ ~21 allium
setblock ~8 ~ ~23 blue_orchid
setblock ~10 ~ ~17 dandelion
fill ~5 ~ ~15 ~12 ~ ~15 oak_fence
fill ~5 ~ ~25 ~12 ~ ~25 oak_fence
fill ~5 ~ ~15 ~5 ~ ~25 oak_fence
fill ~12 ~ ~15 ~12 ~ ~25 oak_fence
setblock ~8 ~ ~15 oak_fence_gate[facing=south]

# ============================================
# MARKET STALLS (along east inner wall)
# ============================================
# Stall 1 - Food
fill ~28 ~ ~-15 ~33 ~3 ~-12 air
fill ~28 ~-1 ~-15 ~33 ~-1 ~-12 cobblestone
fill ~28 ~3 ~-15 ~33 ~3 ~-12 red_wool
fill ~28 ~ ~-15 ~28 ~2 ~-12 oak_log
setblock ~33 ~ ~-15 oak_log
setblock ~33 ~ ~-12 oak_log
fill ~28 ~2 ~-15 ~28 ~2 ~-12 oak_log
setblock ~30 ~ ~-14 barrel[facing=up]
setblock ~31 ~ ~-14 barrel[facing=up]
setblock ~30 ~ ~-13 hay_block
setblock ~29 ~ ~-14 composter

# Stall 2 - Weapons
fill ~28 ~ ~-10 ~33 ~3 ~-7 air
fill ~28 ~-1 ~-10 ~33 ~-1 ~-7 cobblestone
fill ~28 ~3 ~-10 ~33 ~3 ~-7 blue_wool
fill ~28 ~ ~-10 ~28 ~2 ~-7 oak_log
setblock ~33 ~ ~-10 oak_log
setblock ~33 ~ ~-7 oak_log
fill ~28 ~2 ~-10 ~28 ~2 ~-7 oak_log
setblock ~30 ~ ~-9 anvil
setblock ~31 ~ ~-9 grindstone[facing=north]

# Stall 3 - Potions
fill ~28 ~ ~-5 ~33 ~3 ~-2 air
fill ~28 ~-1 ~-5 ~33 ~-1 ~-2 cobblestone
fill ~28 ~3 ~-5 ~33 ~3 ~-2 purple_wool
fill ~28 ~ ~-5 ~28 ~2 ~-2 oak_log
setblock ~33 ~ ~-5 oak_log
setblock ~33 ~ ~-2 oak_log
fill ~28 ~2 ~-5 ~28 ~2 ~-2 oak_log
setblock ~30 ~ ~-4 brewing_stand
setblock ~31 ~ ~-4 cauldron

# ============================================
# WELL (west courtyard)
# ============================================
fill ~-22 ~-3 ~-5 ~-18 ~-1 ~-1 stone_bricks
fill ~-21 ~-3 ~-4 ~-19 ~-1 ~-2 water
fill ~-22 ~ ~-5 ~-18 ~ ~-5 stone_brick_wall
fill ~-22 ~ ~-1 ~-18 ~ ~-1 stone_brick_wall
fill ~-22 ~ ~-5 ~-22 ~ ~-1 stone_brick_wall
fill ~-18 ~ ~-5 ~-18 ~ ~-1 stone_brick_wall
setblock ~-22 ~2 ~-5 oak_fence
setblock ~-18 ~2 ~-5 oak_fence
setblock ~-22 ~2 ~-1 oak_fence
setblock ~-18 ~2 ~-1 oak_fence
fill ~-22 ~3 ~-5 ~-18 ~3 ~-1 spruce_slab
fill ~-21 ~3 ~-4 ~-19 ~3 ~-2 air

# ============================================
# TREES (scattered in courtyard)
# ============================================
# Tree 1 (left of path)
setblock ~-15 ~-1 ~5 dirt
fill ~-15 ~ ~5 ~-15 ~4 ~5 oak_log
fill ~-17 ~3 ~3 ~-13 ~3 ~7 oak_leaves
fill ~-16 ~4 ~4 ~-14 ~4 ~6 oak_leaves
fill ~-16 ~5 ~4 ~-14 ~5 ~6 oak_leaves
setblock ~-15 ~5 ~5 oak_leaves

# Tree 2 (right of path)
setblock ~15 ~-1 ~5 dirt
fill ~15 ~ ~5 ~15 ~4 ~5 oak_log
fill ~13 ~3 ~3 ~17 ~3 ~7 oak_leaves
fill ~14 ~4 ~4 ~16 ~4 ~6 oak_leaves
fill ~14 ~5 ~4 ~16 ~5 ~6 oak_leaves
setblock ~15 ~5 ~5 oak_leaves

# Tree 3 (near well)
setblock ~-20 ~-1 ~5 dirt
fill ~-20 ~ ~5 ~-20 ~5 ~5 birch_log
fill ~-22 ~4 ~3 ~-18 ~4 ~7 birch_leaves
fill ~-21 ~5 ~4 ~-19 ~5 ~6 birch_leaves
setblock ~-20 ~6 ~5 birch_leaves

# ============================================
# TRAINING GROUNDS (west courtyard)
# ============================================
fill ~-33 ~-1 ~2 ~-20 ~-1 ~16 coarse_dirt
# Targets
setblock ~-32 ~1 ~4 target
setblock ~-32 ~1 ~8 target
setblock ~-32 ~1 ~12 target
setblock ~-32 ~ ~4 oak_fence
setblock ~-32 ~ ~8 oak_fence
setblock ~-32 ~ ~12 oak_fence
# Training dummies
summon armor_stand ~-28 ~ ~6 {ShowArms:1b,NoBasePlate:1b}
summon armor_stand ~-28 ~ ~10 {ShowArms:1b,NoBasePlate:1b}
# Hay bale targets
setblock ~-25 ~ ~5 hay_block
setblock ~-25 ~1 ~5 hay_block
setblock ~-25 ~ ~11 hay_block
setblock ~-25 ~1 ~11 hay_block

# Fence around training area
fill ~-33 ~ ~2 ~-20 ~ ~2 oak_fence
fill ~-33 ~ ~16 ~-20 ~ ~16 oak_fence
fill ~-20 ~ ~2 ~-20 ~ ~16 oak_fence
setblock ~-20 ~ ~9 oak_fence_gate[facing=east]
