# Pentagram Ritual - Lightning strikes after 30 seconds

# Make all nearby players immortal during lightning
execute at @e[tag=pentagram_center] run effect give @a[distance=..20] resistance 10 4 true
execute at @e[tag=pentagram_center] run effect give @a[distance=..20] fire_resistance 10 4 true
execute at @e[tag=pentagram_center] run effect give @a[distance=..20] regeneration 10 4 true

# Summon real lightning bolts at center and star points
execute at @e[tag=pentagram_center] run summon lightning_bolt ~ ~ ~
execute at @e[tag=pentagram_center] run summon lightning_bolt ~ ~ ~7
execute at @e[tag=pentagram_center] run summon lightning_bolt ~7 ~ ~2
execute at @e[tag=pentagram_center] run summon lightning_bolt ~4 ~ ~-6
execute at @e[tag=pentagram_center] run summon lightning_bolt ~-4 ~ ~-6
execute at @e[tag=pentagram_center] run summon lightning_bolt ~-7 ~ ~2

# Extra particles
execute at @e[tag=pentagram_center] run particle minecraft:soul_fire_flame ~ ~1 ~ 5 2 5 0.05 200
execute at @e[tag=pentagram_center] run particle minecraft:large_smoke ~ ~1 ~ 5 2 5 0.05 100

# Dramatic sounds
execute at @e[tag=pentagram_center] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 2 0.5
execute at @e[tag=pentagram_center] run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8

# Message
execute at @e[tag=pentagram_center] run tellraw @a [{"text":"[Ritual] ","color":"dark_red","bold":true},{"text":"THE RITUAL IS COMPLETE!","color":"yellow","bold":true}]

# Schedule the pentagram disappearance (2 seconds after lightning = 40 ticks)
schedule function pentagram:disappear 40t
