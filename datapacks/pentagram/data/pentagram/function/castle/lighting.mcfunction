# LIGHTING - Torches, lanterns, and candles everywhere

# ============================================
# WALL TORCHES (inside walls)
# ============================================
# North wall interior
setblock ~-30 ~5 ~-34 wall_torch[facing=south]
setblock ~-20 ~5 ~-34 wall_torch[facing=south]
setblock ~-10 ~5 ~-34 wall_torch[facing=south]
setblock ~0 ~5 ~-34 wall_torch[facing=south]
setblock ~10 ~5 ~-34 wall_torch[facing=south]
setblock ~20 ~5 ~-34 wall_torch[facing=south]
setblock ~30 ~5 ~-34 wall_torch[facing=south]

# South wall interior
setblock ~-30 ~5 ~34 wall_torch[facing=north]
setblock ~-20 ~5 ~34 wall_torch[facing=north]
setblock ~-10 ~5 ~34 wall_torch[facing=north]
setblock ~10 ~5 ~34 wall_torch[facing=north]
setblock ~20 ~5 ~34 wall_torch[facing=north]
setblock ~30 ~5 ~34 wall_torch[facing=north]

# West wall interior
setblock ~-34 ~5 ~-30 wall_torch[facing=east]
setblock ~-34 ~5 ~-20 wall_torch[facing=east]
setblock ~-34 ~5 ~-10 wall_torch[facing=east]
setblock ~-34 ~5 ~0 wall_torch[facing=east]
setblock ~-34 ~5 ~10 wall_torch[facing=east]
setblock ~-34 ~5 ~20 wall_torch[facing=east]
setblock ~-34 ~5 ~30 wall_torch[facing=east]

# East wall interior
setblock ~34 ~5 ~-30 wall_torch[facing=west]
setblock ~34 ~5 ~-20 wall_torch[facing=west]
setblock ~34 ~5 ~-10 wall_torch[facing=west]
setblock ~34 ~5 ~0 wall_torch[facing=west]
setblock ~34 ~5 ~10 wall_torch[facing=west]
setblock ~34 ~5 ~20 wall_torch[facing=west]
setblock ~34 ~5 ~30 wall_torch[facing=west]

# Wall top torches
setblock ~-30 ~15 ~-36 wall_torch[facing=south]
setblock ~-15 ~15 ~-36 wall_torch[facing=south]
setblock ~0 ~15 ~-36 wall_torch[facing=south]
setblock ~15 ~15 ~-36 wall_torch[facing=south]
setblock ~30 ~15 ~-36 wall_torch[facing=south]
setblock ~-30 ~15 ~36 wall_torch[facing=north]
setblock ~-15 ~15 ~36 wall_torch[facing=north]
setblock ~15 ~15 ~36 wall_torch[facing=north]
setblock ~30 ~15 ~36 wall_torch[facing=north]
setblock ~-36 ~15 ~-30 wall_torch[facing=east]
setblock ~-36 ~15 ~-15 wall_torch[facing=east]
setblock ~-36 ~15 ~0 wall_torch[facing=east]
setblock ~-36 ~15 ~15 wall_torch[facing=east]
setblock ~-36 ~15 ~30 wall_torch[facing=east]
setblock ~36 ~15 ~-30 wall_torch[facing=west]
setblock ~36 ~15 ~-15 wall_torch[facing=west]
setblock ~36 ~15 ~0 wall_torch[facing=west]
setblock ~36 ~15 ~15 wall_torch[facing=west]
setblock ~36 ~15 ~30 wall_torch[facing=west]

# ============================================
# COURTYARD LANTERNS (on posts)
# ============================================
setblock ~-12 ~ ~28 oak_fence
setblock ~-12 ~1 ~28 lantern[hanging=false]
setblock ~12 ~ ~28 oak_fence
setblock ~12 ~1 ~28 lantern[hanging=false]
setblock ~-12 ~ ~-18 oak_fence
setblock ~-12 ~1 ~-18 lantern[hanging=false]
setblock ~12 ~ ~-18 oak_fence
setblock ~12 ~1 ~-18 lantern[hanging=false]

# Path lanterns
setblock ~-3 ~ ~16 oak_fence
setblock ~-3 ~1 ~16 lantern[hanging=false]
setblock ~3 ~ ~16 oak_fence
setblock ~3 ~1 ~16 lantern[hanging=false]
setblock ~-3 ~ ~26 oak_fence
setblock ~-3 ~1 ~26 lantern[hanging=false]
setblock ~3 ~ ~26 oak_fence
setblock ~3 ~1 ~26 lantern[hanging=false]
setblock ~-3 ~ ~32 oak_fence
setblock ~-3 ~1 ~32 lantern[hanging=false]
setblock ~3 ~ ~32 oak_fence
setblock ~3 ~1 ~32 lantern[hanging=false]

