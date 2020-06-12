;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Gato!
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
poweradd = -1000
sprpriority = 2

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 2
removetime = -1
ID = 2000
anim = 7055
pos = 10, -25
ownpal = 1
sprpriority = 3
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 2000, Explosion]
type = Helper
trigger1 = AnimElemTime(2) = 20
name = "Gato"
ID = 2000
stateno = 2001
pos = 17, -85
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7030,0
p2defmul = 1
darken = 0

[State 2000, End]
type = RemoveExplod
trigger1 = Time > 1 && !NumHelper(7000)
ID = 2000
ignorehitpause = 1

[State 2000, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 0
ctrl = 1

; Gato
[Statedef 2001]
type    = A
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7053
sprpriority = 2

[State 2001, Snd]
type = PlaySnd
trigger1 =  !Time
value = S7050,6
channel = 0

[State 2001, Trans]
type = Trans
trigger1 = Time = [0, 16]
trans = AddAlpha
alpha = 16 * Time, 256 - 16 * Time
ignorehitpause = 1

[State 2002, Fall]
type = VelSet
trigger1 = 1
Y = 3.1

[State 2002, Fall]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 2002, Land]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y > - Vel Y
value = 2002

;Gato - Walking and Punching
[Statedef 2002]
type    = S
movetype= A
physics = N
ctrl = 0
velset = 0,0
sprpriority = 2
facep2 = 1


[State 2001, Snd]
type = PlaySnd
trigger1 =  !Time
trigger1 = PrevStateNo = 2001
value = S7050,7
channel = 0

[State 2013, RealTime]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 2003
value = 7050
ignorehitpause = 1

[State 2013, RealTime]
type = ChangeAnim
trigger1 = !Time && PrevStateNo = 2003
value = Var(1)
elem = Var(2)
ignorehitpause = 1

[State 2004, NHB]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 2003
ignorehitpause = 1

[State 2004, NHB]
type = NotHitBy
trigger1 = 1
value = , AT
ignorehitpause = 1

[State 2013, RealTime]
trigger1 = !Time && PrevStateNo != 2003
type = VarSet
v = 0
value = -120
persistent = 0
ignorehitpause = 1

[State 2003, Shake]
type = EnvShake
trigger1 = !Time && PrevStateNo != 2003
freq = 120
time = 12
ampl = 8

