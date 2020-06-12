;===========================================================================
; Special Moves
;===========================================================================

;Elemental Magic
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
trigger1 = !Var(21)
value = S7100,Var(59)
channel = 0
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(59) = 0
trigger1 = !Var(21)
name = "Lightning"
ID = 1000
stateno = 1001
pos = 50 + 50 * Var(0), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(59) = 1
trigger1 = !Var(21)
name = "Water Bubble"
ID = 1000
stateno = 1002
pos = 20, -20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(59) = 2
trigger1 = !Var(21)
name = "Fire"
ID = 1000
stateno = 1003
pos = 15, -15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(21)
name = "Dark Bomb"
ID = 1000
stateno = 1007
pos = 50 + 60 * Var(0), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = Time > (30 + 15 * !Var(59))
trigger2 = NumHelper(1000)
trigger2 = (Helper(1000), Time > 20 && Var(21))
value = 0
ctrl = 1

;Lightning
[Statedef 1001]
type = S
physics = N
movetype = A
anim = 7100
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1001, Snd]
type = PlaySnd
trigger1 = !Time
channel = 0
value = S7101,0
ignorehitpause = 1

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7105
ID = 200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1.2, 0.7
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
damage = Floor(Parent, FVar(39)*40), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4,4
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
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

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

;Water Bubble
[Statedef 1002]
type = S
physics = N
movetype = A
anim = 7101
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1002, Vertical Speed]
type = VelSet
trigger1 = Time < 100
X = 0.3 * (2 - Var(0)) + 0.5
Y = IfElse(Var(0) = 2, -.84, IfElse(Var(0) = 1, -.45, -.24)) - Sin(Time * 6)

[State 1002, Vertical Speed]
type = VelAdd
trigger1 = Time >= 100 
X = - Vel X * 0.9

[State 1002, Vertical Speed]
type = VelSet
trigger1 = Time >= 80 
Y = IfElse(Var(0) = 2, -.84, IfElse(Var(0) = 1, -.45, -.24)) * 30 /(30.0 + Time - 80) - Sin(Time * 6)


[State 1010, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = S,SP
damage = Floor(Parent, FVar(39)*50), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4,4
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4, -4.2
air.velocity  = -0.4, -4.2
air.fall = 1
fall.recover = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 0, 20, 120
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 200, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1005
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1010, burst]
type = ChangeState
trigger1 = MoveContact
trigger2 = Time > 200
value = 1005
ignorehitpause = 1

; Fire
[Statedef 1003]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7103
sprpriority = 2

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1021, Strength]
type = VarSet
trigger1 = !Time
var(0) = parent, var(0)

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1004
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, Vel]
type = VelSet
trigger1 = AnimElem = 4
x =  IfElse(var(0) = 2, 4.2, IfElse(var(0) = 1, 2.7, 2)) * Cos(IfElse(var(0) = 2, 0.5 ,IfElse(var(0) = 1, 0.78, 1.4)))
y = -IfElse(var(0) = 2, 3.5, IfElse(var(0) = 1, 2.7, 4)) * Sin(IfElse(var(0) = 2, 0.5 ,IfElse(var(0) = 1, 0.78, 1.4)))
persistent = 0

[State 1021, Gravity]
type = VelAdd
trigger1 = AnimElemNo(0) >= 5
y = 0.26

[State 1010, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = S,SP
damage = Floor(Parent, FVar(39)*60), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 8
hitsound = S7101,2
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -3, -3
air.velocity  = -3, -3
air.fall = 1
p2facing = 1
palfx.invertall = 0
palfx.color = 0
palfx.add = 144, 64, 7
palfx.mul = 256,256,256
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 1022, Explod]
type = Explod
trigger1 = GameTime % 4 = 0
trigger1 = AnimElemNo(0) >= 5
trigger1 = !MoveContact
anim = 7104
ID = 1020
pos = 0, 0
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0, 0
accel = 0,0
removetime = -2
scale = 1 , 1
sprpriority = 1
ontop = 0
ownpal = 1
removeongethit = 0

[State 200, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 1021, ChangeState]
type = DestroySelf
trigger1 = MoveHit
trigger2 = Vel Y >= 0 && Pos Y > - Vel Y
trigger3 = MoveReversed
ignorehitpause = 1

