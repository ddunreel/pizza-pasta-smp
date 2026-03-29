# KEEP INTERIOR - Throne room, dining hall, royal chambers

# ============================================
# GROUND FLOOR - THRONE ROOM
# ============================================

# Grand carpet (red carpet runner to throne)
fill ~-2 ~ ~-10 ~2 ~ ~10 red_carpet
fill ~-1 ~ ~-10 ~1 ~ ~10 red_carpet

# Throne platform (raised 1 block)
fill ~-4 ~ ~-10 ~4 ~0 ~-7 quartz_block
fill ~-3 ~ ~-10 ~3 ~ ~-7 red_carpet

# The Throne
setblock ~0 ~1 ~-10 oak_stairs[facing=south]
setblock ~-1 ~1 ~-10 oak_stairs[facing=east]
setblock ~1 ~1 ~-10 oak_stairs[facing=west]
# Throne back (gold and banners)
setblock ~0 ~3 ~-11 gold_block
setblock ~0 ~4 ~-11 gold_block
setblock ~-1 ~2 ~-11 gold_block
setblock ~1 ~2 ~-11 gold_block
setblock ~0 ~5 ~-11 chiseled_stone_bricks
setblock ~-2 ~4 ~-11 red_wall_banner[facing=south]
setblock ~2 ~4 ~-11 red_wall_banner[facing=south]

# Pillars (stone brick columns)
fill ~-8 ~ ~-6 ~-8 ~6 ~-6 stone_brick_wall
fill ~8 ~ ~-6 ~8 ~6 ~-6 stone_brick_wall
fill ~-8 ~ ~-2 ~-8 ~6 ~-2 stone_brick_wall
fill ~8 ~ ~-2 ~8 ~6 ~-2 stone_brick_wall
fill ~-8 ~ ~2 ~-8 ~6 ~2 stone_brick_wall
fill ~8 ~ ~2 ~8 ~6 ~2 stone_brick_wall
fill ~-8 ~ ~6 ~-8 ~6 ~6 stone_brick_wall
fill ~8 ~ ~6 ~8 ~6 ~6 stone_brick_wall

# Pillar capitals
setblock ~-8 ~6 ~-6 chiseled_stone_bricks
setblock ~8 ~6 ~-6 chiseled_stone_bricks
setblock ~-8 ~6 ~-2 chiseled_stone_bricks
setblock ~8 ~6 ~-2 chiseled_stone_bricks
setblock ~-8 ~6 ~2 chiseled_stone_bricks
setblock ~8 ~6 ~2 chiseled_stone_bricks
setblock ~-8 ~6 ~6 chiseled_stone_bricks
setblock ~8 ~6 ~6 chiseled_stone_bricks

# Banners along throne room walls
setblock ~-11 ~4 ~-8 red_wall_banner[facing=east]
setblock ~-11 ~4 ~-4 red_wall_banner[facing=east]
setblock ~-11 ~4 ~0 red_wall_banner[facing=east]
setblock ~-11 ~4 ~4 red_wall_banner[facing=east]
setblock ~-11 ~4 ~8 red_wall_banner[facing=east]
setblock ~11 ~4 ~-8 red_wall_banner[facing=west]
setblock ~11 ~4 ~-4 red_wall_banner[facing=west]
setblock ~11 ~4 ~0 red_wall_banner[facing=west]
setblock ~11 ~4 ~4 red_wall_banner[facing=west]
setblock ~11 ~4 ~8 red_wall_banner[facing=west]

# Armor stands as guards
summon armor_stand ~-5 ~ ~8 {ShowArms:1b,Rotation:[180f,0f]}
summon armor_stand ~5 ~ ~8 {ShowArms:1b,Rotation:[180f,0f]}
summon armor_stand ~-5 ~ ~-6 {ShowArms:1b,Rotation:[0f,0f]}
summon armor_stand ~5 ~ ~-6 {ShowArms:1b,Rotation:[0f,0f]}

# ============================================
# SECOND FLOOR - GREAT HALL / DINING
# ============================================

# Grand dining table
fill ~-7 ~8 ~-4 ~7 ~8 ~-3 dark_oak_slab
fill ~-7 ~8 ~-2 ~7 ~8 ~-2 dark_oak_slab