[State 2003, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 7050 && !AnimTime
value = 7052
persistent = 0

[State 2003, Walk]
type = PosSet
trigger1 = !Var(0)
Y = 0

[State 2003, Walk]
type = VelAdd
trigger1 = Anim = 7052 && Var(0) < 0
trigger1 = Vel X < 2.5
X = 0.2

[State 2003, Walk]
type = Offset
trigger1 = Anim = 7052 && Var(0) < 0
Y = 2 + 2 * Sin(2*Time)

[State 2013, Pawnch]
type = VelSet
trigger1 = Var(0) >= 0
X = 0 

[State 2013, Pawnch]
type = VarSet
trigger1 = 1
var(1) = Floor(EnemyNear, ScreenPos X - ScreenPos X)

[State 2013, Turn]
type = Turn
triggerall = var(0) < 0
trigger1 = var(1) * Facing < 0

[State 2013, Var]
type = ParentVarSet
trigger1 = MoveHit
trigger1 = Parent, FVar(39) > 0.86
FV = 39
value = Parent, FVar(39) * 0.86
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = AnimElemTime(3) = 2
trigger1 = Var(0) <= 80
attr = S, HA
damage = Floor(11 * Root, FVar(39)),1
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,19
sparkno = S7001
sparkxy = Floor(10 - 20 * Random/1000.0), Floor(-20 - 10 *Random/1000.0)
hitsound = S7020,9
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
snap = 40, 0
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 6, 42
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.color = 0
palfx.add = 144, 64, 7
palfx.mul = 256, 256, 256
palfx.time = 20
ignorehitpause = 1
numhits = 1

[State 2002, ChangeState]
type = VarSet
trigger1 = RoundState = 2
trigger1 = Win
V = 0
value = 10
ignorehitpause = 1

[State 2002, ChangeState]
type = ChangeState
trigger1 = RoundState = 3
trigger1 = Win
value = 2004
ignorehitpause = 1

[State 2013, Var]
type = VarAdd
trigger1 = 1
v = 0
value = 1
ignorehitpause = 1

[State 2013, Var]
type = VarSet
trigger1 = MoveContact && Var(0) < 0
v = 0
value = 0
ignorehitpause = 1

[State 1022, Explod]
type = Explod
trigger1 = NumExplod(1020) < 6
trigger1 = Var(0) % 4
trigger1 = Var(0) > 60
anim = 7002
ID = 1020
pos = 25 - (Random % 50), - (Random % 60)
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0, -1.2
accel = 0,0
removetime = -2
scale = 1 , 1
sprpriority = 4
ontop = 0
shadow = -1
ownpal = 0
removeongethit = 0

[State 2013, EndTrans]
type = Trans
trigger1 = Var(0) >= 80
trans = AddAlpha
alpha = 256 - 16 * (Var(0) - 80), 16 * (Var(0) - 80)
ignorehitpause = 1

[State 1022, Anim]
type = PlaySnd
trigger1 = Var(0) = 60
value = S7020,7
persistent = 0
ignorehitpause = 1

[State 2002, End]
type = DestroySelf
trigger1 = var(0) >= 96
ignorehitpause = 1

;Gato Gethit
[Statedef 2003]
type    = S
movetype= H
physics = S
ctrl = 0
sprpriority = 2

[State 2004, Var]
type = PosAdd
trigger1 = !Time
X = -2
ignorehitpause = 1

[State 2004, Var]
type = VarAdd
trigger1 = !Time
V = 0
value = 10
ignorehitpause = 1

[State 2004, Var]
type = VarAdd
trigger1 = 1
V = 0
value = 1
ignorehitpause = 1

[State 2004, Anim]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 2003
V = 1
value = Anim
ignorehitpause = 1

[State 2004, Anim]
type = VelSet
trigger1 = 1
X = 0
Y = 0
ignorehitpause = 1

[State 2004, Anim]
type = PosSet
trigger1 = 1
Y = 0
ignorehitpause = 1

[State 2004, Anim]
type = PosFreeze
trigger1 = 1
ignorehitpause = 1

[State 2004, Anim]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 2003
V = 2
value = AnimElemNo(0)
ignorehitpause = 1

[State 2004, Anim]
type = ChangeAnim
trigger1 = !Time
value = 7053
ignorehitpause = 1

[State 2004, NHB]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 2003
ignorehitpause = 1

[State 2004, NHB]
type = NotHitBy
trigger1 = 1
value = , AT
ignorehitpause = 1

[State 2013, EndTrans]
type = Trans
trigger1 = Var(0) >= 80
trans = AddAlpha
alpha = 256 - 16 * (Var(0) - 80), 16 * (Var(0) - 80)
ignorehitpause = 1

[State 2002, End]
type = DestroySelf
trigger1 = var(0) >= 96
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2002
ignorehitpause = 1

; Gato Win
[Statedef 2004]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7050
sprpriority = 2

[State 2004, Anim]
type = ChangeAnim
trigger1 = Parent, StateNo = 181
value = 7054
persistent = 0

[State 2004, Anim]
type = PlaySnd
trigger1 = Anim = 7054
trigger1 = AnimElem = 2
value = 7050,5
channel = 0
loop = 1
persistent = 0

;---------------------------------------------------------------------------
;Flare 
[Statedef 2010]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2011, Explosion]
type = Helper
trigger1 = !Time
name = "Flare"
ID = 2010
stateno = 2012
pos = 0, -35
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime =0; 9999

[State 2011, Explosion]
type = Helper
trigger1 = !Time
name = "Flare"
ID = 2011
stateno = 2012
pos = 0, -35
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime =9999

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7050,3
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Flare Summoning
[Statedef 2011]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2011, End]
type = ChangeState
triggerall = Time > 80
trigger1 = Command != "holdfwd"
trigger1 = Command != "holdback"
trigger1 = Command != "holdup"
trigger1 = Command != "holddown"
trigger2 = !NumHelper(2010)
value = 0
ctrl = 1

;The Flare (pre-explosion)
[Statedef 2012]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7200
sprpriority = 3
velset = 0,0

