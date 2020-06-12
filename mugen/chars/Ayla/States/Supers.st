;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Tail Spin
[Statedef 2000]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= -1000
ctrl = 0
anim = 2010
sprpriority = 2
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = Anim = 2010
time = 1
value = SCA

[State 2010, PalFx]
type = PalFX
trigger1 = Anim = 2010
trigger1 = (Time % 8 = 0)
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2010, Offset]
type = OffSet
trigger1 = Anim = 2010
trigger1 = Time % 2 = 0
X = (random % 8) - 4
Y = (random % 8) - 4

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

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeAnim
trigger1 = Time > 1 && !NumHelper(7000)
value = 2000
persistent = 0

[State 2000, VelSet]
type = VelSet
trigger1 = Anim = 2000
X = 3
persistent = 0

[State 2000, VelSet]
type = PosSet
trigger1 = Anim = 2000
y = -5 + floor(5 * Cos((Time - 40)/(2 * Pi)))

[State 2000, Vel]
type = VelSet
trigger1 = command != "holdfwd" && command != "holdback"
trigger1 = Anim = 2000 
x = -0.5 * Cos((Time - 40)/(2 * Pi))

[State 2000, Vel]
type = VelSet
trigger1 = command = "holdback"
trigger1 = Anim = 2000
x = -1.3

[State 2000, Vel]
type = VelSet
trigger1 = command = "holdfwd" 
trigger1 = Anim = 2000
x = 1.3

[State 2000, Snd]
type = PlaySnd
trigger1 = Anim = 2000
value = 7050,1
channel = 0
persistent = 0

[State 2000, Twister]
type = Helper
trigger1 = Anim = 2000 && AnimElem = 2
name = "Twister"
ID = 2001
stateno = 2001 
pos = -10,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
persistent = 0

[State 2000, Twister]
type = Helper
trigger1 = Anim = 2000 && AnimElem = 2
name = "Twister"
ID = 2002
stateno = 2002
pos = -10,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
persistent = 0

[State 2000, ChangeState]
type = ChangeState
trigger1 = Time = 250
value = IfElse(Pos Y < 0, 50,0)
ctrl = 1

; The twister itself
[Statedef 2001]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
anim = 7050
sprpriority = 2

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 2001, trans]
type = Trans
trigger1 = Time < 16
trans = addalpha
alpha = 16*Time, 256 - 8 * Time

[State 2001, Zoom]
type = trans
trigger1 = Time >= 16
trans = addalpha
alpha = 256, 128

[State 2001, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 2001, VelSet]
type = PosSet
trigger1 = 1
x = parent, pos x + 40 * sin(pi * (-time/30.0)) - 5
y = 0

[State 2001, SprPriority]
type = SprPriority
trigger1 = cos(pi * (time/30.0)) > 0
value = 3

[State 2001, SprPriority]
type = SprPriority
trigger1 = cos(pi * (time/30.0)) < 0
value = 0

[State 2001, Zoom]
type = AngleDraw
trigger1 = 1
scale = 1 + 0.4 * sin(pi * (-time/30.0) + pi/2), 1 + 0.4 * sin(pi * (-time/30.0) + pi/2)

[State 2001, 2]
type = HitDef
trigger1 = Time % 20 = 10
attr = S, HP
damage    = Floor(13* IfElse(Parent, Var(21) > 0, 0.52, Parent, FVar(39)))
animtype  = Hard
hitflag = MAF
guardflag = M
pausetime = 0,5
sparkno = -1
sparkxy = -15,-4
priority = 5, Hit
hitsound   = S7000,1
guardsound = 6,0
p2facing = IfElse(Pos X > Parent, Pos X, -1, 1)
ground.type = High
ground.hittime  = 15
ground.velocity = 2 * IfElse(Pos X > Parent, Pos X, -1, 1), -3
air.velocity = 2 * IfElse(Pos X > Parent, Pos X, -1, 1), -3
fall = 1
forcenofall = 1
getpower = 0, 0
givepower = 7, 7
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 5
envshake.freq = 120
envshake.ampl = 4
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 2001, End]
type = VarSet
trigger1 = Parent, StateNo != 2000
var(0) = 17
persistent = 0


