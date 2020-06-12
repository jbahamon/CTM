;==========================================================
; Global Helpers
;==========================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7400

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
mul = 256 -floor(25.6 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 0, 0, 256
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
time = 1
mul = ceil(51.2 * (time - 40)), ceil(51.2 * (time - 40)), 256
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

;Masa & Mune entrance
[Statedef 7010]
type = S
physics = N
movetype = I
anim = 3031
sprpriority = -2

[State 7010, appear]
type = trans
trigger1 = 1
trans = addalpha
alpha = 16 * Time, 256 - 8 * Time
ignorehitpause = 1

[State 7010, End]
type = ChangeState
trigger1 = Time >= 16
value = 7011

; Idle Masa&Mune
[Statedef 7011]
type = S
physics = N
movetype = I
anim = 3032
sprpriority = -2

[State 7011, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA,AA,AP
stateno = 7015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = ,AT
ignorehitpause = 1

[State 7011, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "var(0) = %d"
params = Var(0)

[State 7011, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7011, Selector Var]
type = VarSet
trigger1 = Parent, MoveType != A
var(0) = 0

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7011, Light Hit]
type = ChangeState
trigger1 = !Parent, Power
trigger2 = Parent, Var(22) <= 0
value = 7018

[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 200
trigger2 = Parent, StateNo = 400
trigger3 = Parent, StateNo = 600
trigger4 = (Parent, StateNo = [1000, 1001]) && Parent, Var(1) = 1
trigger5 = (Parent, StateNo = 1020) && Parent, Var(1) = 1
trigger6 = (Parent, StateNo = 1040) && Parent, Var(1) = 1
value = 7012

[State 7011, Mid Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 210
trigger2 = Parent, StateNo = 410
trigger3 = Parent, StateNo = 610
trigger4 = (Parent, StateNo = [1000, 1001]) && Parent, Var(1) = 2
trigger5 = (Parent, StateNo = 1020) && Parent, Var(1) = 2
trigger6 = (Parent, StateNo = 1040) && Parent, Var(1) = 2
value = 7013

[State 7011, Heavy Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 220
trigger2 = Parent, StateNo = 420
trigger3 = Parent, StateNo = 620
trigger4 = (Parent, StateNo = [1000, 1001]) && Parent, Var(1) = 3
trigger5 = (Parent, StateNo = 1020) && Parent, Var(1) = 3
trigger6 = (Parent, StateNo = 1040) && Parent, Var(1) = 3
value = 7014

[State 7011, Light Hit]
type = ChangeState
triggerall = Parent, StateNo != Var(0)
trigger1 = Parent, StateNo = 3000
value = 7016


;Light Attack
[Statedef 7012]
type = S
physics = N
movetype = A
anim = 3033
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7015, ChangeAnim]
type = ParentVarAdd
trigger1 = !Time
trigger1 = PrevStateNo != 7015
var(22) = -200
ignorehitpause = 1

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 10
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7002,1
guardsound = 6,0
sparkno=s7004
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -2
air.velocity = -2,-2
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p1sprpriority = -3
fall = 0

[State 7012, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
stateno = 7015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7012, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7012, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7011, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 7011

;Mid Attack
[Statedef 7013]
type = S
physics = N
movetype = A
anim = 3034
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = ParentVarAdd
trigger1 = !Time
trigger1 = PrevStateNo != 7015
var(22) = -240
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7013, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 7015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7013, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7013, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7013, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 7011

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 12
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
ground.type = High
ground.hittime  = 7
ground.velocity = -2.5
air.velocity = 0,10
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
p1sprpriority = -2
p1sprpriority = -3
fall = 0


;Strong Attack
[Statedef 7014]
type = S
physics = N
movetype = A
anim = 3035
sprpriority = -2
facep2= 1

[State 7015, ChangeAnim]
type = ParentVarAdd
trigger1 = !Time
trigger1 = PrevStateNo != 7015
var(22) = -300
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7014, Turn]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 7015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST,HT 
ignorehitpause = 1

[State 7021, hit]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Hard
damage    = 15
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7020,1
guardsound = 6,0
sparkno=s7006
sparkxy=-8,5
p1sprpriority = -2
p1sprpriority = -3
ground.type = High
ground.hittime  = 7
ground.velocity = 0,-6
air.velocity = 0,-6
animtype=Medium
air.animtype=Medium
getpower = 0, 0
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10
fall = 0


[State 7014, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/10.0
Y = (ParentDist Y - 10)/10.0
ignorehitpause = 1

[State 7014, Selector Var]
type = VarSet
trigger1 = !Time
var(0) = Parent, StateNo

[State 7014, Light Hit]
type = ChangeState
trigger1 = !AnimTime
value = 7011

; Masa & Mune Gethit
[Statedef 7015]
MoveType = H
poweradd = 0
 
[State 7015, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA,AA, AP
stateno = 7015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 10
value = SCA ,AA, AP
time = 1
ignorehitpause = 1
     
[State 7015, LifeAdd]
type = ParentVarAdd
trigger1 = Time = 0
v = 22
value = - 4 * floor(gethitvar(damage))
ignorehitpause = 1

[State 7015, ChangeAnim]
type = ChangeAnim
trigger1 = Time < floor(gethitvar(hittime) * 0.8)
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1
     
[State 7015, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = var(1) = [7011,7014]
value = 7011
ignorehitpause = 1

[State 7015, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.8)
trigger1 = var(1) != [7011,7014]
value = var(1)
ignorehitpause = 1

;Initiating Frog Squash Da
[Statedef 7016]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3036
sprpriority = 1

[State 7015, ChangeAnim]
type = ParentVarAdd
trigger1 = !Time
trigger1 = PrevStateNo != 7015
var(22) = -3000
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(1) = StateNo
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = MoveHit
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 7011, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 7015
ignorehitpause = 1

[State 7011, HitOverride]
type = NotHitBy
trigger1 = 1
value = SCA, AT
ignorehitpause = 1

[State 3010, go]
type = VelSet
trigger1 = Var(2) = 45
X = 6.5
Y = 0
persistent = 0

[State 3010, go]
type = VelSet
trigger1 = MoveContact || Var(2) > 60
X = 0

[State 3010, HitDef]
type = HitDef
trigger1 = (AnimElem = 2) && Anim = 3036
attr = S,HT        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MA-        ;HLAFD+-
guardflag = MA         ;HLA
animtype = light          ;light,medium,hard,back,up,diagup
air.animtype = light
damage = 20,0
;guard.pause,0
sparkno = -1
sparkxy = 0,0
hitsound = S7001,1
guardsound = S2,0
ground.type = High      ;Low,Trip,None
air.hittime = 20
ground.velocity = 0,0
air.velocity = 0,0
p1getp2facing = 0
down.bounce = 0
id = 0
chainID = -1
nochainID = -1
hitonce = 1
kill = 0
numhits = 0

[State 7011, Succesive hitsounds]
type = PlaySnd
trigger1 = MoveHit && AnimElemTime(2) = 1
trigger1 = Anim = 3036
value = S7001,1
ignorehitpause = 1


[State 7011, Final Hitsound]
type = PlaySnd
trigger1 = MoveHit && AnimElemTime(2) = 1
trigger1 = Anim = 3037
value = S7016,1
ignorehitpause = 1


[State 7011, HitOverride]
type = PlaySnd
trigger1 = !Time
value = S7020,1
ignorehitpause = 1

[State 3010, Hit]
type = EnvShake
triggerall = NumTarget
trigger1 = MoveHit && (AnimElemTime(2) = 1)
trigger2 = Anim = 3037 && AnimElem = 2
time = 8
freq = 120
ampl = 3

[State 3010, Hit]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = MoveHit && (AnimElemTime(2) = 1)
trigger2 = Anim = 3037 && AnimElem = 2
value = -10
kill = 0

[State 3010, pos]
type = Varset
trigger1 = NumTarget
fvar(0) = Target, Pos X
persistent = 0

[State 3010, pos]
type = Varset
trigger1 = NumTarget
fvar(1) = Target, Pos Y
persistent = 0

[State 3010, Hit]
type = TargetBind
trigger1 = NumTarget
pos = Facing * (fvar(0) - Pos X), fvar(1) - Pos Y
ignorehitpause = 1

[State 3010, Hit]
type = TargetState
trigger1 = NumTarget
value = 3020
ignorehitpause = 1
persistent = 0

[State 3010, go]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo = 7011
var(2) = 0

[State 3010, go]
type = VarAdd
trigger1 = 1
var(2) = 1

[State 3010, go]
type = VarAdd
trigger1 = MoveContact
var(0) = 1

[State 3010, go]
type = VarSet
trigger1 = !Time 
var(0) = 0

[State 3010, go]
type = VarAdd
trigger1 = MoveContact
var(0) = 1

[State 3010, End]
type = ChangeAnim
trigger1 = Var(0) = 120
value = 3037

[State 3010, Trans]
type = Trans
trigger1 = Var(0) > 160 && MoveContact
trans = addalpha
alpha = 256 - 16 * (Var(0) - 160), 128 + 8 * (Var(0) - 160)
ignorehitpause = 1

[State 3010, End]
type = ChangeState
trigger1 = (Var(2) > 136) && !MoveHit
trigger2 = Var(0) > 176 && MoveHit
value = IfElse(MoveHit, 7019, 7018)

;Masamune
[Statedef 7017]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3008
sprpriority = 1

[State 3010, Interrupt]
trigger1 = !(Parent, NumHelper(3002))
trigger1 = Parent, AnimElemNo(0) > 6 
trigger1 = Parent, Anim = 3001
type = ChangeState
value = 7018
ignorehitpause = 1

[State 3010, Trans]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 8 * Time

[State 3012, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3012, Teleport]
type = PosSet
trigger1 = !Time
X = root, Pos X
Y = root, Pos Y - 17

;Masamune End
[Statedef 7018]
type = S
physics = N
movetype = I
velset = 0,0
anim = 3031

[State 7010, appear]
type = trans
trigger1 = Time = [16, 32]
trans = addalpha
alpha = 256 - 16 * (Time - 16), 128 + 8 * (Time - 16)
ignorehitpause = 1

[State 7010, End]
type = ParentVarSet
trigger1 = Time >= 32
var(21) = 0

[State 7010, End]
type = DestroySelf
trigger1 = Time >= 32

;Masa&Mune Invisible
[Statedef 7019]
type = S
physics = N
movetype = A
anim = 7400

[State 3010, Hit]
type = TargetBind
trigger1 = NumTarget
pos = Facing * (fvar(0) - Pos X), fvar(1) - Pos Y
ignorehitpause = 1

[State 7019, Premature End]
type = TargetDrop
trigger1 = Parent, StateNo != [3000, 3003]

[State 7019, Parent]
type = ParentVarSet
trigger1 = NumTarget
fv = 0
value = Target, Pos X

[State 7019, Parent]
type = ParentVarSet
trigger1 = NumTarget
fv = 1
value = Target, Pos Y

[State 7019, Target]
type = TargetState
triggerall = NumTarget
trigger1 = Parent, StateNo = 3002
trigger1 = Parent, Var(0) > 0
value = 3021
persistent = 0

[State 7019, Target]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = Parent, StateNo = 3002
trigger1 = Parent, Var(0) > 0
value = -67
persistent = 0
kill = 0

[State 7019, Target]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = Parent, StateNo = 3003
trigger1 = Parent, var(0) > 30
value = -73
persistent = 0
kill = 1

[State 7010, End]
type = ParentVarSet
trigger1 = Parent, StateNo != [3000, 3003]
var(21) = 0

[State 7010, End]
type = DestroySelf
trigger1 = Parent, StateNo != [3000, 3003]