[State 2012, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = -50,50
     
[State 2012, VarRandom]
type = VarRandom
trigger1 = 1
v = 1
range = -50,50

[State 2012, Helper]
type = Helper
trigger1 = IsHelper(2011)
trigger1 = ((GameTime%5) = 0)
helpertype = Normal
name = "PerseEffect"
id = 2014
pos = var(0),var(1)
postype = p1
facing = 1
stateno = 2014
keyctrl = 0
ownpal = 1
supermovetime = 999999
pausemovetime = 999999
ignorehitpause = 1

[State 2012, Boom]
type = ChangeState
triggerall = IsHelper(2010)
trigger1 = Parent, StateNo = 2011
trigger1 = Parent, AnimElem = 3
value = 2013
ignorehitpause = 1

[State 2012, End]
type = DestroySelf
triggerall = IsHelper(2011)
trigger1 = Parent, StateNo = 2011
trigger1 = Parent, AnimElem = 3
ignorehitpause = 1

[State 2012, Fail]
type = DestroySelf
trigger1 = Parent, StateNo != 2010
trigger1 = Parent, StateNo != 2011
ignorehitpause = 1

;The Flare
[Statedef 2013]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
anim = 7060
sprpriority = 3
velset = 1.2,0

[State 2013, PosAdd]
type = PlaySnd
trigger1 = !Time && PrevStateNo != 2013
value = S7050,4
ignorehitpause = 1

[State 2013, PosAdd]
type = Turn
trigger1 = !Time && PrevStateNo != 2013
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 2013, PosAdd]
type = PosAdd
trigger1 = Parent, Command = "holdup"
trigger1 = Parent, Command != "holddown"
Y = -1.4
ignorehitpause = 1

[State 2013, PosAdd]
type = PosAdd
trigger1 = Parent, Command != "holdup"
trigger1 = Parent, Command = "holddown"
Y = 1.4
ignorehitpause = 1

[State 2013, RealTime]
trigger1 = !Time && PrevStateNo = 2012
type = VarSet
v = 0
value = -1
persistent = 0
ignorehitpause = 1

[State 2013, Var]
trigger1 = 1
type = VarAdd
v = 0
value = 1
ignorehitpause = 1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
slot = 0
stateno = 2013
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, Trans]
type = VarSet
trigger1 = 1
FV = 0
value = Sin(Pi * Var(0) / 20.0)
ignorehitpause = 1

[State 2013, Trans]
type = AngleDraw
trigger1 = (Var(0) % 4) = 0
trigger2 = (Var(0) % 4) = 1
scale = IfElse(FVar(0) > 0, Var(0)/50.0 + 1 * FVar(0), 0.5 + Var(0)/200.0), IfElse(FVar(0) < 0, Var(0)/50.0 + 1 * -FVar(0), 0.5 + Var(0)/200.0)
ignorehitpause = 1

[State 2013, Scale]
type = AngleDraw
triggerall = Var(0) > 40
trigger1 = (Var(0) % 4) = 2
trigger2 = (Var(0) % 4) = 3
scale = (Var(0) - 40) / 33.0, (Var(0) - 40) / 33.0
ignorehitpause = 1

[State 2013, Trans]
type = AssertSpecial
triggerall = Var(0) <= 40
trigger1 = (Var(0) % 4) = 2
trigger2 = (Var(0) % 4) = 3
flag = invisible
ignorehitpause = 1

[State 2013, Trans]
type = Trans
trigger1 = Var(0) = [0, 16]
trans = addalpha
alpha = 16 * Var(0), 256 - 8 * Var(0)
ignorehitpause = 1

[State 2013, Trans]
type = Trans
trigger1 = Var(0) = [17, 70]
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2013, Var]
type = ParentVarSet
trigger1 = MoveHit
trigger1 = Parent, FVar(39) > 0.86
FV = 39
value = Parent, FVar(39) * 0.86
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = Var(0) % 20 = 2
trigger1 = Var(0) < 100
attr = S, HP
damage = Floor(Parent, FVar(39) * 52),3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,19
sparkno = -1
hitsound = -1
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
palfx.add = 144, 64, 7
palfx.mul = 256, 256, 256
palfx.time = 20
ignorehitpause = 1
numhits = IfElse(Var(0) > 0, 0, 1)

[State 2013,2]
type = Explod
trigger1 = NumExplod(2010) < 9
trigger1 = Var(0) % 2 = 0
trigger1 = Var(0) <= 70
anim = 7003
ID = 2010
pos = Random % 50 - 25, Random % 50 - 25
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 4,4
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

;End
[State 2013, Trans]
type = Trans
trigger1 = Var(0) = [70, 86]
trans = addalpha
alpha = 256 - 16 * (Var(0) - 70), 128 + 8 * (Var(0) - 70)

[State 2013, End]
type = DestroySelf
trigger1 = Var(0) >= 86

;Flare Particle
[Statedef 2014]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 7061
sprpriority = 3
velset = 0,0

