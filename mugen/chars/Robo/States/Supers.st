;===========================================================================
; Supers
;===========================================================================

;---------------------------------------------------------------------------
;Shock
[Statedef 2000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 2000
sprpriority = 1
poweradd = 0
facep2 = 1

[State 2000, NHB]
type = NotHitBy
trigger1 = Anim = 2000
trigger2 = Anim = 2001 && AnimElemNo(0) <= 4
time = 1
value = SCA
ignorehitpause = 1

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S1,1;S a7,2
p2defmul = 1
poweradd = -1000
darken = 0

[State 2000, End]
type = ChangeAnim
trigger1 = Time > 1 && !NumHelper(7000)
value = 2001
persistent = 0

[State 2000, Explod]
type = Explod
trigger1 = Anim = 2001
trigger1 = AnimElemNo(0) = [6,10]
trigger1 = NumExplod(2000) < 1
trigger1 = time % 3
anim = 7100
ID = 2000
pos = 20 - Random % 40, 5 - Random % 40
postype = p1  ;p2,front,back,left,right
facing = IfElse(Random % 2, -1, 1)
vfacing = IfElse(Random % 2, -1, 1)
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2000, Explod]
type = Explod
trigger1 = Anim = 2001
trigger1 = AnimElemNo(0) = [6,10]
trigger1 = NumExplod(2001) < 1
trigger1 = time % 3
anim = 7101
ID = 2001
pos = 20 - Random % 40, 5 - Random % 40
postype = p1  ;p2,front,back,left,right
facing = IfElse(Random % 2, -1, 1)
vfacing = IfElse(Random % 2, -1, 1)
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2000, HitDef]
type = HitDef
trigger1 = Time % 20 = 0
attr = S, HA
damage = 28,3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,19
sparkno = S7101
sparkxy = -10,-30
hitsound = S7020,5
guardsound = 5,0
ground.type = Low
ground.velocity = 0, 0
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,0
airguard.velocity = 0, 0
air.hittime = 5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.color = 0
palfx.time = 20
palfx.add = 24, 100, 118
palfx.invertall = 1
ignorehitpause = 1
numhits = IfElse(Time > 0, 0, 1)

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 2000, Bomb]
type = Helper
trigger1 = Anim = 2001
trigger1 = AnimElemTime(5) = 10
name = "Tetrahedron"
ID = 2000
stateno = 2001
pos = 0,-15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2000, Bomb]
type = PlaySnd
trigger1 = Anim = 2001
trigger1 = AnimElem = 4
value = S4,0
volumescale = 40
channel = 0

[State 2000, Bomb]
type = Helper
trigger1 = AnimElemTime(5) = 11
trigger1 = Anim = 2001
name = "Tetrahedron"
ID = 2000
stateno = 2001
pos = 0,-15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2000, Bomb]
type = Helper
trigger1 = Anim = 2001
trigger1 = AnimElemTime(5) = 12
name = "Tetrahedron"
ID = 2000
stateno = 2001
pos = 0,-15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2000, End]
type = ChangeState
trigger1 = Anim = 2001
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shock Tetrahedron
[Statedef 2001]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7102
sprpriority = 4

[State 2001, telprot]
type = PosAdd
trigger1 = 1
X = Parent, ScreenPos X - ScreenPos X
Y = Parent, ScreenPos Y - ScreenPos Y - 15
ignorehitpause = 1

[State 1021, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2001, Trans]
type = Trans
trigger1 = Time = [0,32]
trans = addalpha
alpha = 8*Time, 256

[State 2001, Trans]
type = Trans
trigger1 = Time = [33,70]
trans = addalpha
alpha = 256, 256

[State 2001, Trans]
type = Trans
trigger1 = Time = [70,102]
trans = addalpha
alpha = 256 - 8 * (Time - 70), 256


[State 2001, End]
type = DestroySelf
trigger1 = !AnimTime

