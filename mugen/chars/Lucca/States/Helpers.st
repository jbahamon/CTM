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
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
mul = 256, 256 -floor(25.6 * time), 256 -floor(25.6 * time)
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 256, 0, 0
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
time = 1
mul = 256, ceil(51.2 * (time - 40)), ceil(51.2 * (time - 40))
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

;Protect Super Armor
;
[Statedef 11777]
Type = A
MoveType = H
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
[State 11777: Pal]
type = RemapPal
trigger1 = !Time
source = 1, 1
dest = 2, (Parent, palno)

[State 11777]
Type=VarSet
Trigger1=var(15)=0
Trigger2=fvar(15)=0
fvar(15)=1

[State 11777]
Type=VarSet
Trigger1=var(15)=0
var(16)=0

[State 11777]
Type=VarAdd
Trigger1=var(15)>0
var(15)=-1

[State 11777]
Type=VarSet
Trigger1=time=0
var(15)=27

[State 11777]
Type=VarAdd
Trigger1=time=0
var(16)=GetHitVar(Damage)

[State 11777]
Type=VarSet
Trigger1=time=0
Trigger1=var(16)>=125
Trigger1=GetHitVar(Damage)>=20
fvar(15)=fvar(15)*0.8

[State 11777]
Type=VarSet
Trigger1=fvar(15)<0.05
fvar(15)=0.05

[State 6965]
Type=Assertspecial
Trigger1=1
flag=noshadow
ignorehitpause=1

[State 6965]
Type=Trans
Trigger1=1
trans = addalpha
alpha = floor(128 * (1 + Sin(Pi *(GameTime)/30.0))), 256 - floor(128 * (1 + Sin(Pi *(GameTime)/30.0)))
ignorehitpause=1

[State 6965]
type=AssertSpecial
trigger1 = Parent, StateNo = 2020 || Parent, StateNo = 2010 || Parent, StateNo = 2000
flag = Invisible
ignorehitpause=1

[State 6965, HitOverride]
Type = NotHitBy
Trigger1 = 1
value = , AT
Time = 1
ignorehitpause=1

[State 6965, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA, AA, AP
StateNo = 11777
Time = 1
ForceAir = 0
ignorehitpause=1

[State 6965, BindToRoot]
Type = BindToRoot
Trigger1 = 1
Time = 1
Facing = 1
ignorehitpause=1

[State 6966, VarSet]
Type = VarSet
Trigger1 = Time = 0
FV = 1
Value = GetHitVar(Damage)*fvar(15)
ignorehitpause=1

[State 6966, ParentVarAdd]
Type = ParentVarAdd
Trigger1 = Time = 0
fV = 29
Value = fVar(1)
ignorehitpause=1

[State 6965, DestroySelf] ; The opposite of the conditions for creating the helper, this is for when the armor needs to be removed.
Type = DestroySelf
Trigger1 = !(Root, Var(21))
ignorehitpause=1