[State 2001, Timer]
type = VarAdd
trigger1 = var(0) > 0
var(0) = -1

[State 2001, trans]
type = Trans
trigger1 = var(0) > 0
trans = addalpha
alpha = (16 * var(0)), 128 + 8 * (16 - var(0))

[State 2001, End]
type = ChangeAnim
trigger1 = var(0) > 0
value = 7051
persistent = 0

[State 2001, End]
type = DestroySelf
trigger1 = var(0) = 1



; The twister itself
[Statedef 2002]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
anim = 7050
sprpriority = 2

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 2002, trans]
type = Trans
trigger1 = Time < 16
trans = addalpha
alpha = 16*Time, 256 - 8 * Time

[State 2002, Zoom]
type = trans
trigger1 = Time >= 16
trans = addalpha
alpha = 256, 128

[State 2002, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 2002, VelSet]
type = PosSet
trigger1 = 1
x = parent, pos x + 40 * sin(pi * (-time/30.0) + pi) - 5
y = 0

[State 2002, SprPriority]
type = SprPriority
trigger1 = cos(pi * (time/30.0) + pi) > 0
value = 3

[State 2002, SprPriority]
type = SprPriority
trigger1 = cos(pi * (time/30.0) + pi) < 0
value = 0

[State 2002, Zoom]
type = AngleDraw
trigger1 = 1
scale = 1 + 0.4 * sin(pi * (-time/30.0) + pi/2 + pi), 1 + 0.4 * sin(pi * (-time/30.0) + pi/2 + pi)

[State 2002, 2]
type = HitDef
trigger1 = Time % 20 = 10
attr = S, HP
damage    = Floor(13* IfElse(Parent, Var(21) > 0, 0.52, Parent, FVar(39)))
animtype  = Hard
priority = 5, Hit
hitflag = MAF
guardflag = M
pausetime = 0,5
sparkno = -1
sparkxy = -15,-4
hitsound   = S7000,1
guardsound = 6,0
p2facing = IfElse(Pos X > Parent, Pos X, -1, 1)
ground.type = Low
ground.slidetime = 8
ground.hittime  = 15
ground.velocity = 2 * IfElse(Pos X > Parent, Pos X, -1, 1), -3
air.velocity = 2 * IfElse(Pos X > Parent, Pos X, -1, 1), -3
envshake.time = 5
envshake.freq = 120
envshake.ampl = 4
getpower = 0, 0
givepower = 7, 7
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
fall = 1
forcenofall = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 2002, End]
type = VarSet
trigger1 = Parent, StateNo != 2000
var(0) = 17
persistent = 0

[State 2002, Timer]
type = VarAdd
trigger1 = var(0) > 0
var(0) = -1

[State 2002, trans]
type = Trans
trigger1 = var(0) > 0
trans = addalpha
alpha = (16 * var(0)), 128 + 8 * (16 - var(0))

[State 2002, End]
type = ChangeAnim
trigger1 = var(0) > 0
value = 7051
persistent = 0

[State 2002, End]
type = DestroySelf
trigger1 = var(0) = 1

;---------------------------------------------------------------------------
;Triple Kick
[Statedef 2010]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= -1000
ctrl = 0
anim = 2010
sprpriority = 2
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2010, PalFx]
type = PalFX
trigger1 = (Time % 8 = 0)
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2010, Offset]
type = OffSet
trigger1 = Time % 2 = 0
X = (random % 8) - 4
Y = (random % 8) - 4

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

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

; First Kick
[Statedef 2011]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= 0
velset = 0,0
ctrl = 0
anim = 2011
sprpriority = 2

[State 2011, NHB]
type = NotHitBy
trigger1 = AnimElemNo(0) < 3
time = 1
value = SCA

[State 2011, Go through stuff]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2011, Turn towards opponent]
type = Turn
triggerall = !Time
trigger1 = EnemyNear(0), ScreenPos X > ScreenPos X && Facing < 0
trigger2 = EnemyNear(0), ScreenPos X < ScreenPos X && Facing > 0

[State 2011, Going into the air]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 2011, X]
Type = VarSet
Trigger1 = !Time
fvar(0) = (EnemyNear(0), Pos X- Pos X) * Facing