;---------------------------------------------------------------------------
;Uzzi Punch
[Statedef 2010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 2010
sprpriority = 1
poweradd = 0
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = Anim = 2010
trigger2 = Anim = 2011 && AnimElemNo(0) < 4
time = 1
value = SCA

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 1
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
poweradd = -1000
p2defmul = 1
darken = 0

[State 2010, Snd]
type = PlaySnd
trigger1 = Anim != 2011 && Time % 10 = 0 && Time < 40
value = S0,1
volumescale = 50
channel = 0

[State 2010, End1]
type = ChangeAnim
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
persistent = 0

[State 2010, End2]
type = ChangeState
trigger1 = Anim = 2011 && !AnimTime
value = 0
ctrl = 1

[State 2010, Snd]
type = PlaySnd
trigger1 = Anim = 2011
trigger1 = AnimElemNo(0) = 3
value = S5,0
volumescale = 50
loop = 1
channel = 0
persistent = 0


[State 2010, Pawnch]
type = Helper
trigger1 = Anim = 2011
trigger1 = AnimElemNo(0) = 3
trigger1 = NumHelper(2010) < 3
trigger1 = AnimElemTime(4) < -3
trigger1 = Time % 3 > 0
name = "Uzzi Punch"
ID = 2010
stateno = 2012
pos = 57, -23
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2021, Hit]
type = HitDef
triggerall = Time % 20 = 0
trigger1 = AnimElemNo(0) < 4
trigger2 = Anim != 2011
attr = S, HA 
hitflag = MA-
priority = 4, Hit
sparkno = -1
guard.dist = 0
ground.hittime = 10
pausetime = 0,0
damage = 0,0 
animtype = Hard
p1facing = 1
ground.type = Low
pausetime = 0, 5
ground.velocity = -6
ground.slidetime = 6
fall = 0
air.type = Low
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 4
envshake.freq = 120
envshake.ampl = 3
air.fall = 0
numhits = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 2021, Hit]
type = HitDef
trigger1 = AnimElem = 4
trigger1 = Anim = 2011
attr = S, HA 
hitflag = MA
priority = 4, Hit
sparkno = S7051
sparkxy = -10, -20
guard.dist = 0
damage = 0,0 
animtype = Hard
p1facing = 1
ground.type = High
pausetime = 0, 0
ground.velocity = -3,-5.2
fall = 1
fall.recover = 0
air.type = High
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 4
envshake.freq = 120
envshake.ampl = 12
air.fall = 1

[State 2010, Snd]
type = PlaySnd
trigger1 = AnimElem = 4
trigger1 = Anim = 2011
value = S1,2
volumescale = 50
channel = 0
persistent = 0

[State 2011, Bind]
type = TargetBind
trigger1 = NumTarget
trigger1 = Anim != 2011 || AnimElemNo(0) != 4
trigger1 = AnimElem = 4
trigger1 = Anim = 2011
pos = 60, 0

[State 2011,2]
type = Explod
trigger1 = !NumExplod(2010)
trigger1 = Anim = 2011
trigger1 = AnimElemNo(0) = 3
anim = 7110
ID = 2010
pos = 21 - Random % 4, -25 + Random % 4
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 4,4
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1


;---------------------------------------------------------------------------
;Uzzi Punch (Fist)
[Statedef 2012]
type    = S
movetype= A
physics = N
juggle  = 0
ctrl = 0
anim = 7054
sprpriority = 3

[State 2012, Offset]
type = OffSet
trigger1 = Time % 2
X = (random % 8) - 4
Y = (random % 8) - 4
ignorehitpause = 1

[State 2012, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1002
ignorehitpause = 1

[State 2012, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 2012, PosSet]
type = VelSet
trigger1 = !Time
x = 0

[State 2012, HitDef]
type = HitDef
trigger1 = !Time
trigger1 = Parent, Time % 4 = 0
attr = S, HP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
priority = 4, Hit
sparkno = -1
damage = Floor(12 * IfElse(Parent, Var(22) > 0, 0.5, Parent, FVar(39))),2
sparkxy = -15,0
hitsound = S220,1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0,0
ground.cornerpush.veloff = 0
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = 0,0
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = 0,0
forcestand = 1
getpower = 0, 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10

[State 2012, ChangeState]
type = ChangeState
trigger1 = HitCount > 0
value = 1002
ctrl = 0

[State 2012, End]
type = DestroySelf
trigger1 = Time = 2

;---------------------------------------------------------------------------
;Omega Laser
[Statedef 2020]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= 0
ctrl = 0
anim = 2020
sprpriority = 2
facep2 = 1
velset = 0,0

[State 2020, NHB]
type = NotHitBy
trigger1 = Anim = 2020
trigger2 = Anim = 2020 && AnimElemNo(0) < 2
time = 1
value = SCA

[State 2021, Hit]
type = HitDef
triggerall = Time % 20 = 0
trigger1 = AnimElemNo(0) = 3
trigger2 = Anim = 2021
attr = S, HA 
hitflag = MA-
priority = 4, Hit
sparkno = -1
guard.dist = 0
ground.hittime = 0
pausetime = 0,0
damage = 0,0 
animtype = Hard
p1facing = 1
ground.type = Low
pausetime = 0, 5
ground.velocity = -6
ground.slidetime = 6
fall = 0
hitsound = S2,2
air.type = Low
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 4
envshake.freq = 120
envshake.ampl = 3
air.fall = 0
numhits = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 2020, Super Pause FX]
type = helper
trigger1 = time = 1
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2020, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7,1
p2defmul = 1
darken = 0
poweradd = -1000