[State 2014, End]
type = DestroySelf
trigger1 = !(Parent, StateNo)
trigger2 = Parent, StateNo != 2012

[state 2014, dist x]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 2014, dist x]
type = VarSet
trigger1 = 1
FV = 0
value = ParentDist X

[state 2014, dist x]
type = VarSet
trigger1 = 1
FV = 1
value = ParentDist Y

[state 2014, dist x]
type = VarSet
trigger1 = 1
FV = 2
value = Exp(0.5 * ln(FVar(0)*FVar(0) + FVar(1) * FVar(1)))

[State 2014, vel]
type = Velset
trigger1 = 1
x = Fvar(0)/Fvar(2) * 3.23
y = FVar(1)/Fvar(2) * 3.23

[State 2014, PosAdd]
type = AngleDraw
trigger1 = 1
scale = FVar(2)/60.0, FVar(2)/60.0

[State 2014, DestroySelf]
type = DestroySelf
trigger1 = FVar(2) < 3  || (Time > 10)


;---------------------------------------------------------------------------
;Gate Trap
[Statedef 2020]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= -1000
ctrl = 0
anim = 2000
sprpriority = 1
facep2 = 1
velset = 0,0

[State 2000, Explosion]
type = Helper
trigger1 = AnimElem = 2
name = "Gate"
ID = 2020
stateno = 2021
pos = 25, -Floor(Pos Y)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 2
removetime = -1
ID = 2020
anim = 7100
pos = 5, -25
ownpal = 1
sprpriority = 3
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2000, End]
type = RemoveExplod
trigger1 = Time > 1 && !NumHelper(7000)
ID = 2020
ignorehitpause = 1