[State 2011, Y]
Type = VarSet
trigger1 = !Time
fvar(1) = (EnemyNear(0), Pos Y - Pos Y + IfElse(Enemynear(0), Statetype = S, Enemynear(0),Const(size.head.pos.y), Enemynear(0),Const(size.mid.pos.y)))

[State 2011, Vector Length]
Type = VarSet
trigger1 = !Time
fvar(2) = Exp(0.5*ln((fvar(0) * fvar(0))+(fvar(1) * fvar(1))))

[State 2011, Vel]
type = Velset
trigger1 = AnimElem = 3
x = (fvar(0)/fvar(2)) * 15
y = (fvar(1)/fvar(2)) * 15

[State 2011, Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7050,0

[State 2011, AfterImage]
type = Explod
trigger1 = AnimElemNo(0) = 3 && (Time % 2 = 0) && !MoveContact
anim = 2016
ID = 2011
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ownpal = 1
removeongethit = 0

[State 2011, ScreenBound]
type = ScreenBound
trigger1 = 1;HitCount
movecamera = 0,0
value = 0
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 2011, Hit]
type = HitDef
trigger1 = !Time
attr = A, HA
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
sparkno = S7008
damage = 48,0
sparkxy = 0,0
hitsound = S7020,5
pausetime = 16, 60
guard.pausetime = 16, 16
ground.type = High
ground.slidetime = 0
ground.hittime = 16
guard.velocity = -5
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
kill = 0
givepower = 0, 0
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.velocity = 0,0
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -3,-4
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 32

[State 2011, Var]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 2011, Var]
type = VarSet
triggerall = !MoveHit
trigger1 = MoveContact && MoveGuarded
trigger2 = ScreenPos X > EnemyNear(0), ScreenPos X && Vel X > 0
trigger2 = Time > 20
trigger3 = ScreenPos X < EnemyNear(0), ScreenPos X && Vel X < 0
trigger3 = Time > 20
trigger4 = ScreenPos Y < EnemyNear(0), ScreenPos Y && Vel Y < 0
trigger4 = Time > 20
trigger5 = ScreenPos Y > EnemyNear(0), ScreenPos Y && Vel Y > 0
trigger5 = Time > 20
trigger6 = Time > 80
var(0) = 1

[State 2011, Success]
type = ChangeState
triggerall = !Var(0)
trigger1 = MoveHit
trigger2 = FrontEdgeBodyDist < 5
value = 2012
ctrl = 0


[State 2011, Blocked]
type = ChangeState
trigger1 = Var(0)
value = 2014
ctrl = 0

; Second Kick
[Statedef 2012]
type    = A
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
sprpriority = 2
anim = 2012

[State 2012, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 2012
trigger1 = FrontEdgeBodyDist < 5
value = 2012
elem = 2

[State 2012, Go through stuff]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2012, Freeze Camera]
type = ScreenBound
trigger1 = 1
movecamera = 0, 1
ignorehitpause = 1

[State 2012, Slowdown from kick]
type = VelMul
trigger1 = Anim = 2012 && AnimElemNo(0) = 1
X = 0.91
Y = 0.91

[State 2012, Stop]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 2012
X = 0
Y = 0

[State 2012, Turn towards opponent]
type = Turn
triggerall = AnimElem = 2 && Anim = 2012 
trigger1 = EnemyNear(0), ScreenPos X > ScreenPos X && Facing < 0
trigger2 = EnemyNear(0), ScreenPos X < ScreenPos X && Facing > 0

[State 2012, Rise]
type = VelSet
trigger1 = Anim = 2012 && AnimElemTime(2) = 3
Y = -8

[State 2012, Slow Down]
type = VelMul
trigger1 = Anim = 2012 && AnimElemTime(2) > 3 && AnimElemNo(0) = 2
Y = 0.85

[State 2012, X]
Type = VarSet
Trigger1 =  !AnimTime && Anim = 2012
fvar(0) = (EnemyNear(0), Pos X- Pos X) * Facing

[State 2012, Y]
Type = VarSet
trigger1 = !AnimTime && Anim = 2012
fvar(1) = (EnemyNear(0), Pos Y - Pos Y + Enemynear(0),Const(size.mid.pos.y))