[State 2020, End1]
type = ChangeAnim
trigger1 = Time > 1 && !NumHelper(7000)
value = 2021
persistent = 0

[State 2020, Bomb]
type = Helper
trigger1 = Anim = 2021
trigger1 = AnimElem = 3
name = "Omega Laser"
ID = 2020
stateno = 2022
pos = 0,-15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2020, ChangeState]
type = ChangeAnim
trigger1 = Anim = 2021
trigger1 = AnimElemNo(0) = 3
trigger1 = !NumHelper(2020)
value = 2022

[State 2020, Cooldown Sound]
type = PlaySnd
trigger1 = Anim = 2022
value = S8,1
persistent = 0

[State 2020, ChangeState]
type = ChangeState
trigger1 = !AnimTime
trigger1 = Anim = 2022
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;The Omega Laser
[Statedef 2022]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= 0
ctrl = 0
anim = 7120
sprpriority = 0
facep2 = 1
velset = 0,0

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S6,0
channel = 0

[State 2022, Max Hits]
type = varset
trigger1 = !Time
trigger1 = PrevStateNo != 2023
var(0) = 15

[State 2022, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2023
time = 1
ignorehitpause = 1

[State 2022, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2011,2]
type = Explod
trigger1 = NumExplod(2020) < 4
trigger1 = Time % 7 = 0
trigger1 = Time > 20
anim = 7121
ID = 2020
pos = Random % 20 - 10, Random % 20 - 5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 4,4
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 2022, Max Hits]
type = varset
trigger1 = !Time
trigger1 = PrevStateNo != 2023
var(1) = 0

[State 2022, Max Hits]
type = varadd
trigger1 = 1
var(1) = 1

[State 2022, Move]
type = VarSet
trigger1 = !Time
fvar(2) = Pos Y
ignorehitpause = 1

[State 2022, Move]
type = VelSet
trigger1 = var(1) = [0,30]
X = .2 * (30 - var(1))
ignorehitpause = 1

[State 2022, Move]
type = VelAdd
trigger1 = Vel Y = [-4,4]
Y = IfElse(((EnemyNear(0), Pos Y) + EnemyNear(0), Const(size.mid.pos.y)) > Pos Y, .1, -.1)  ;FVar(2) - (30 + (Cos(Pi + Pi * (Time)/20.0) * 30))
ignorehitpause = 1

[State 2022, Move]
type = PosSet;PosSet
trigger1 = Abs(Parent, Pos Y - Pos Y) > 100
Y = IfElse(Pos Y > Parent, Pos Y, Parent, Pos Y + 100, Parent, Pos Y - 100)
ignorehitpause = 1

[State 2022, Move]
type = VarSet
trigger1 = 1
fvar(0) = ScreenPos X - Parent, ScreenPos X + 5 * Facing
ignorehitpause = 1

[State 2022, Move]
type = VarSet
trigger1 = 1
ignorehitpause = 1
fvar(1) = ScreenPos Y - Parent, ScreenPos Y + 20 + Vel Y


[State 2022, Scale]
type = AngleDraw
trigger1 = 1
scale = exp(0.5*ln((fvar(0)*fvar(0) + fvar(1)*fvar(1))))/110, .4
value = IfElse(Facing > 0, -ATan(fvar(1)/fvar(0))*180.0/Pi, ATan(fvar(1)/fvar(0))*180.0/Pi)
ignorehitpause = 1

[State 2022, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2022, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2000, HitDef]
type = HitDef
trigger1 = !Time;Time % 10 = 0
trigger1 = var(0) > 0
trigger1 = var(0) := var(0) - 1
attr = S, HA
damage = Floor(169* IfElse(Parent, Var(22) > 0, 0.5, Parent, FVar(39))),23
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,100
sparkno = S7101
sparkxy = -10, 0
hitsound = S7020,5
guardsound = 5,0
ground.type = Low
ground.velocity = -3, -4
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -2
air.velocity = -3,-5
airguard.velocity = 0, 0
air.hittime = 5
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0,0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.color = 0
palfx.time = 100
palfx.add = 150, 118, 160
palfx.invertall = 1
ignorehitpause = 1

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 2022, DestroySelf]
type = DestroySelf
trigger1 = Parent, StateNo != 2020
trigger2 = Time > 100
trigger3 = !Var(0)
ignorehitpause = 1

