;===========================================================================
; Helpers and other States
;===========================================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7200

[State 7000, Var]
type = VarSet
trigger1 = !Time
var(0) = (Parent, StateNo = 2100)

[State 7000, Pal Down]
type = BGPalFX
trigger1 = !var(0)
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
add = 256 -ceil(20.6 * time), 256 -ceil(20.6 * time), 256 -ceil(20.6 * time)
mul = 256 -floor(20.6 * time), 256 -floor(20.6 * time), 256 -floor(20.6 * time)
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = !var(0)
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 50,50,50;128, 128, 128
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
trigger1 = !var(0)
time = 1
mul = 50 + ceil(41.2 * (time - 40)), 50 + ceil(41.2 * (time - 40)), 50 +ceil(41.2 * (time - 40))
color = floor(51.2 * (time - 40))

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
trigger1 = var(0)
time = 1
mul = 256, 256 -floor(25.6 * time), 256 -floor(25.6 * time)
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
trigger1 = var(0)
time = 1
mul = 256, 0, 0
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
trigger1 = var(0)
time = 1
mul = 256, ceil(51.2 * (time - 40)), ceil(51.2 * (time - 40))
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45