[State 2012, Vector Length]
Type = VarSet
trigger1 = !AnimTime && Anim = 2012
fvar(2) = Exp(0.5*ln((fvar(0) * fvar(0))+(fvar(1) * fvar(1))))

[State 2012, Vel]
type = Velset
trigger1 = !AnimTime && Anim = 2012
x = (fvar(0)/fvar(2)) * 9
y = (fvar(1)/fvar(2)) * 9

[State 2012, Snd]
type = PlaySnd
trigger1 = !AnimTime && Anim = 2012
value = S7050,0

[State 2012, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = 2012
value = IfElse(fvar(1) > 0, 2013, 2014)

[State 2012, AfterImage]
type = Explod
trigger1 = Anim != 2012
trigger1 = (Time % 2 = 0) && !MoveContact
anim = IfElse(Anim = 2013, 2017, 2018)
ID = 2012
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ownpal = 1
removeongethit = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 2012, Hit]
type = HitDef
trigger1 = Anim != 2011 && AnimElem = 2
attr = A, HA
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
sparkno = -1
damage = 63,0
sparkxy = 0,0
hitsound = S7020,5
pausetime = 16, 60
guard.pausetime = 16, 16
ground.type = Low
ground.slidetime = 0
ground.hittime = 16
ground.velocity = 0, 0
guard.velocity = -5
ground.cornerpush.veloff = 0
givepower = 0, 0
envshake.time = 22
envshake.freq = 120
envshake.ampl = 8
air.velocity = 0,0
air.fall = 1
kill = 0
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -3,-4
forcestand = 1
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 32

[State 2012, Explod]
type = Explod
trigger1 = MoveHit
anim = 7005
ID = 7005
pos = -2,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 2012, End 1]
type = ChangeState
trigger1 = MoveContact
value = 2013
ctrl = 0

[State 2012, End 3]
type = PosSet
trigger1 = Pos Y > 0
y = 0

[State 2012, End 2]
type = ChangeState
trigger1 = Pos Y >= 0
value = 52
ctrl = 0

[State 2012, End 3]
type = VelSet
trigger1 = FrontEdgeBodyDist < 5
x = - 3
y = - 7

[State 2012, End 3]
type = VelSet
trigger1 = ScreenPos Y < 0
x = - 3
y = - 7

[State 2012, End 3]
type = ChangeState
trigger1 = FrontEdgeBodyDist < 5 && Anim != 2012
trigger2 = ScreenPos Y < 0
value = 50
ctrl = 0

; Third Kick
[Statedef 2013]
type    = A
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
sprpriority = 2
anim = 2015
velset = 0, -10

[State 2013, Go through stuff]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2013, Freeze Camera]
type = ScreenBound
trigger1 = 1
movecamera = 0, 1
ignorehitpause = 1

[State 2013, Gravity]
type = VelMul
trigger1 = AnimElemNo(0) < 2
Y = 0.9

[State 2013, Gravity]
type = VelSet
trigger1 = AnimElem = 2
Y = 8

[State 2013, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7050,0

[State 2013, AfterImage]
type = Explod
trigger1 = AnimElemNo(0) = 2
trigger1 = (Time % 2 = 0) && !MoveContact
anim = 2019
ID = 2013
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ownpal = 1
removeongethit = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 2012, Hit]
type = HitDef
trigger1 = AnimElem = 2
attr = A, HA
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
sparkno = -1
damage = 68,0
hitsound = S7020,5
pausetime = 20, 20
guard.pausetime = 16, 16
ground.type = Low
ground.slidetime = 0
ground.hittime = 16
ground.velocity = 0, 0
guard.velocity = -5
ground.cornerpush.veloff = 0
givepower = 0, 0
envshake.time = 24
envshake.freq = 120
envshake.ampl = 9
air.velocity = 0,5
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = 0,4
forcestand = 1
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 32

[State 2013, Explod]
type = Explod
trigger1 = MoveHit
anim = 7006
ID = 7006
pos = 0,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0


[State 2012, End 3]
type = PosSet
trigger1 = Pos Y >= 0
Y = 0

