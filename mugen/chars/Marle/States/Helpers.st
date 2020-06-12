;===========================================================================
; Helpers and other States
;===========================================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7300

[State 7000, Var]
type = VarSet
trigger1 = !Time
var(0) = (Parent, StateNo = 2100)

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
mul = 256 - floor(19.2 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 64, 0, 256
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
time = 1
mul = ceil(38.4 * (time - 40)), ceil(51.2 * (time - 40)), 256
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

;Haste Effect
[Statedef 11777]
Type = A
MoveType = I
Physics = N
ctrl=0
sprpriority = 3

[State 11777: Pal]
type = RemapPal
trigger1 = !Time
trigger1 = PrevStateNo != 11778
source = 1, 1
dest = 2, (Parent, palno)

[State 3510, Elem]
Type = ChangeAnim
trigger1 = root, selfanimexist(Root, Anim)
trigger1 = ifelse((root, movetype = H), (root, stateno = [5000, 5300]), 1)
trigger1 = Anim != Root, Anim || AnimElemNo(0) != Root, AnimElemNo(0)
Value = Root, Anim
Elem = Root, AnimElemNo(0)
ignorehitpause = 1

[State 775, customstatesanim]
type = AssertSpecial
trigger1 = root, movetype = H && (root, stateno != [5000, 5300])
trigger2 = !root, selfanimexist(root, anim)
flag = invisible
ignorehitpause = 1

[State 6965]
Type=Trans
Trigger1 = PrevStateNo != 11778
trigger2 = Time != [0, 16]
trans = addalpha
alpha = floor(128 * (1 + Cos(Pi *(Time - 16)/30.0))), 256 - floor(128 * (1 + Cos(Pi *(Time - 16)/30.0)))
ignorehitpause=1

[State 6965]
Type = PalFX
trigger1 = Time = [0, 16]
add = 256 - Time * 16, 0, 0
mul = 256, 256, 256
time = 1
ignorehitpause=1

[State 6965]
Type=Trans
trigger1 = Time = [0, 16]
trans = none
ignorehitpause=1

[State 6965]
Type=Assertspecial
Trigger1=1
flag=noshadow
ignorehitpause=1

[State 6965]
type=AssertSpecial
trigger1 = Parent, StateNo = 2020 || Parent, StateNo = 2010 || Parent, StateNo = 2000
flag = Invisible
ignorehitpause=1

[State 6965, HitOverride]
Type = NotHitBy
Trigger1 = 1
value = SCA
Time = 1
ignorehitpause=1

[State 6965, BindToRoot]
Type = BindToRoot
Trigger1 = 1
Time = 1
Facing = 1
ignorehitpause=1

[State 6965, DestroySelf] ; The opposite of the conditions for creating the helper, this is for when the armor needs to be removed.
Type = DestroySelf
Trigger1 = !(Root, Var(21))
ignorehitpause=1