;Fire Fading
[Statedef 1004]
type = A
physics = N
movetype = I
velset = 0,0
ctrl = 0
sprpriority = 4

[State 1015, snd]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1015, assert]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - Time * 16, Time * 16
ignorehitpause = 1

[State 1015, assert]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1015, assert]
type = DestroySelf
trigger1 = Time >= 16
ignorehitpause = 1

;Bubble Bursting
[Statedef 1005]
type = A
physics = N
movetype = I
anim = 7102
velset = 0,0
ctrl = 0
sprpriority = 4

[State 1015, snd]
type = PlaySnd
trigger1 = !Time
value = S7101,1
channel = 1
ignorehitpause = 1
persistent = 0

[State 1015, assert]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1015, dieplz]
type = DestroySelf
trigger1 = FrontEdgeDist < -50
trigger2 = BackEdgeDist < 0
trigger3 = !AnimTime

;Dark Bomb
[Statedef 1007]
type = S
physics = N
movetype = A
anim = 7106
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1002, Strength]
type = PlaySnd
trigger1 = !time && PrevStateNo != 1008
value = S7110,0

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1002, Strength]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 64
ignorehitpause = 1

[State 1002, Strength]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1010, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = S,SP
damage = Floor(Parent, FVar(39)*120), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4,30
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -3, 0
air.velocity  = -3, 0
air.fall = 1
fall.recover = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = -20, -20, -20
palfx.time = 50
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)
ID=1010
nochainid=1010

[State 200, Dampen]
Type = ParentVarset
trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1008
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1010, burst]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;Dark Bomb GetHit
[Statedef 1008]
type = S
physics = N
movetype = H
velset = 0,0
ctrl = 0
sprpriority = 4

[State 1002, Strength]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 1002, Strength]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - Time * 16, 64 - Time * 4
ignorehitpause = 1

[State 1015, assert]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1015, dieplz]
type = DestroySelf
trigger1 = !AnimTime || Time >= 16
ignorehitpause = 1

;---------------------------------------------------------------------------
; Dark Mist
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "dfc", 2, ifelse(command = "dfb", 1, 0))

[State 1100, nothitby]
type = nothitby
trigger1 = animelemtime(1) < 6
value = SCA
time = 1
ignorehitpause = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = Animelem = 3
trigger2 = Animelem = 7
trigger3 = Animelem = 11
value = S7000,1
ignorehitpause = 1

[State 1010, Jump]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N
ignorehitpause = 1

[State 1010, Jump]
type = VelSet
trigger1 = AnimElemNo(0) = [3, 14]
Y = -2.7 - 0.4 * Var(0)
X = 0.5 + Var(0)
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 11
anim = 7014
ID = 1010
pos = 3, -10
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
trigger2 = AnimElem = 9
trigger3 = AnimElem = 13
anim = 7014
ID = 1011
pos = -3, -20
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
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

[State 1010, Jump]
type = VelSet
trigger1 = AnimElem = 15
Y = 0
X = 0
ignorehitpause = 1

[State 1010, Gravity]
type = VelAdd
trigger1 = AnimElemNo(0) >= 15
y = 0.25
ignorehitpause = 1

[State 1250, Hit]
type = HitDef
trigger1 = Animelem = 3
trigger2 = Animelem = 7
trigger3 = Animelem = 11
attr = A, SA
damage = IfElse(var(0) = 2, 35, IfElse(var(0) = 1, 31, 25)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 7, 7
sparkno = S7007
sparkxy = -10, -25
hitsound = S7040,1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.5 - Var(0), -3.5 - 1.2 * Var(0)
air.type = Low
air.velocity = -0.5 - Var(0), -3.5 - 1.2 * Var(0)
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 24, 48)), IfElse(Var(21) > 0, 0, 12)
givepower = 12, 12
envshake.time = 16
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
palfx.invertall = 1
palfx.add = 140, 120, 180
palfx.mul = 256, 256, 256
palfx.time = 10

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) < 15
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = AnimElem = 3
length = 8
palbright = 20, 20, 20
palcolor = 0
paladd = 10,10,10
palmul = 0.65, 0.65, 0.65
timegap  = 1
framegap = 1
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time = [0, 16]
add = -2 * Time, -2 * Time, -2 * Time
color = 16 * (16 - Time )
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time > 16
trigger1 = AnimElemTime(15) < 0
add = -32, -32, -32
color = 0
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = AnimElemTime(15) = [0, 16]
add = -2 * (16 - AnimElemTime(15)), -2 * (16 - AnimElemTime(15)),-2 * (16 - AnimElemTime(15))
color = 16 * AnimElemTime(15)
time = 1
ignorehitpause = 1