[State 2012, End 3]
type = ChangeState
trigger1 = Pos Y >= 0
value = 52
ctrl = 0

; Missed
[Statedef 2014]
type = A
physics = N
movetype = I
velset = 0,0
anim = 43
ctrl = 0

[State 2011, Blocked or Evaded]
type = VelSet
trigger1 = !Time
x = - 3
y = - 5

[State 2011, Gravity]
type = VelAdd
trigger1 = 1
Y = 0.38

[State 2011, Blocked]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 611
ctrl = 0

;---------------------------------------------------------------------------
;Gatling Kick
[Statedef 2020]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= -1000
ctrl = 0
anim = 2020
sprpriority = 1
facep2 = 1

[State 2020, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA


[State 2020, PalFx]
type = PalFX
trigger1 = (Time % 8 = 0)
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2020, Offset]
type = OffSet
trigger1 = Time % 2 = 0
X = (random % 8) - 4
Y = (random % 8) - 4

[State 2020, Super Pause FX]
type = Helper
trigger1 = Time = 1
helpertype = Normal
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
sound = S7010,2
p2defmul = 1
darken = 0

[State 2020, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2021
ctrl = 0

;Gatling Kick - Jump
[Statedef 2021]
type    = A
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
anim = 2021
sprpriority = 1
velset = 6.7,0

[State 2021, Snd]
trigger1 = Time % 10 = 9
type = PlaySnd
value = S7000,1
channel = 1

[State 2021, Jump]
type = PosAdd
trigger1 = !Time
Y = -15

[State 2021, Miss]
type = ChangeAnim
trigger1 = Time = 30 && !AnimTime
value = 2022

[State 2021, Jump]
type = StateTypeSet
trigger1 = Time = 30
physics = A

[State 2021, Jump]
type = PlayerPush
trigger1 = Time < 30
value = 0

[State 2021, Hit]
type = HitDef
trigger1 = !Time
attr = A, HT 
hitflag = MA-
priority = 4, Miss
sparkno = -1
p1stateno = 2022
p2stateno = 2023
guard.dist = 0
damage = 20, 3 
animtype = Hard
p1facing = 1
pausetime = 5, 0
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

; Gatling Kick - Success
[Statedef 2022]
type = A
physics = N
movetype = A
poweradd = 0
velset = 0,0

[State 2022, Helper]
type = Helper
trigger1 = !Time
helpertype = normal ;player
name = "Chasm"
ID = 2022
stateno = 2025
pos = Floor(Target, Pos X - Pos X ) * Facing , Floor(-Pos Y);Floor(Target, Pos X - Pos X ) * Facing, Floor(-Pos Y)
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause =  1
persistent = 0

[State 2022, !Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 2022, Var]
type = VarSet
trigger1 = !Time
var(0) = IfElse(Pos X > Target, Pos X, -1,1)
ignorehitpause =  1

[State 2022, Snd]
type = PlaySnd
trigger1 = (Time = [0,70]) && ( Time % 32 = 0 )
trigger2 = (Time = [71,140]) && ( Time % 16 = 0 )
trigger3 = (Time = [141,169]) && ( Time % 8 = 0 )
value = S7020,3
channel = 0
ignorehitpause =  0

[State 2022, Snd]
type = PlaySnd
trigger1 = Time = 170
value = S7020,6

[State 2022, Screenbound]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause =  1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(1) = Pos Y
persistent = 0
ignorehitpause = 1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(3) = Target, Pos Y
persistent = 0
ignorehitpause = 1

[State 2022, Move]
type = PosSet
trigger1 = Time
X = (Helper(2022), Pos X) - Cos(pi * time/20.0) * 25 * Var(0) 
Y = FVar(1) - IfElse(Time > 90, 45, Time * 45/90.0)
ignorehitpause =  1

[State 2022, Move]
type = TargetBind
trigger1 = Target, StateNo = 2023
trigger1 = !NumHelper(2022)
ignorehitpause = 1

[State 2022, Move]
type = TargetBind
trigger1 = Target, StateNo = 2023
trigger1 = NumHelper(2022)
pos = ((Helper(2022), Pos X) - Pos X) * Facing , FVar(3) - Pos Y - IfElse(Time < 50, 0.3*Time, 15)
ignorehitpause = 1

[State 2022, Move]
type = SprPriority
trigger1 = 1
value = IfElse(Sin(pi * time/20.0)*Facing > 0, 2, 0)

[State 2022, End]
type = VelSet
trigger1 = Time = 230
X = - 3
Y = - 6

[State 2022, End]
type = ChangeState
trigger1 = Time = 230
value = 50
ctrl = 0

;Gatling Kick - Hit
[Statedef 2023]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2023

[State 2023, Shake]
type = EnvShake
trigger1 = !Time
time = 210
freq = 60
ampl = 2

[State 2023, Shake]
type = PalFx
trigger1 = (Time = [0,70]) && ( Time % 32 = 0 )
trigger2 = (Time = [71,140]) && ( Time % 16 = 0 )
trigger3 = (Time = [141,210]) && ( Time % 8 = 0 )
add = 200, 200, 200
mul = 256, 256, 256
time = 4

[State 2023, Shake]
type = LifeAdd
trigger1 = (Time = [0,70]) && ( Time % 32 = 0 )
trigger2 = (Time = [71,140]) && ( Time % 16 = 0 )
trigger3 = (Time = [141,210]) && ( Time % 8 = 0 )
value = -8
kill = 0

[State 2023, Into the Air]
type = ChangeState
trigger1 = Time = 210
value = 2024

[State 2023, End]
type = SelfState
trigger1 = Time > 10 && !GetHitVar(IsBound)
value = 5050

;Gatling Kick - Into the air
[Statedef 2024]
type = A
movetype = H
physics = N
sprpriority = 1
velset = 0, - 12

[State 2024, PosAdd]
type = PosAdd
trigger1 = !Time
Y = Const(size.mid.pos.y)

[State 2024, Gravity]
type = ScreenBound
trigger1 = 1
value = 0

[State 2024, Gravity]
type = VelAdd
trigger1 = 1
Y = .54

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 803

[State 2024, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 804

[State 2024, Life]
type = LifeAdd
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = -12

[State 2024, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 2024, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 14
freq = 120
ampl = 8

[State 2024, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 2024, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0

;Chasm
[Statedef 2025]
type = S
movetype = I
physics = N
anim = 7106
sprpriority = -1

[State 2021, Invisible]
type = Width
trigger1 = 1
value = 0,0

[State 2021, Invisible]	
type = PlayerPush
trigger1 = 1
value = 0

[State 2021, Invisible]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 2021, Scale]
type = AngleDraw
trigger1 = Time < 80
scale = 0.625*Time/60.0, 0.625*Time/100.0

[State 2021, Scale]
type = AngleDraw
trigger1 = Time >= 80
scale = 50/60.0, 50/100.0

[State 2021, Color]
type = PalFX
trigger1 = !Time
time = -1
add = 0,0,0
mul = 156,156,156
sinadd = 100,0,0,50

[State 2021, Rocks]
type = Helper
trigger1 = Time > 30 && (Time % 7 = 0) && !var(0)
helpertype = normal ;player
name = "Debris"
ID = 2025
stateno = 2026
pos = -20 + Floor(random % 40*(IfElse(Time > 80, 1, Time/80.0))) , -10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2021, End]
type = VarAdd
trigger1 = var(0) > 0
var(0) = -1

[State 2021, End]
type = VarSet
trigger1 = Parent, Stateno != 2022
var(0) = 30
persistent = 0

[State 2021, End]
type = trans
trigger1 = var(0) > 0
trans = AddAlpha
alpha = Floor(256*var(0)/30.0), Floor(256  - 256*var(0)/30.0)

[State 2021, End]
type = DestroySelf
trigger1 = var(0) = 1

;Debris
[Statedef 2026]
type = S
movetype = I
anim = IfElse(random % 4 = 0, 7109, IfElse(random % 2 = 0, 7108, 7107))
physics = N
velset = 0,-4
sprpriority = random % 3

[State 2022, Var]
type = VelSet
trigger1 = 1
Y = -1 - 3 * Sin (Pi * Time /50.0)

[State 2022, Var]
type = VarSet
trigger1 = !Time
var(0) = IfElse(random % 2 = 0, -1, 1)
ignorehitpause = 1

[State 2022, Angle]
type = AngleSet
trigger1 = !Time
value = 360 *(random/1000.0)
ignorehitpause = 1

[State 2022, Rotate]
type = AngleAdd
trigger1 = 1
value = (5 + (random % 5))* var(0)
ignorehitpause = 1

[State 2022, Rotate]
type = null;AngleDraw
trigger1 = 1
ignorehitpause = 1

[State 2022, trans]
type = Trans
trigger1 = Time > 20
trans = addalpha
alpha = 256 - 25*(Time - 20), 25*(Time - 20)
ignorehitpause = 1

[State 2022, End]
type = DestroySelf
trigger1 = Time = 30 
ignorehitpause = 1

;---------------------------------------------------------------------------

;SKS - Start
[Statedef 2100]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= -3000
ctrl = 0
anim = 2107
sprpriority = 2
facep2 = 1
velset = 0,0

[State 2100, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2100, PalFx]
type = PalFX
trigger1 = (Time % 8 = 0) && AnimElemNo(0) < 5
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2100, Offset]
type = OffSet
trigger1 = Time % 2 = 0
X = (random % 4) - 2
Y = (random % 4) - 2

[State 2100, Super Pause FX]
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

[State 2100, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 60
movetime = 60
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2100, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2101
ctrl = 0

;SKS - Advancing
[Statedef 2101]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 2100
sprpriority = 2
facep2 = 1

[State 2102, End]
type = PlaySnd
trigger1 = !Time
value = 7050,1
channel = 2

[State 2101, AfterImage]
type = AfterImage
trigger1 = Time = 1
time = 2
timegap = 7
framegap = 5
length = 15
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State 2101, AfterImage]
type = AfterImageTime
trigger1 = 1
time = 2

[State 2101, vel]
type = VelSet
trigger1 = 1
X  = 4.5

[State 2101, Miss]
type = HitDef
trigger1 = !Time
attr = S, HT
hitflag = 

[State 2101, Hit]
type = HitDef
trigger1 = Time
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 20
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p2sprpriority = 1
p1stateno = 2102
fall = 1 
fall.recover = 0

[State 2101, End]
type = ChangeState
trigger1 = Time > 80
value = 0
ctrl = 1

;SKS - Hitting
[Statedef 2102]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 2101
sprpriority = 2
facep2 = 1
velset = 0,0

[State 2102, Throw]
type = TargetState
trigger1 = !time
value = 2105

[State 2102, Bind]
type = TargetBind
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
pos = 10,0

[State 2102, Assert]
type = AssertSpecial
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
flag = nobardisplay
flag2 = noFG

[State 2102, spr]
type = SprPriority
trigger1 = AnimElemTime(1) >= 89
value = 1

[State 2102, Bind]
type = TargetBind
trigger1 = 1
pos = 15, 0

[State 2102, hitadd]
type = HitAdd
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 1

[State 2102, hitdamage]
type = TargetLifeAdd
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = - 16
kill = (AnimElemNo(0) > 15)

[State 2102, givepower]
type = TargetPowerAdd
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 36

[State 2102, HitSound]
type = PlaySnd
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 7020,0
;channel = 2

[State 2023, Shake]
type = EnvShake
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
time = 5
freq = 120
ampl = 10

[State 2102, End]
type = PlaySnd
trigger1 = AnimElem = 12
value = 7050,2
channel = 2

[State 2102, Pause]
type = null;Pause
trigger1 = AnimElemTime(1) = [33,103]
time = 2
movetime = 2

[State 2102, fadeout]
type = AllPalFX
trigger1 = AnimElemTime(2) = -16
time = 16
sinadd = -255, -255, -255, 64

[State 2102, black]
type = EnvColor
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 4
value = 0, 0, 0

[State 2102, Sparks]
type = Explod
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
anim = 7000 + (random % 2)
ID = 7001
sprpriority = 5
postype = p2
pos = (Random % 40) - 20, (target, const(size.mid.pos.y)) + (Random % 40) - 20
facing = -1
ownpal = 1
ontop = 1
removetime = -2
pausemovetime = 300
supermovetime = 300

[State 2102, Shake]
type = EnvShake
trigger1 = AnimElem = 2  || AnimElem = 3  || AnimElem = 4  || AnimElem = 5  || AnimElem = 6  || AnimElem = 7  || AnimElem = 8 || Animelem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
time = 6
freq = 120
ampl = -4

[State 2102, End]
type = TargetState
trigger1 = AnimElemTime(16) >= 0 && numtarget
value = 2106
persistent = 0

[State 2102, End]
type = ChangeState
trigger1 = animelemtime(16) >= 0 && WinKO
value = 300

[State 2102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;SKS - Flame BG
[Statedef 2103]
anim = 2103
physics = N
velset = 0, 0

[State 7610, Kanji]
type = explod
trigger1 = !time
anim = 2102
ID = 2102
sprpriority = -5
postype = left
pos = 0.5 *  gamewidth, 0.5 * gameheight
scale = 1 * (1.3333333 * gameheight / gamewidth), 1 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 7610, Shrink]
type = modifyexplod
trigger1 = time < 6
ID = 2102
scale = (6.5 - time) * (1.3333333 * gameheight / gamewidth), (6.5 - time) * (1.3333333 * gameheight / gamewidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 6
ID = 2102
scale = 1.5 * (1.3333333 * gameheight / gamewidth), 1.5 * (1.3333333 * gameheight / gamewidth)

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = nomusic

[State 7610, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay
ignorehitpause = 1

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = noFG
ignorehitpause = 1

[State 7610, black]
type = bgpalfx
trigger1 = time < 120
time = 2
add = -255, -255, -255

[State 7610, black]
type = bgpalfx
trigger1 = time = 120
time = 60
add = -255, -255, -255
sinadd = 255, 255, 255, 240

[State 7610, Fade]
type = palfx
trigger1 = time = 120
time = 60
sinadd = -255, -255, -255, 240

[State 2103, pos]
type=PosAdd
trigger1=1
x= 0.5 *  gamewidth - Screenpos x
y= gameheight - Screenpos y

[State 2103, Size]
type = AngleDraw
trigger1 = 1
scale = (gamewidth/320), (gameheight/240)

[State 2103, trans]
type = Trans
trigger1= 1
trans = AddAlpha
alpha = ceil(200*sin(pi*time/(45.0))), 128 + floor(28*sin(pi*time/45.0))

[State 7610, Safety]
type = removeexplod
trigger1 = time >= 180

[State 2080, trans]
type=Destroyself
trigger1=time>=180

;SKS - Got hit
[Statedef 2105]
type = S
movetype = H
physics = S

[State 2105, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 2105, Anim]
trigger1 = !Time
type = ChangeAnim2
value = 2105
ignorehitpause = 1

;SKS - Lying
[Statedef 2106]
type = L
movetype = H
physics = C

[State 2106, Anim]
trigger1 = !Time
type = ChangeAnim2
value = 2106
ignorehitpause = 1

[State 2106, End]
type = SelfState
trigger1 = !Alive
value = 5150

[State 2106, End]
type = SelfState
trigger1 = Time >= 76 && Alive
value = 5120

;Berserker Activation
[Statedef 2110]
type = S
movetype = I
physics = S
anim = 2020
ctrl = 0
velset = 0,0
sprpriority = 2
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2010, PalFx]
type = PalFX
trigger1 = (Time % 8 = 0)
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2010, Offset]
type = OffSet
trigger1 = Time % 2 = 0
X = (random % 8) - 4
Y = (random % 8) - 4

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
sound = S7010,2
p2defmul = 1
darken = 0

[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 21
value = 1

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && Var(21) > 0
value = 2111
ctrl = 1

;Berserker
[Statedef 2111]
type = S
physics = S
anim = 20
sprpriority = 1
     
[State 9001: VelSet]
type = VelSet
trigger1 = 1
x = 2.8
     
[State 9001: AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoWalk
flag2 = NoAutoTurn
     
[State 9001: ChangeState]
type = ChangeState
trigger1 = !Var(21)
value = 0
ctrl = 1

