# Pentagram Ritual - Summon the pentagram at the player's position
# Usage: /function pentagram:summon

# Tag the player who summoned the ritual
tag @s add pentagram_summoner

# Make summoner immortal for the ritual (35 seconds)
effect give @s resistance 35 4 true
effect give @s fire_resistance 35 4 true
effect give @s regeneration 35 4 true

# Mark the center with an armor stand
summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["pentagram_center"]}

# === Draw pentagram with particles (soul fire) ===
# Star points
particle minecraft:soul_fire_flame ~ ~0.1 ~7 0.2 0 0.2 0 5
particle minecraft:soul_fire_flame ~7 ~0.1 ~2 0.2 0 0.2 0 5
particle minecraft:soul_fire_flame ~4 ~0.1 ~-6 0.2 0 0.2 0 5
particle minecraft:soul_fire_flame ~-4 ~0.1 ~-6 0.2 0 0.2 0 5
particle minecraft:soul_fire_flame ~-7 ~0.1 ~2 0.2 0 0.2 0 5

# Star lines - Point 1 (top) to Point 3 (lower right)
particle minecraft:soul_fire_flame ~1 ~0.1 ~5 0 0 0 0 3
particle minecraft:soul_fire_flame ~2 ~0.1 ~3 0 0 0 0 3
particle minecraft:soul_fire_flame ~3 ~0.1 ~1 0 0 0 0 3
particle minecraft:soul_fire_flame ~3 ~0.1 ~-1 0 0 0 0 3
particle minecraft:soul_fire_flame ~4 ~0.1 ~-3 0 0 0 0 3

# Star lines - Point 1 (top) to Point 4 (lower left)
particle minecraft:soul_fire_flame ~-1 ~0.1 ~5 0 0 0 0 3
particle minecraft:soul_fire_flame ~-2 ~0.1 ~3 0 0 0 0 3
particle minecraft:soul_fire_flame ~-3 ~0.1 ~1 0 0 0 0 3
particle minecraft:soul_fire_flame ~-3 ~0.1 ~-1 0 0 0 0 3
particle minecraft:soul_fire_flame ~-4 ~0.1 ~-3 0 0 0 0 3

# Star lines - Point 2 to Point 5
particle minecraft:soul_fire_flame ~5 ~0.1 ~2 0 0 0 0 3
particle minecraft:soul_fire_flame ~3 ~0.1 ~2 0 0 0 0 3
particle minecraft:soul_fire_flame ~1 ~0.1 ~2 0 0 0 0 3
particle minecraft:soul_fire_flame ~-1 ~0.1 ~2 0 0 0 0 3
particle minecraft:soul_fire_flame ~-3 ~0.1 ~2 0 0 0 0 3
particle minecraft:soul_fire_flame ~-5 ~0.1 ~2 0 0 0 0 3

# Star lines - Point 2 to Point 4
particle minecraft:soul_fire_flame ~6 ~0.1 ~1 0 0 0 0 3
particle minecraft:soul_fire_flame ~5 ~0.1 ~-1 0 0 0 0 3
particle minecraft:soul_fire_flame ~3 ~0.1 ~-2 0 0 0 0 3
particle minecraft:soul_fire_flame ~1 ~0.1 ~-3 0 0 0 0 3
particle minecraft:soul_fire_flame ~-1 ~0.1 ~-4 0 0 0 0 3
particle minecraft:soul_fire_flame ~-2 ~0.1 ~-5 0 0 0 0 3

# Star lines - Point 3 to Point 5
particle minecraft:soul_fire_flame ~-6 ~0.1 ~1 0 0 0 0 3
particle minecraft:soul_fire_flame ~-5 ~0.1 ~-1 0 0 0 0 3
particle minecraft:soul_fire_flame ~-3 ~0.1 ~-2 0 0 0 0 3
particle minecraft:soul_fire_flame ~-1 ~0.1 ~-3 0 0 0 0 3
particle minecraft:soul_fire_flame ~1 ~0.1 ~-4 0 0 0 0 3
particle minecraft:soul_fire_flame ~2 ~0.1 ~-5 0 0 0 0 3

# Circle
particle minecraft:soul_fire_flame ~0 ~0.1 ~8 0 0 0 0 3
particle minecraft:soul_fire_flame ~3 ~0.1 ~7 0 0 0 0 3
particle minecraft:soul_fire_flame ~6 ~0.1 ~5 0 0 0 0 3
particle minecraft:soul_fire_flame ~7 ~0.1 ~3 0 0 0 0 3
particle minecraft:soul_fire_flame ~8 ~0.1 ~0 0 0 0 0 3
particle minecraft:soul_fire_flame ~7 ~0.1 ~-3 0 0 0 0 3
particle minecraft:soul_fire_flame ~6 ~0.1 ~-5 0 0 0 0 3
particle minecraft:soul_fire_flame ~3 ~0.1 ~-7 0 0 0 0 3
particle minecraft:soul_fire_flame ~0 ~0.1 ~-8 0 0 0 0 3
particle minecraft:soul_fire_flame ~-3 ~0.1 ~-7 0 0 0 0 3
particle minecraft:soul_fire_flame ~-6 ~0.1 ~-5 0 0 0 0 3
particle minecraft:soul_fire_flame ~-7 ~0.1 ~-3 0 0 0 0 3
particle minecraft:soul_fire_flame ~-8 ~0.1 ~0 0 0 0 0 3
particle minecraft:soul_fire_flame ~-7 ~0.1 ~3 0 0 0 0 3
particle minecraft:soul_fire_flame ~-6 ~0.1 ~5 0 0 0 0 3
particle minecraft:soul_fire_flame ~-3 ~0.1 ~7 0 0 0 0 3

# === Atmosphere ===
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 2 0.5

# Tell player the ritual has begun
tellraw @a [{"text":"[Ritual] ","color":"dark_red","bold":true},{"text":"The pentagram has been drawn... Lightning strikes in 30 seconds.","color":"red"}]

# Schedule particle loop to keep pentagram visible
schedule function pentagram:particles 20t

# Schedule lightning after 30 seconds (600 ticks)
schedule function pentagram:lightning 600t
