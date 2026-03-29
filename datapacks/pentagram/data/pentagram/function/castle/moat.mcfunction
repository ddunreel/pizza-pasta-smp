# MOAT - Water surrounding the castle
# Outer moat ring (5 blocks wide, 3 deep)
# North moat
fill ~-42 ~-4 ~-42 ~42 ~-2 ~-38 water
fill ~-42 ~-5 ~-42 ~42 ~-5 ~-38 stone
# South moat
fill ~-42 ~-4 ~38 ~42 ~-2 ~42 water
fill ~-42 ~-5 ~38 ~42 ~-5 ~42 stone
# West moat
fill ~-42 ~-4 ~-42 ~-38 ~-2 ~42 water
fill ~-42 ~-5 ~-42 ~-38 ~-5 ~42 stone
# East moat
fill ~38 ~-4 ~-42 ~42 ~-2 ~42 water
fill ~38 ~-5 ~-42 ~42 ~-5 ~42 stone

# Moat walls (stone brick retaining walls)
fill ~-43 ~-4 ~-43 ~43 ~-1 ~-43 stone_bricks
fill ~-43 ~-4 ~43 ~43 ~-1 ~43 stone_bricks
fill ~-43 ~-4 ~-43 ~-43 ~-1 ~43 stone_bricks
fill ~43 ~-4 ~-43 ~43 ~-1 ~43 stone_bricks

fill ~-37 ~-4 ~-37 ~37 ~-1 ~-37 stone_bricks
fill ~-37 ~-4 ~37 ~37 ~-1 ~37 stone_bricks
fill ~-37 ~-4 ~-37 ~-37 ~-1 ~37 stone_bricks
fill ~37 ~-4 ~-37 ~37 ~-1 ~37 stone_bricks

# Drawbridge (south entrance, stone bridge over moat)
fill ~-3 ~-2 ~37 ~3 ~-1 ~42 stone_bricks
fill ~-2 ~-1 ~37 ~2 ~-1 ~42 polished_andesite
# Bridge railings
fill ~-3 ~ ~37 ~-3 ~1 ~42 stone_brick_wall
fill ~3 ~ ~37 ~3 ~1 ~42 stone_brick_wall

# Second bridge (north, smaller)
fill ~-2 ~-2 ~-42 ~2 ~-1 ~-37 stone_bricks
fill ~-1 ~-1 ~-42 ~1 ~-1 ~-37 polished_andesite
fill ~-2 ~ ~-42 ~-2 ~1 ~-37 stone_brick_wall
fill ~2 ~ ~-42 ~2 ~1 ~-37 stone_brick_wall

# Lily pads and seagrass in moat
setblock ~-20 ~-1 ~-40 lily_pad
setblock ~-30 ~-1 ~-40 lily_pad
setblock ~15 ~-1 ~40 lily_pad
setblock ~25 ~-1 ~40 lily_pad
setblock ~-40 ~-1 ~-15 lily_pad
setblock ~-40 ~-1 ~20 lily_pad
setblock ~40 ~-1 ~10 lily_pad
setblock ~40 ~-1 ~-25 lily_pad