[State 1040, End]
type = PosSet
trigger1 = Pos Y > - Vel Y && Vel Y > 0
trigger1 = AnimElemNo(0) >= 15
Y = 0

[State 1040, End]
type = VelSet
trigger1 = Pos Y > - Vel Y && Vel Y > 0
trigger1 = AnimElemNo(0) >= 15
Y = 0

[State 1040, End]
type = ChangeState
trigger1 = Pos Y >= 0 
trigger1 = AnimElemNo(0) >= 15
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Shadow Walk
[Statedef 1020]
type    = S
movetype= I
physics = S
juggle  = 3
poweradd= 0
ctrl = 0
anim = 1020
sprpriority = -1
facep2 = 1
velset = 0,0

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = Command = "dfbc" || Command = "dbbc"

[State 1010, Direction]
type = VarSet
trigger1 = !Time
var(1) = IfElse(Command = "dfab" || Command = "dfbc", 1, -1)

[State 1020, Strength]
type = NotHitBy
trigger1 = AnimElemNo(0) >= 2
value = , AA, AP

[State 1020, Strength]
type = NotHitBy
trigger1 = AnimElemNo(0) >= 2
value = , AA, AP

[State 1020, Strength]
type = PlayerPush
trigger1 = AnimElemNo(0) >= 2
value = 0

[State 1020, Strength]
type = PlaySnd
trigger1 = AnimElem = 2
value = s7000,1
persistent = 0

[State 1020, Strength]
type = VelSet
trigger1 = AnimElemNo(0) >= 2
trigger1 = Anim = 1020 || Anim = 1022
X = IfElse(Var(1) > 0, 1.4 * Const(velocity.run.fwd.x), 1.4 * Const(velocity.run.back.x) )

[State 1020, Strength]
type = ChangeAnim
trigger1 = AnimElemNo(0) = 2
trigger1 = Var(1) < 0
value = 1022

[State 1020, Afterimage]
type = PalFX
trigger1 = Time = [0, 16]
add = -4 * Time, -4 * Time, -4 * Time
color = 16 * (16 - Time )
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 8 * Time, 4 * Time
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time > 16
add = -64, -64, -64
color = 0
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = Trans
trigger1 = Time > 16
trans = addalpha
alpha = 128, 64
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = Time > (15 * Var(0) + 25)
value = 1021

;Shadow Walk End
[Statedef 1021]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 1021
sprpriority = 1
facep2 = 1

[State 1020, Afterimage]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 128 + 8 * Time, 64 - 4 * Time
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = 1
add = -4 * (16 - Time), -4 * (16 - Time),-4 * (16 - Time)
color = 16 * Time
time = 1
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Black Hole
[Statedef 1030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
sprpriority = 2
facep2 = 1
velset = 0,0
poweradd = -500

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7100,3
channel = 0

[State 1030, Jump]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 1030, Wave]
type = Helper
trigger1 = AnimElem = 5
name = "Black Hole"
ID = 1030
stateno = 1031
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1030, Hit]
type = HitDef
trigger1 = AnimElem = 5
attr = A, ST 
hitflag = M-
priority = 2, Miss
sparkno = -1
hitsound = -1
p1stateno = 1034
p2stateno = 1036
guard.dist = 0
ground.velocity = 0,0
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
ID = 1030
nochainID = 1030

[State 1030, End]
type = ChangeState
trigger1 = AnimElemNo(0) >= 5 && !NumHelper(1030) && !NumHelper(1031)
value = 0
ctrl = 1

; The Black Hole
[Statedef 1031]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7050
sprpriority = -1


[State 1031, Scale]
type = PlaySnd
trigger1 = !Time
value = S7120,0
ignorehitpause = 1