# ============================================
# KEEP INTERIOR LIGHTING
# ============================================
# Throne room chandeliers
setblock ~-4 ~5 ~-6 chain
setblock ~-4 ~4 ~-6 lantern[hanging=true]
setblock ~4 ~5 ~-6 chain
setblock ~4 ~4 ~-6 lantern[hanging=true]
setblock ~-4 ~5 ~0 chain
setblock ~-4 ~4 ~0 lantern[hanging=true]
setblock ~4 ~5 ~0 chain
setblock ~4 ~4 ~0 lantern[hanging=true]
setblock ~-4 ~5 ~6 chain
setblock ~-4 ~4 ~6 lantern[hanging=true]
setblock ~4 ~5 ~6 chain
setblock ~4 ~4 ~6 lantern[hanging=true]
setblock ~0 ~5 ~-4 chain
setblock ~0 ~4 ~-4 lantern[hanging=true]
setblock ~0 ~5 ~4 chain
setblock ~0 ~4 ~4 lantern[hanging=true]

# Dining hall
setblock ~-3 ~12 ~-3 chain
setblock ~-3 ~11 ~-3 lantern[hanging=true]
setblock ~3 ~12 ~-3 chain
setblock ~3 ~11 ~-3 lantern[hanging=true]
setblock ~0 ~12 ~-3 chain
setblock ~0 ~11 ~-3 lantern[hanging=true]
setblock ~0 ~12 ~5 chain
setblock ~0 ~11 ~5 lantern[hanging=true]

# Royal chambers
setblock ~-7 ~19 ~-7 chain
setblock ~-7 ~18 ~-7 lantern[hanging=true]
setblock ~7 ~19 ~-7 chain
setblock ~7 ~18 ~-7 lantern[hanging=true]
setblock ~0 ~19 ~0 chain
setblock ~0 ~18 ~0 lantern[hanging=true]
setblock ~0 ~19 ~7 chain
setblock ~0 ~18 ~7 lantern[hanging=true]

# ============================================
# BUILDING INTERIOR LIGHTING
# ============================================
# Chapel
setblock ~25 ~6 ~-22 chain
setblock ~25 ~5 ~-22 lantern[hanging=true]
setblock ~25 ~6 ~-26 chain
setblock ~25 ~5 ~-26 lantern[hanging=true]
setblock ~25 ~6 ~-30 chain
setblock ~25 ~5 ~-30 lantern[hanging=true]

# Barracks
setblock ~-25 ~5 ~-26 chain
setblock ~-25 ~4 ~-26 lantern[hanging=true]
setblock ~-25 ~5 ~-22 chain
setblock ~-25 ~4 ~-22 lantern[hanging=true]

# Armory
setblock ~-26 ~5 ~26 chain
setblock ~-26 ~4 ~26 lantern[hanging=true]
setblock ~-26 ~5 ~30 chain
setblock ~-26 ~4 ~30 lantern[hanging=true]

# Stable
setblock ~23 ~4 ~26 lantern[hanging=true]
setblock ~26 ~4 ~26 lantern[hanging=true]
setblock ~29 ~4 ~26 lantern[hanging=true]

# Market stalls
setblock ~30 ~2 ~-13 lantern[hanging=true]
setblock ~30 ~2 ~-8 lantern[hanging=true]
setblock ~30 ~2 ~-3 lantern[hanging=true]

# ============================================
# TOWER LIGHTING
# ============================================
# NW tower
setblock ~-37 ~3 ~-37 torch
setblock ~-37 ~8 ~-37 torch
setblock ~-37 ~13 ~-37 torch
setblock ~-37 ~18 ~-37 torch
# NE tower
setblock ~37 ~3 ~-37 torch
setblock ~37 ~8 ~-37 torch
setblock ~37 ~13 ~-37 torch
setblock ~37 ~18 ~-37 torch
# SW tower
setblock ~-37 ~3 ~37 torch
setblock ~-37 ~8 ~37 torch
setblock ~-37 ~13 ~37 torch
setblock ~-37 ~18 ~37 torch
# SE tower
setblock ~37 ~3 ~37 torch
setblock ~37 ~8 ~37 torch
setblock ~37 ~13 ~37 torch
setblock ~37 ~18 ~37 torch

# Gate tower lighting
setblock ~-7 ~3 ~36 soul_lantern[hanging=true]
setblock ~7 ~3 ~36 soul_lantern[hanging=true]
setblock ~-7 ~10 ~36 soul_lantern[hanging=true]
setblock ~7 ~10 ~36 soul_lantern[hanging=true]

# Bridge torches
setblock ~-3 ~2 ~38 wall_torch[facing=east]
setblock ~3 ~2 ~38 wall_torch[facing=west]
setblock ~-3 ~2 ~41 wall_torch[facing=east]
setblock ~3 ~2 ~41 wall_torch[facing=west]
