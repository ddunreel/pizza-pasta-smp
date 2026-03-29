# Pentagram Ritual - Pentagram fades away
# Called 2 seconds after lightning

# Vanish effect - big smoke burst
execute at @e[tag=pentagram_center] run particle minecraft:large_smoke ~ ~1 ~ 6 1 6 0.02 200

# Sound
execute at @e[tag=pentagram_center] run playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 2 0.5

# Message
execute at @e[tag=pentagram_center] run tellraw @a [{"text":"[Ritual] ","color":"dark_red","bold":true},{"text":"The pentagram fades into darkness...","color":"gray","italic":true}]

# Remove immortality from summoner
effect clear @a[tag=pentagram_summoner] resistance
effect clear @a[tag=pentagram_summoner] fire_resistance
effect clear @a[tag=pentagram_summoner] regeneration
tag @a remove pentagram_summoner

# Remove the center marker (this also stops the particle loop)
kill @e[tag=pentagram_center]