[State 2000, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 0
ctrl = 1

; The Gate Trap
[Statedef 2021]
type = S
movetype = A
physics = N
anim = 7071
velset = 0, 0
sprpriority = -2

[State 2021, Anim]
type = ChangeAnim 
trigger1 = Anim = 7071
trigger1 = !AnimTime
value = 7072

[State 2021, Snd]
type = PlaySnd
trigger1 = !Time
value = S7030,1
channel = 0

[State 2021, Hit]
type = HitDef
trigger1 = Time = 60
attr = S, HT 
hitflag = MA-
priority = 4, Miss
sparkno = -1
p1stateno = 2023
p2stateno = 2025
hitonce = 0
guard.dist = 0
damage = 0,0
animtype = Hard
p1facing = 1
pausetime = 0, 0
ground.velocity = 0,0
ground.cornerpush.veloff = 0
fall = 1
fall.recovertime = 120
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
fall.recover = 0
p1sprpriority = 1
p2sprpriority = 1
persistent = 0

[State 2101, noshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2101, noshadow]
type = AngleDraw
trigger1 = 1
scale = 1, 0.3
ignorehitpause = 1

[State 2021, End]
type = ChangeState
trigger1 = Anim = 7072
trigger1 = !NumTarget
trigger1 = Time > 120
value = 2022

; Gate End
[Statedef 2022]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7102
sprpriority = 0

[State 2021, Snd]
type = PlaySnd
trigger1 = !Time
value = S7030,1
channel = 0

[State 2101, noshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2101, noshadow]
type = AngleDraw
trigger1 = 1
scale = 1, 0.3
ignorehitpause = 1

[State 2022, End]
type = TargetDrop
trigger1 = !AnimTime
trigger1 = NumTarget

[State 2022, End]
type = DestroySelf
trigger1 = !AnimTime

; Gate Successful Hit
[Statedef 2023]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 7073
sprpriority = 0

[State 2023, Anim]
type = VarSet
trigger1 = !Time
trigger1 = !NumTarget
FV = 0
value = (Target, Pos X - Pos X) * Facing
persistent = 0

[State 2023, Anim]
type = TargetBind
trigger1 = Time = [0,32]
pos = -(FVar(0)/32.0), 0
ignorehitpause = 1

[State 2023, Anim]
type = TargetBind
trigger1 = Time >= 32
pos = 0, 0
ignorehitpause = 1

[State 2023, Anim]
type = ChangeAnim
trigger1 = Anim = 7073
trigger1 = Time = 32
value = 7102

[State 2021, Snd]
type = PlaySnd
trigger1 = Anim = 7102
value = S7030,1
channel = 0
persistent = 0

[State 2023, Anim]
type = ChangeAnim
trigger1 = Anim = 7102
trigger1 = !AnimTime
value = 7200

[State 2101, noshadow]
type = AssertSpecial
trigger1 = Anim = 7200
flag = invisible
ignorehitpause = 1

[State 2101, noshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2101, noshadow]
type = AngleDraw
trigger1 = 1
scale = 1, 0.3
ignorehitpause = 1

[State 2022, End]
type = PosAdd
trigger1 = Anim = 7200
Y = - 100
persistent = 0

[State 2022, End]
type = PlaySnd
triggerall = Anim = 7200
trigger1 = AnimElemTime(1) = 20
trigger2 = AnimElemTime(1) = 40
value = s7020,3


[State 2022, End]
type = PlaySnd
triggerall = Anim = 7200
trigger1 = AnimElemTime(1) = 80
value = s7050,8

[State 2022, End]
type = EnvShake
triggerall = Anim = 7200
trigger1 = AnimElemTime(1) = 20
trigger2 = AnimElemTime(1) = 40
trigger3 = AnimElemTime(1) = 80
ampl = 12
freq = 120
time = 10

[State 2022, End]
type = TargetLifeAdd
triggerall = Anim = 7200
trigger1 = AnimElemTime(1) = 20
trigger2 = AnimElemTime(1) = 40
trigger3 = AnimElemTime(1) = 80
value = -37

[State 2022, End]
type = ChangeState
trigger1 = Anim = 7200
trigger1 = AnimElemTime(1) = 100
value = 2024

; Gate End 
[Statedef 2024]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 7071
sprpriority = -2

[State 2021, Snd]
type = PlaySnd
trigger1 = !Time
value = S7030,1
channel = 0
persistent = 0

[State 2021, Snd]
type = PlaySnd
trigger1 = Anim = 7102
value = S7030,1
channel = 0
persistent = 0

[State 2101, noshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2101, noshadow]
type = AngleDraw
trigger1 = 1
scale = 1, 0.3
ignorehitpause = 1


[State 2024, Let Go]
type = TargetBind
trigger1 = NumTarget
pos = 0,0

[State 2024, Anim]
type = ChangeAnim
trigger1 = Anim = 7071
trigger1 = !AnimTime
value = 7073

[State 2024, Let Go]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 7073
trigger1 = AnimElemTime(1) = 30
value = 2026
persistent = 0

[State 2024, Let Go]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Anim = 7073
trigger1 = AnimElemTime(1) = 30
persistent = 0

[State 2024, Close]
type = ChangeAnim
trigger1 = Anim = 7073
trigger1 = !AnimTime
value = 7102
persistent = 0

[State 2024, End]
type = DestroySelf
trigger1 = Anim = 7102
trigger1 = !AnimTime

;---------------------------------------------------------------------------
; Gate Trap - Dragged
[Statedef 2025]
type = S
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2023
ignorehitpause = 1

[State 802, Exit]
type = Trans 
trigger1 = Time = [0, 32]
trans = addalpha
alpha = 256 - 8 * Time, 8* Time

[State 802, Exit]
type = Trans 
trigger1 = Time > 32
trans = addalpha
alpha = 0, 256

[State 802, Exit]
type = AngleDraw
trigger1 = Time = [0, 32]
scale = 1 - Time/32.0, 1 - Time/32.0

;Gate Trap - Dropped
[Statedef 2026]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0
velset = 0,0

[State 2026, Bound]
type = ScreenBound
trigger1 = 1
value = 0

[State 803, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 803, Vel]
type = ChangeAnim2
trigger1 = !Time
value = 804

[State 803, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 8
freq = 120
ampl = 4

[State 803, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0


;Gate Key Summon
[Statedef 2100]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
poweradd = -3000
sprpriority = 2

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 2
removetime = -1
ID = 2100
anim = 7100
pos = 5, -25
ownpal = 1
sprpriority = 3
shadow = -1
removeongethit = 1
removetime = 
supermovetime = 99999
ignorehitpause = 1

[State 2000, Explosion]
type = Helper
trigger1 = AnimElem = 2
name = "Gate"
ID = 2100
stateno = 2101
pos = Facing * Floor(EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), Pos X - Pos X), Floor(EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), Pos Y + EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), Const(size.head.pos.y) - 70)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7030,0
p2defmul = 1
darken = 0

[State 2000, End]
type = RemoveExplod
trigger1 = Time > 1 && !NumHelper(7000)
ID = 2100
ignorehitpause = 1

