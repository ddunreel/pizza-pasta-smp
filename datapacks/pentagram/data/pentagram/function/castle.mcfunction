# EPIC CASTLE - Master builder
# Usage: /function pentagram:castle
# Stand at where you want the center

tellraw @a [{"text":"[Castle] ","color":"gold","bold":true},{"text":"Building epic castle... Please wait.","color":"yellow"}]

# Phase 1: Clear and foundation
function pentagram:castle/clear
# Phase 2: Moat and bridge
function pentagram:castle/moat
# Phase 3: Outer walls and battlements
function pentagram:castle/walls
# Phase 4: Corner towers
function pentagram:castle/towers
# Phase 5: Gatehouse
function pentagram:castle/gate
# Phase 6: Inner keep
function pentagram:castle/keep
# Phase 7: Keep interior (throne room, dining, bedrooms)
function pentagram:castle/interior
# Phase 8: Courtyard buildings (chapel, barracks, armory, stable)
function pentagram:castle/courtyard
# Phase 9: Gardens, market, well, decorations
function pentagram:castle/decorations
# Phase 10: Dungeon under the keep
function pentagram:castle/dungeon
# Phase 11: Lighting everywhere
function pentagram:castle/lighting

tellraw @a [{"text":"[Castle] ","color":"gold","bold":true},{"text":"The EPIC castle is complete!","color":"yellow","bold":true}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
