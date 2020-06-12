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

;Magic Wall Effect
[Statedef 11777]
Type = A
MoveType = I
Physics = N
ctrl=0
sprpriority = 3

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

[State 11777]
Type=StateTypeSet ; You want to mimic the statetype of the player, to let the correct types of attacks hit only
Trigger1 = root,statetype = A
Trigger1 = statetype != A
Statetype = A

[State 11777]
Type=StateTypeSet
Trigger1 = root,statetype = C
trigger1 = statetype != C
Statetype = C

[State 11777]
Type = StateTypeSet
Trigger1 = root,statetype = S
trigger1 = statetype != S
Statetype=S

[State 11777]
Type = StateTypeSet
Trigger1 = root,statetype = L
trigger1 = statetype != L
Statetype =L

[State 11777: Pal]
type = RemapPal
trigger1 = !Time
trigger1 = PrevStateNo != 11778
source = 1, 1
dest = 2, (Parent, palno)

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
add = 0, 256 - Time * 16, 0
mul = 256, 256, 256
time = 1
ignorehitpause=1

[State 6965]
Type=Trans
Trigger1 = PrevStateNo = 11778
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
trigger1 = Parent, StateNo = 2022 && Parent, Anim != 0
trigger2 = Parent, StateNo = 2020 || Parent, StateNo = 2010 || Parent, StateNo = 2000
flag = Invisible
ignorehitpause=1

[State 6965, HitOverride]
Type = NotHitBy
Trigger1 = 1
value = , AA, AT
Time = 1
ignorehitpause=1

[State 6965, HitOverride]
Type = HitOverride
Trigger1 = 1
attr = SCA,NP,SP,HP
StateNo = 11778
Time = 1
ForceAir = 0
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

;Counter Projectile Generation
[Statedef 11778]
Type = A
MoveType = H
Physics = N
ctrl=0
anim = 7250
sprpriority = 3

[State 6965]
Type = PalFX
trigger1 = 1
add = 0, 256, 0
mul = 256, 256, 256
time = 1
ignorehitpause=1

[State 1000, Pawnch]
type = Helper
trigger1 = Time = 5
name = "Magic Projectile"
ID = 11779
stateno = 11779
pos =  Const(size.ground.front), Const(size.mid.pos.y)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 6965]
Type=Assertspecial
Trigger1=1
flag=noshadow
ignorehitpause=1

[State 6965, HitOverride]
Type = NotHitBy
Trigger1 = 1
value = SCA,AA,AT,AP
time = 2
ignorehitpause=1

[State 6965, BindToRoot]
Type = BindToRoot
Trigger1 = 1
Time = 1
Facing = 1
ignorehitpause=1

[State 8058, SprPriority]
type = SprPriority
trigger1 = Time >= 0
value =  3
ignorehitpause = 1

[State 8058, StateTypeSet]
type = StateTypeSet
trigger1 = Time > 0
movetype = I

[State 6965, DestroySelf] ; The opposite of the conditions for creating the helper, this is for when the armor needs to be removed.
Type = ChangeState
Trigger1 = Time > 5
value = 11777
ctrl = 0
ignorehitpause=1

[State 6965, DestroySelf] ; The opposite of the conditions for creating the helper, this is for when the armor needs to be removed.
Type = DestroySelf
Trigger1 = !(Root, Var(21))
ignorehitpause=1

; Magic Wall Projectile
[Statedef 11779]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7251
sprpriority = 5
velset = 3, 0

[State 8058, SprPriority]
type = SprPriority
trigger1 = Time >= 0
value =  5
ignorehitpause = 1

[State 1002, DestroySelf]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - Floor(128 * Cos(Pi * Time/10.0)), 128
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 11780
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = Time <= 6
time = 1
value = SCA
ignorehitpause = 1

[State 11779, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1001, HitDef]
type = HitDef
trigger1 = !Time
attr = S, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
priority = 4, Hit
sparkno = -1
damage = 15,4
hitsound = S2,1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = -4, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -3, -1.5
forcestand = 1
getpower = 0, 0
givepower = 5, 5
palfx.add= -128, -100, -7
palfx.mul=256,256,256
palfx.time = 8

[State 1002, Pal]
type = PalFX
trigger1 = 1
invertall = 1
time = -1
ignorehitpause = 1

[State 1001, ChangeState]
type = ChangeState
trigger1 = Time > 80 || MoveContact
value = 11780
ctrl = 0

;---------------------------------------------------------------------------
;Projectile Fade
[Statedef 11780]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7252
velset = 0, 0
sprpriority = 5

[State 1002, DestroySelf]
type = trans
trigger1 = 1
trans = addalpha
alpha =  256 - Time * 32, Time * 16
ignorehitpause = 1

[State 11779, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1002, Pal]
type = PalFX
trigger1 = 1
invertall = 1
time = 1
ignorehitpause = 1

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = Time >= 8