# Pentagram Ritual - Keep drawing particles until lightning
# Loops every 1 second while armor stand exists

# Only run if pentagram is still active
execute unless entity @e[tag=pentagram_center] run return 0

# Star points
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~ ~0.1 ~7 0.2 0 0.2 0 5
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~7 ~0.1 ~2 0.2 0 0.2 0 5
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~4 ~0.1 ~-6 0.2 0 0.2 0 5
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-4 ~0.1 ~-6 0.2 0 0.2 0 5
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-7 ~0.1 ~2 0.2 0 0.2 0 5

# Star lines
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~1 ~0.1 ~5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~2 ~0.1 ~3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~3 ~0.1 ~1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~3 ~0.1 ~-1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~4 ~0.1 ~-3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-1 ~0.1 ~5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-2 ~0.1 ~3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-3 ~0.1 ~1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-3 ~0.1 ~-1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-4 ~0.1 ~-3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~5 ~0.1 ~2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~3 ~0.1 ~2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~1 ~0.1 ~2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-1 ~0.1 ~2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-3 ~0.1 ~2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-5 ~0.1 ~2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~6 ~0.1 ~1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~5 ~0.1 ~-1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~3 ~0.1 ~-2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~1 ~0.1 ~-3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-1 ~0.1 ~-4 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-2 ~0.1 ~-5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-6 ~0.1 ~1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-5 ~0.1 ~-1 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-3 ~0.1 ~-2 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-1 ~0.1 ~-3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~1 ~0.1 ~-4 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~2 ~0.1 ~-5 0 0 0 0 3

# Circle
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~0 ~0.1 ~8 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~3 ~0.1 ~7 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~6 ~0.1 ~5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~7 ~0.1 ~3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~8 ~0.1 ~0 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~7 ~0.1 ~-3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~6 ~0.1 ~-5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~3 ~0.1 ~-7 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~0 ~0.1 ~-8 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-3 ~0.1 ~-7 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-6 ~0.1 ~-5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-7 ~0.1 ~-3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-8 ~0.1 ~0 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-7 ~0.1 ~3 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-6 ~0.1 ~5 0 0 0 0 3
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~-3 ~0.1 ~7 0 0 0 0 3

# Ambient sound
execute at @e[tag=pentagram_center] run playsound minecraft:block.beacon.ambient master @a ~ ~ ~ 0.5 0.5

# Loop every 20 ticks (1 second)
schedule function pentagram:particles 20t
