# Flatten spawn area 500x500 - strips everything above sea level
# Usage: /function pentagram:flatten

tellraw @a [{"text":"[World] ","color":"red","bold":true},{"text":"Flattening spawn... expect lag for a minute.","color":"yellow"}]

# Ground layer
fill ~-250 63 ~-250 ~250 63 ~250 dirt replace
fill ~-250 64 ~-250 ~250 64 ~250 grass_block replace

# Clear above ground in vertical slices (32 block tall strips across full width)
# y=65 to y=96
fill ~-250 65 ~-250 ~250 96 ~-125 air
fill ~-250 65 ~-124 ~250 96 ~0 air
fill ~-250 65 ~1 ~250 96 ~125 air
fill ~-250 65 ~126 ~250 96 ~250 air

# y=97 to y=128
fill ~-250 97 ~-250 ~250 128 ~-125 air
fill ~-250 97 ~-124 ~250 128 ~0 air
fill ~-250 97 ~1 ~250 128 ~125 air
fill ~-250 97 ~126 ~250 128 ~250 air

# y=129 to y=160
fill ~-250 129 ~-250 ~250 160 ~-125 air
fill ~-250 129 ~-124 ~250 160 ~0 air
fill ~-250 129 ~1 ~250 160 ~125 air
fill ~-250 129 ~126 ~250 160 ~250 air

# y=161 to y=192
fill ~-250 161 ~-250 ~250 192 ~-125 air
fill ~-250 161 ~-124 ~250 192 ~0 air
fill ~-250 161 ~1 ~250 192 ~125 air
fill ~-250 161 ~126 ~250 192 ~250 air

# y=193 to y=224
fill ~-250 193 ~-250 ~250 224 ~-125 air
fill ~-250 193 ~-124 ~250 224 ~0 air
fill ~-250 193 ~1 ~250 224 ~125 air
fill ~-250 193 ~126 ~250 224 ~250 air

# y=225 to y=256
fill ~-250 225 ~-250 ~250 256 ~-125 air
fill ~-250 225 ~-124 ~250 256 ~0 air
fill ~-250 225 ~1 ~250 256 ~125 air
fill ~-250 225 ~126 ~250 256 ~250 air

# y=257 to y=320
fill ~-250 257 ~-250 ~250 320 ~-125 air
fill ~-250 257 ~-124 ~250 320 ~0 air
fill ~-250 257 ~1 ~250 320 ~125 air
fill ~-250 257 ~126 ~250 320 ~250 air

tellraw @a [{"text":"[World] ","color":"green","bold":true},{"text":"Spawn area flattened! 500x500 flat grass.","color":"yellow"}]
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 1