;HitOverride
[Statedef 2023]
VelSet = 0,0
MoveType = H

[State 2022, Max Hits]
type = varadd
trigger1 = 1
var(1) = 1

[State 2022, Move]
type = VarSet
trigger1 = !Time
fvar(2) = Pos Y
ignorehitpause = 1

[State 2022, Move]
type = VelSet
trigger1 = var(1) = [0,30]
X = .2 * (30 - var(1))
ignorehitpause = 1

[State 2022, Move]
type = VelAdd
trigger1 = Vel Y = [-4,4]
Y = IfElse(((EnemyNear(0), Pos Y) + EnemyNear(0), Const(size.mid.pos.y)) > Pos Y, .1, -.1)  ;FVar(2) - (30 + (Cos(Pi + Pi * (Time)/20.0) * 30))
ignorehitpause = 1

[State 2022, Move]
type = PosSet;PosSet
trigger1 = Abs(Parent, Pos Y - Pos Y) > 100
Y = IfElse(Pos Y > Parent, Pos Y, Parent, Pos Y + 100, Parent, Pos Y - 100)
ignorehitpause = 1

[State 2022, Move]
type = VarSet
trigger1 = 1
fvar(0) = ScreenPos X - Parent, ScreenPos X + 5 * Facing
ignorehitpause = 1

[State 2022, Move]
type = VarSet
trigger1 = 1
ignorehitpause = 1
fvar(1) = ScreenPos Y - Parent, ScreenPos Y + 20 + Vel Y

[State 2022, Scale]
type = AngleDraw
trigger1 = 1
scale = exp(0.5*ln((fvar(0)*fvar(0) + fvar(1)*fvar(1))))/110, .4
value = IfElse(Facing > 0, -ATan(fvar(1)/fvar(0))*180.0/Pi, ATan(fvar(1)/fvar(0))*180.0/Pi)
ignorehitpause = 1

[State 2022, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2022, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 499, NotHitBy]
type = NotHitBy 
trigger1 = !time
value = SCA, AA, AP
time = 30

[State 499, HitOver]
type = NotHitBy
trigger1= 1
time = 1
value= , AT
ignorehitpause=1

[State 499, HitOver]
type = HitOverride
trigger1= 1
time = -1
attr = SCA, AA, AP
stateno = 2023

[State 499, LifeAdd]
type = VarAdd
trigger1 = Time = 0
var(0) = -1

[State 499, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.5)
value = 2022

[State 2022, DestroySelf]
type = DestroySelf
trigger1 = !Var(0)
ignorehitpause = 1

; Electrocute
[Statedef 2100]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= 72
ctrl = 0
anim = 2020
sprpriority = 1
facep2 = 1
velset = 0,0

[State 2020, NHB]
type = NotHitBy
trigger1 = Anim = 2020
trigger2 = Anim = 2020 && AnimElemNo(0) < 2
time = 1
value = SCA

[State 2020, Super Pause FX]
type = Explod
trigger1 = time = 1
ID = 7200
supermovetime = 9999
anim = 7100
pos = 0,-10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 2020, Super Pause FX]
type = helper
trigger1 = time = 1
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 22
value = 1