# Chairs (both sides)
setblock ~-7 ~8 ~-5 oak_stairs[facing=south]
setblock ~-5 ~8 ~-5 oak_stairs[facing=south]
setblock ~-3 ~8 ~-5 oak_stairs[facing=south]
setblock ~-1 ~8 ~-5 oak_stairs[facing=south]
setblock ~1 ~8 ~-5 oak_stairs[facing=south]
setblock ~3 ~8 ~-5 oak_stairs[facing=south]
setblock ~5 ~8 ~-5 oak_stairs[facing=south]
setblock ~7 ~8 ~-5 oak_stairs[facing=south]
setblock ~-7 ~8 ~-1 oak_stairs[facing=north]
setblock ~-5 ~8 ~-1 oak_stairs[facing=north]
setblock ~-3 ~8 ~-1 oak_stairs[facing=north]
setblock ~-1 ~8 ~-1 oak_stairs[facing=north]
setblock ~1 ~8 ~-1 oak_stairs[facing=north]
setblock ~3 ~8 ~-1 oak_stairs[facing=north]
setblock ~5 ~8 ~-1 oak_stairs[facing=north]
setblock ~7 ~8 ~-1 oak_stairs[facing=north]

# Head of table chair (fancy)
setblock ~0 ~8 ~-6 oak_stairs[facing=south]
setblock ~-1 ~8 ~-6 oak_stairs[facing=east]
setblock ~1 ~8 ~-6 oak_stairs[facing=west]

# Food on table (decorative)
setblock ~-4 ~9 ~-3 cake
setblock ~0 ~9 ~-3 cake
setblock ~4 ~9 ~-3 cake

# Grand fireplace (north wall)
fill ~-3 ~8 ~-11 ~3 ~12 ~-11 stone_bricks
fill ~-2 ~8 ~-11 ~2 ~10 ~-11 air
setblock ~-1 ~8 ~-11 campfire
setblock ~0 ~8 ~-11 campfire
setblock ~1 ~8 ~-11 campfire
# Chimney
fill ~-1 ~11 ~-11 ~1 ~14 ~-11 stone_bricks
fill ~0 ~11 ~-11 ~0 ~14 ~-11 air

# Library corner (bookshelves)
fill ~-11 ~8 ~-11 ~-8 ~11 ~-8 bookshelf
fill ~-11 ~8 ~-7 ~-11 ~11 ~-5 bookshelf
# Lectern
setblock ~-8 ~8 ~-6 lectern[facing=east]

# Weapon racks (armor stands along east wall)
summon armor_stand ~11 ~8 ~-8 {ShowArms:1b,Rotation:[270f,0f]}
summon armor_stand ~11 ~8 ~-5 {ShowArms:1b,Rotation:[270f,0f]}

# Paintings on walls
setblock ~-11 ~10 ~2 painting
setblock ~11 ~10 ~-2 painting

# ============================================
# THIRD FLOOR - ROYAL CHAMBERS
# ============================================

# Master bedroom
# King's bed
setblock ~-7 ~15 ~-8 red_bed[facing=south,part=head]
setblock ~-7 ~15 ~-7 red_bed[facing=south,part=foot]
setblock ~-6 ~15 ~-8 red_bed[facing=south,part=head]
setblock ~-6 ~15 ~-7 red_bed[facing=south,part=foot]
# Nightstands
setblock ~-8 ~15 ~-8 spruce_trapdoor[facing=south,open=true]
setblock ~-5 ~15 ~-8 spruce_trapdoor[facing=south,open=true]
setblock ~-8 ~16 ~-8 flower_pot
setblock ~-5 ~16 ~-8 flower_pot

# Wardrobe (chests)
setblock ~-10 ~15 ~-5 chest[facing=east]
setblock ~-10 ~15 ~-4 chest[facing=east]
# Carpet
fill ~-9 ~15 ~-9 ~-4 ~15 ~-5 red_carpet

# Guest bedroom
setblock ~7 ~15 ~-8 red_bed[facing=south,part=head]
setblock ~7 ~15 ~-7 red_bed[facing=south,part=foot]
setblock ~5 ~15 ~-8 red_bed[facing=south,part=head]
setblock ~5 ~15 ~-7 red_bed[facing=south,part=foot]
fill ~4 ~15 ~-9 ~9 ~15 ~-5 blue_carpet

# Study area
setblock ~0 ~15 ~0 cartography_table
setblock ~-1 ~15 ~0 crafting_table
setblock ~1 ~15 ~0 smithing_table

# Enchanting room (south side)
setblock ~0 ~15 ~7 enchanting_table
fill ~-2 ~15 ~6 ~-1 ~15 ~8 bookshelf
fill ~1 ~15 ~6 ~2 ~15 ~8 bookshelf
fill ~-1 ~15 ~9 ~1 ~15 ~9 bookshelf
setblock ~0 ~15 ~5 red_carpet
setblock ~-1 ~15 ~5 red_carpet
setblock ~1 ~15 ~5 red_carpet

# Ender chest
setblock ~-10 ~15 ~8 ender_chest[facing=north]

# Brewing stand
setblock ~10 ~15 ~8 brewing_stand
setblock ~9 ~15 ~8 cauldron