[State 2100, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 0
ctrl = 1

; Gate
[Statedef 2101]
type    = A
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7101
sprpriority = -1

[State 2101, Scale]
type = AngleDraw
trigger1 = 1
scale = 2, 1

[State 192, Snd]
type = PlaySnd
trigger1 = !Time
value = S7030,1
persistent = 0

[State 2000, Explosion]
type = Helper
trigger1 = AnimElem = 25
name = "Tyranno"
ID = 2102
stateno = 2102
postype = p1    ;p2,front,back,left,right
pos = 0, 0
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2101, End]
type = ChangeAnim
trigger1 = Anim = 7101
trigger1 = !NumHelper(2102)
trigger1 = AnimElem = 26
value = 7102

[State 192, Snd]
type = PlaySnd
trigger1 = Anim = 7102
value = S7030,1
persistent = 0

[State 2101, noshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2101, End]
type = DestroySelf
trigger1 = Anim = 7102
trigger1 = !AnimTime


; Tyranno
[Statedef 2102]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
anim = 7104
sprpriority = 0
velset = 0, 2.7

[State 2101, Trans]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 16 * Time
ignorehitpause = 1

[State 2101, End]
type = VelSet
trigger1 = Anim = 7104
trigger1 = Time > 13
Y = 0

[State 2013, Var]
type = ParentVarSet
trigger1 = MoveHit
trigger1 = Parent, FVar(39) > 0.86
FV = 39
value = Parent, FVar(39) * 0.86
ignorehitpause = 1

[State 2101, Bite Down]
type = HitDef
trigger1 = NumHelper(2103)
trigger1 = Helper(2103), AnimElem = 2
attr = S,HA
damage = Floor(Root, FVar(39) * 256)
animtype = Hard
hitflag = MAF
hitsound = -1;
guardflag = HA
pausetime = 14,14
sparkno = -1
ground.type = High
ground.slidetime = 0
ground.hittime = 7
ground.velocity = 0
air.velocity = 0,0
air.fall = 1
fall = 1
palfx.add = 200,200,200
palfx.mul = 256,256,256
palfx.time = 12

[State 2000, Explosion]
type = Helper
trigger1 = !Time
name = "Tyranno Head"
ID = 2103
stateno = 2103
postype = p1    ;p2,front,back,left,right
pos = 0, 0
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2101, End]
type = ChangeAnim
triggerall = Anim = 7104
trigger1 = NumHelper(2103)
trigger1 = Helper(2103), AnimElemTime(3) >= 20
trigger2 = MoveReversed
value = 7105

[State 2101, Trans]
type = Trans
trigger1 = Anim = 7105
trigger1 = AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 256 - 16 *  AnimElemTime(1), 16 *  AnimElemTime(1)

[State 2101, up]
type = VelSet
trigger1 = Anim = 7105
Y = -2.7

[State 2101, End]
type = DestroySelf
trigger1 = Anim = 7105
trigger1 = AnimElemTime(1) > 16

;Tyranno Head
[Statedef 2103]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7103
sprpriority = 3

[State 192, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7020,5
persistent = 0


[State 2101, Trans]
type = EnvShake
trigger1 = AnimElem = 2
ampl = 6
freq = 120
time = 12

[State 2101, Trans]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 16 * Time

[State 2101, End]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y

[State 2101, Trans]
type = Trans
trigger1 = Parent, Anim = 7105
trigger1 = Parent, AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 256 - 16 * Parent, AnimElemTime(1), 16 *  Parent, AnimElemTime(1)

[State 2101, End]
type = DestroySelf
trigger1 = Parent, Anim = 7105
trigger1 = Parent, AnimElemTime(1) > 16
trigger2 = !(Parent, StateNo)
trigger3 = !(NumHelper(2102))

;Protect Activation
[Statedef 2110]
type = S
movetype = I
physics = S
anim = 2110
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2110, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 60
movetime = 60
anim = -1
pos = 0, -20
sound = -1
p2defmul = 1
darken = 0

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 9
removetime = -2
anim = 7110
pos = 0, -20
ownpal = 1
sprpriority = 3
removeongethit = 1
supermovetime = 99999


[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 21
value = 1

[State 2110, Sound1]
type = PlaySnd
trigger1 = !Time
value = S7060,0
channel = 0

[State 2110, Sound1]
type = PlaySnd
trigger1 = Time = 28
value = S7060,1
channel = 0

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && Var(21) > 0
value = 0
ctrl = 1