[State 2020, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7,1
p2defmul = 1
darken = 0

[State 2020, Super Pause FX]
type = helper
trigger1 = time > 1 && Var(22) > 0 
stateno = 7100
ID = 2100
name = "Electrocute Spark"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && NumHelper(2100) && Var(22) > 0
value = 0
ctrl = 1

;Prometheus Cannon
[Statedef 2200]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 2020
sprpriority = 1
poweradd = 0
facep2 = 1
velset = 0,0

[State 2200, NHB]
type = NotHitBy
trigger1 = Anim = 2200
time = 1
value = SCA
ignorehitpause = 1

[State 2200, Super Pause FX]
type = helper
trigger1 = time = 1
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2200, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S1,1;S a7,2
p2defmul = 1
poweradd = -3000
darken = 0

[State 2000, End]
type = ChangeAnim
trigger1 = Time > 1 && !NumHelper(7000)
value = 2200
persistent = 0

[State 2020, Super Pause FX]
type = Helper
trigger1 = Anim = 2200 && AnimElem = 2
stateno = 2201 
ID = 2201
name = "Prometheus Cannon"
postype = p1
pos = 0,-40
ownpal = 1
persistent = 0
;supermovetime = 9999

[State 2202, Shake]
type = EnvShake
trigger1 = Anim = 2200 && AnimElem = 3
time = 80
freq = 120
ampl = 2
persistent = 0

[State 2202, go back]
type = VelSet
trigger1 = NumHelper(2201) && NumHelper(2202)
X = -0.3


[State 2202, Stop]
type = VelSet
trigger1 = NumHelper(2201) && !NumHelper(2202)
X = 0

[State 2200, End]
type = ChangeState
trigger1 = Anim = 2200 && AnimElemNo(0) = 3 && !NumHelper(2201)
value = IfElse(Pos Y < 0, 2204, 0)
ctrl = 1

; The Cannon
[Statedef 2201]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 7300
sprpriority = -1
poweradd = 0
velset = 0, 10/16.0

[State 2201, Trans]
type = trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 16 * Time
ignorehitpause = 1

[State 2201, Vel]
type = VelSet
trigger1 = Parent, ScreenPos Y - ScreenPos Y < 30
Y = 0
ignorehitpause = 1

[State 2201, Vel]
type = PosSet
trigger1 = Time > 16
X = Parent, Pos X
Y = Parent, Pos Y - 30
ignorehitpause = 1

[State 2201, Fire]
type = ChangeAnim
trigger1 = Parent, StateNo = 2200
trigger1 = Parent, Anim = 2200
trigger1 = Parent, AnimElemTime(3) = 0
value = 7301

[State 2201, Fire]
type = Helper
trigger1 = Anim = 7301
stateno = 2202
ID = 2202
name = "Prometheus Beam Base"
postype = p1
pos = 30,0
ownpal = 1
persistent = 0
;supermovetime = 9999

[State 2201, Trans]
type = trans
trigger1 = AnimElemNo(0) = 4
trans = addalpha
alpha = 256 - 16 * AnimElemTime(4), 16 * AnimElemTime(4)
ignorehitpause = 1

[State 2201, End]
type = DestroySelf
trigger1 =  (Anim = 7301 && !AnimTime) || Parent, StateNo != 2200
ignorehitpause = 1

;Prometheus Beam
[Statedef 2202]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7302
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S6,0
channel = 0

[State 3055, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
trigger2 = animelem = 13 || animelem = 15 || animelem = 17 || animelem = 19
attr = S, HP
damage = 30, 7
animtype = Hard
hitsound = S2,2
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -.5
down.velocity = -20, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 20
attr = S, HP 
damage = 24, 7
animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
priority = 4, Hit 
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -9
down.velocity = -20, -9
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X + 30 * Facing
Y = Parent, Pos Y
ignorehitpause = 1

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2202, Beam Head]
type = helper
trigger1 = AnimElem = 4
stateno = 2203
ID = 2203
name = "Prometheus Beam Head"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 =  !AnimTime || !PlayerIDExist(var(0)) || Parent, StateNo != 2201

;Beam Head
[Statedef 2203]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7304
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, Beam Velocity]
trigger1 = !Time
type = varset
var(1) = 16

[State 2203, Beam Velocity]
trigger1 = Time > 60
type = varset
var(1) = 0

[State 2203, Explod]
type = Explod
trigger1 = !Time
anim = 7303
ID = 2203
pos = 0,0
postype = p1;p2,front,back,left,right
facing = 1
bindtime = 0
vfacing = 1
vel = 0,0;Facing * Var(1)/2,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
trans = add
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 2203, Vel]
type = VelSet
trigger1 = 1
ignorehitpause = 1
X = IfElse(AnimElemTime(1) <= 20, Var(1), 0)

[State 2203, ExplodScale]
type = ModifyExplod
trigger1 = 1
ID = 2203
postype = p1
scale = 0.1 + Abs(ParentDist X - Vel X)/16.0, 1 
pos = Floor((ParentDist X - Vel X)/2.0) , 0
bindtime = 1
ignorehitpause = 1


[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, RemoveExplod]
type = RemoveExplod
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 2202 || !AnimTime
ID = 2203

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 2202 || !AnimTime

;Falling
[Statedef 2204]
type = A
movetype = I
physics = N
anim = 1006
ctrl = 0

[State 2204, Gravity]
type = VelAdd
trigger1 = 1
Y = 0.45

[State 2204, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 2205
ctrl =0

;Landing
[Statedef 2205]
type = S
movetype = I
physics = N
anim = 47
ctrl = 0
velset = 0,0

[State 2204, Pos]
type = PosSet
trigger1 = 1
Y = 0

[State 1007, End]
trigger1 = Time > 22
type = ChangeState
value = 0
ctrl = 1