[State 1030, Wave]
type = Helper
trigger1 = Time = 35
name = "Black Hole"
ID = 1031
stateno = 1032
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1031, Scale]
type = AngleDraw
trigger1 = Time = [0, 35]
scale = 0.7 * Time /35.0 , 0.35 * Time /35.0 

[State 1031, Scale]
type = AngleDraw
trigger1 = Time > 35
scale = 0.7 , 0.35

[State 7010, Appear]
type = trans
trigger1 = 1
trans = addalpha
alpha = 128, 128
ignorehitpause = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , NT, ST, HT
ignorehitpause = 1

[State 1031, End]
type = DestroySelf
trigger1 = Time > 80 || !(Parent, StateNo = 1030 || Parent, StateNo = 1034)

; Black Hole second layer
[Statedef 1032]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7050
sprpriority = 0

[State 1031, Scale]
type = VarSet
trigger1 = Time <= 35
V = 0
value = Time
ignorehitpause = 1

[State 1031, Scale]
type = AngleDraw
trigger1 = Time = [0, 35]
scale = 0.7 * Time /35.0 , 0.35 * Time /35.0 

[State 1031, Scale]
type = ChangeState
trigger1 = Time > 70
trigger2 = Root, StateNo != 1030 
trigger2 = Root, StateNo != 1034
trigger2 = Var(0) > 0 
value = 1033

[State 1031, Scale]
type = AngleDraw
trigger1 = Time > 35
scale = 0.7 , 0.35

[State 1031, Pal]
type = PalFX
trigger1 = 1
invertall = 1
time = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

; Black Hole End
[Statedef 1033]
type    = S
movetype= I
physics = N
ctrl = 0


[State 1031, Scale]
type = AngleDraw
trigger1 = !Time
scale = 0.7, 0.35

[State 1031, Scale]
type = AngleDraw
trigger1 = Time
scale = 0.7 * Var(0)/35.0 , 0.35 * Var(0)/35.0

[State 1031, Scale]
type = VarAdd
trigger1 = 1
V = 0
value = -1

[State 1031, Pal]
type = PalFX
trigger1 = 1
invertall = 1
time = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, End]
type = DestroySelf
trigger1 = !Var(0)
ignorehitpause = 1

;Black Hole - Success
[Statedef 1034]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1031
sprpriority = 2
poweradd = 0
velset = 0,0

[State 1034, FollowPlayer]
type = VarSet
trigger1 = !Time
FV = 0
value = Facing * (Target, ScreenPos X - ScreenPos X)
ignorehitpause = 1

[State 1034, Life]
type = TargetLifeAdd
trigger1 = !NumHelper(1030) && !NumHelper(1031)
value = Floor(-110*FVar(39))
ignorehitpause = 1

[State 1034, Super Pause]
type = VarSet
trigger1 = NumHelper(1031)
trigger1 = Helper(1031), StateNo = 1033
FV = 0
value = FVar(0) * 0.95
ignorehitpause = 1

[State 1034, Super Pause]
type = TargetState
trigger1 = NumHelper(1031)
trigger1 = Helper(1031), StateNo = 1033
value = 1037
ignorehitpause = 1
persistent = 0

[State 1034, Super Pause]
type = TargetBind
trigger1 = NumTarget
pos  = FVar(0), 0
ignorehitpause = 1

[State 1034, End]
type = ChangeState
trigger1 = !NumHelper(1030) && !NumHelper(1031)
value = 1035
ctrl = 0
ignorehitpause = 1

;Black Hole End
[Statedef 1035]
type    = S
movetype= A
physics = N
ctrl = 0
sprpriority = 2
poweradd = 0
velset = 0,0

[State 1035, Super Pause]
type = TargetBind
trigger1 = 1
pos  = 50, -40
ignorehitpause = 1

[State 1035, End]
type = ChangeState
trigger1 = Time > 64
value = 0
ctrl = 1
ignorehitpause = 1

; Black Hole - Hit
[Statedef 1036]
type = A
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

; Black Hole - Dragged
[Statedef 1037]
type = A
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
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 16 * Time, 16* Time

[State 802, Exit]
type = Trans 
trigger1 = Time > 16
trans = addalpha
alpha = 0, 256

[State 802, Exit]
type = AngleDraw
trigger1 = Time = [0, 16]
scale = 1 - Time/16.0, 1 - Time/16.0