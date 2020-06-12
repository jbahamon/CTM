;===========================================================================
; Special Moves
;===========================================================================

;Lightning
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0 || Var(22) > 0, 0, 72)
facep2 = 1


[State 200, Explod]
type = Explod
 trigger1 = Time < 50
trigger1 = GameTime % 5 = 0
anim = 7102
ID = 1000
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-1 + (Random/1000.0)*0.7
accel = 0,-0.3
random = 27,7
sprpriority = 2
removetime = -2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,0
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 3
name = "Lightning"
ID = 1000
stateno = 1001
pos = 50 + (50 + IfElse(Var(22) > 0, 30, 0)) * Var(0) , 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = Time > 60
value = 0
ctrl = 1

;The Lightning
[Statedef 1001]
type = S
physics = N
movetype = A
anim = 7100 + IfElse(Root, Var(22) > 0, 3, 0)
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,1
ignorehitpause = 1

[State 1001, ParentVar]
type = ParentVarSet
trigger1 = !Time
trigger1 = Anim = 7103
var(22) = 0
ignorehitpause = 1

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
trigger1 = Anim = 7100
trigger2 = AnimElem = 4
trigger2 = Anim = 7103
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1.2 + IfElse(Anim = 7103, 0.3, 0), 0.7 + IfElse(Anim = 7103, 0.3, 0)
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1001, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = S,SP
damage = Floor(Parent, FVar(39)*60) + IfElse(Anim = 7103, Floor(Parent, FVar(39)*50), 0)
animtype = Hard
hitflag = MAF
guardflag = H
pausetime = 4, 30
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4,0
air.velocity  = -0.4, 4
air.fall = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 120, 120, 20
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0 || Parent, Var(22) > 0, 0, 20)

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1001, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1

;---------------------------------------------------------------------------
; Cyclone
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 5
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Snd]
type = PlaySnd
trigger1 = !Time
value = S7110,0
channel = 0
loop = 1
ignorehitpause = 1
persistent = 0

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1100, nothitby]
type = nothitby
trigger1 = animelemtime(1) < 6
value = SCA
time = 1
ignorehitpause = 1

[State 1010, Jump]
type = VelSet
trigger1 = AnimElemNo(0) > 1
X = 0.3 + 0.9*Var(0)
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElemTime(2) = 0 || AnimTime = 0
anim = 7110
ID = 1011
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7111
ID = 1011
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 7110
ID = 1011
pos = -15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7111
ID = 1011
pos = 5, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1250, Hit]
type = HitDef
trigger1 = AnimElem = 2 || !AnimTime
attr = S, SA
damage = 51, 9
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 7, 7
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.7, -1
air.type = Low
air.velocity = -0.7, -1
air.juggle = 5
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 24, 48)), IfElse(Var(21) > 0, 0, 12)
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.3
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10

[State 1010, Snd]
type = StopSnd
trigger1 = Time > 30 && !AnimTime
channel = 0
ignorehitpause = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = Time > 30 && !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Volt Hit
[Statedef 1020]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 1020
sprpriority = 1
poweradd = -250
facep2 = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,0
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = Time < 70
trigger1 = GameTime % 5 = 0
anim = 7102
ID = 1000
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-1 + (Random/1000.0)*0.7
accel = 0,-0.3
random = 27,7
sprpriority = 2
removetime = -2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 3
name = "Self Lightning"
ID = 1021
stateno = 1021
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = Var(22) > 0
trigger1 = !NumHelper(1020)
name = "Volt Spark"
ID = 1020
stateno = 1022
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = NumHelper(1020) && !NumHelper(1021)
value = 0
ctrl = 1

;Self Lightning
[Statedef 1021]
type = A
physics = N
movetype = A
anim = 7100
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,1
ignorehitpause = 1

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = 0, 7
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = 5, -18
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = -7, -13
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = AnimElem = 6
var(22) = 360
persistent = 0
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1

;Volt Spark
[Statedef 1022]
type = A
physics = N
movetype = I
anim = 7121
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1022, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X - 17)/5.0 
Y = (ParentDist Y - 30 + 10 * Sin(GameTime/20.0))/5.0
ignorehitpause = 1


[State 1022, FollowPlayer]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 1022, FollowPlayer]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1022, FollowPlayer]
type = DestroySelf
trigger1 = Root, Var(22) <= 0
ignorehitpause = 1

;---------------------------------------------------------------------------
; Spincut
[Statedef 1030]
type    = A
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 1030
velset = 0,0
poweradd=IfElse(Var(21) > 0, 0, 115)
sprpriority=1
facep2= 1

[State 1030, Fall]
type = ChangeAnim
trigger1 = Time > 0
trigger1 = Anim = 1030
trigger1 = AnimElemNo(0) = 1
trigger1 = Command = "a" || Command = "b" || Command = "c"
value = 1030
elem = 2
persistent = 0

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) = 1
trigger1 = Anim = 1030
time = 3
ignorehitpause = 1

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = !Time
length = 8
palbright = 0, 0, 0
palcolor = 256
paladd = 1,1,1
palcontrast = 256, 256, 256
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = none
;alpha = 256, 0
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) != 1
trigger2 = Anim != 1030
time = 0
ignorehitpause = 1

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7010,1

[State 1030, Jump]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 1030, Jump]
type = VelSet
trigger1 = !Time
X = 0.9
Y = -4.1

[State 1030, Jump]
type = VelAdd
trigger1 = Anim = 1030
trigger1 = AnimElemNo(0) = 1
Y = 0.2

[State 1030, Jump]
type = VelSet
trigger1 = Anim = 1030
trigger1 = AnimElem = 2
Y = 0.2

[State 220, Explod]
type = Explod
trigger1 = Anim = 1030
trigger1 = AnimElem = 2
anim = 7130
ID = 1030
pos = 20, 0
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0


[State 1030, Hit]
type = HitDef
trigger1 = !Time
damage = 73, 10
pausetime = 12, 12
attr = A, SA 
guardflag = HA
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity = -6,-0.5
ground.velocity = -6,-0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 50)

[State 1030, Fall]
type = ChangeAnim
trigger1 = Anim = 1030
trigger1 = !AnimTime
value = 42
elem = 2

[State 1030, Fall]
type = VelAdd
trigger1 = Anim = 42
Y = 0.3


[State 1030, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621