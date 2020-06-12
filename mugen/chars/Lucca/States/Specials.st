;===========================================================================
; Special Moves
;===========================================================================

;---------------------------------------------------------------------------
;Robot Summon
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 12
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 2110, Buttan]
type = Explod
trigger1 = AnimElem = 2
removetime = -1
ID = 1000
anim = 7055
bindtime = -1
pos = 10, -25
ownpal = 1
sprpriority = 3
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7030,0
ignorehitpause = 1

[State 1020, Robot]
type = VarSet
trigger1 = AnimElem = 2
V = 1
value = EnemyNear, ID
persistent = 0

[State 1020, Robot]
type = Helper
trigger1 = AnimElem = 2
name = "Robot"
ID = 1000
stateno = 1001 + 2 * Var(0)
pos = floor(IfElse(Facing > 0, - ScreenPos X - 20, -(GameWidth - ScreenPos X + 20))), IfElse(Var(0) = 0, -10, 0)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2000, End]
type = RemoveExplod
trigger1 = !AnimTime
ID = 1000
ignorehitpause = 1

[State 1040, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Bit
[Statedef 1001]
movetype = I
type = A
physics = N
anim = 7030
sprpriority = -1

[State 1001, Override]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 1002
time = 1
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 200, Dampen]
Type=ParentVarSet
Trigger1 = Var(2)
fvar(39) = Parent, fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 0
value = Parent, Var(1)

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 2
value = 0


[State 1011, Vel]
type = VelSet
trigger1 = !Var(1)
X = Facing * IfElse(ScreenPos X > PlayerID(Var(0)), ScreenPos X, -2, 2)
Y = 0.2 * Sin (Time / 20.0)

[State 1011, Missile]
type = ChangeAnim
trigger1 = Abs(ScreenPos X - PlayerID(Var(0)), ScreenPos X) < 30
trigger1 = Anim = 7030
trigger1 = !Var(1)
trigger1 = Var(1) := 1
value = 7031

[State 1020, Robot]
type = Helper
trigger1 = Anim = 7031
trigger1 = AnimElem = 3
name = "Missile"
ID = 1000
stateno = 1007
pos = 0, -10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0


[State 1011, Stop]
type = VelSet
trigger1 = Anim = 7031
X = 0
Y = 0
ignorehitpause = 1

[State 1011, Stop]
type = ChangeAnim
trigger1 = Anim = 7031
trigger1 = !AnimTime
value = 7030
ignorehitpause = 1

[State 1011, Stop]
type = VelSet
trigger1 = Anim = 7030
trigger1 = Var(1)
X = 0
Y = -3
ignorehitpause = 1

[State 1011, Destroy]
type = DestroySelf
trigger1 = Var(1)
trigger1 = Anim = 7030
trigger1 = ScreenPos Y < - 20

;Bit GetHit
[Statedef 1002]
type = A
movetype = H
anim = 7030
velset = 0, 0

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = -15, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1


[State 1002, Invis]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * Time, 16 * Time
ignorehitpause = 1

[State 1002, Immune]
type = DestroySelf
trigger1 = Time > 16
ignorehitpause = 1

;Debuggest
[Statedef 1003]
movetype = A
type = S
physics = N
anim = 7032
sprpriority = -1

[State 1001, Override]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 1004
time = 1
ignorehitpause = 1

[State 200, Dampen]
Type=ParentVarSet
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 0
value = Parent, Var(1)

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1011, Vel]
type = VelSet
trigger1 = !Var(1) 
trigger1 = Anim = 7032 
X = IfElse(AnimElemNo(0) != 1, Facing * IfElse(ScreenPos X > PlayerID(Var(0)), ScreenPos X, -3, 3), 0)

[State 1011, Missile]
type = ChangeAnim
trigger1 = Abs(ScreenPos X - PlayerID(Var(0)), ScreenPos X) < 20
trigger1 = Anim = 7032
trigger1 = !Var(1)
trigger1 = Var(1) := 1
value = 7033

[State 1011, Stop]
type = VelSet
trigger1 = Anim = 7033
X = 0
Y = 0
ignorehitpause = 1

[State 2000, HitDef]
type = HitDef
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
attr = S, SA
damage = Floor(31 * Root, FVar(39)),3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,19
sparkno = -1
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
air.fall = 0
fall = 0
fall.recover = 1
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

[State 1011, Stop]
type = ChangeAnim
trigger1 = Anim = 7033
trigger1 = !AnimTime
value = 7032
ignorehitpause = 1

[State 1011, Stop]
type = Turn
trigger1 = Anim = 7032
trigger1 = Var(1)
trigger1 = (ScreenPos X > GameWidth/2 && Facing < 0) || (ScreenPos X < GameWidth/2 && Facing > 0)
persistent = 0
ignorehitpause = 1

[State 1011, Stop]
type = VelSet
trigger1 = Anim = 7032
trigger1 = Var(1)
X =  IfElse(AnimElemNo(0) != 1, 2, 0)
ignorehitpause = 1

[State 1011, Destroy]
type = ChangeState
trigger1 = MoveReversed
value = 1004
ignorehitpause = 1

[State 1011, Destroy]
type = DestroySelf
triggerall = Var(1)
triggerall = Anim = 7032
trigger1 = FrontEdgeBodyDist < -20
trigger2 = BackEdgeBodyDist < -20

;Debuggest GetHit
[Statedef 1004]
type = S
movetype = H
anim = 7034
velset = 0, 0

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = -15, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1


[State 1002, Invis]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * Time, 16 * Time
ignorehitpause = 1

[State 1002, Immune]
type = DestroySelf
trigger1 = Time > 16
ignorehitpause = 1

;Proto-4
[Statedef 1005]
movetype = A
type = S
physics = N
anim = 7035
sprpriority = -1

[State 1011, Stop]
type = Sprpriority
trigger1 = 1
value = -1
ignorehitpause = 1

[State 1001, Override]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 1006
time = 1
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 0
value = Parent, Var(1)

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 2
value = Random % 2

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 3
value = 0

[State 1011, Vel]
type = VelSet
trigger1 = !Var(1) 
trigger1 = Anim = 7035 
X = Facing * IfElse(ScreenPos X > PlayerID(Var(0)), ScreenPos X, -3, 3)

[State 1011, Missile]
type = ChangeAnim
triggerall = Anim = 7035
trigger1 = Var(2) > 0
trigger1 = Abs(ScreenPos X - PlayerID(Var(0)), ScreenPos X) < 20
trigger1 = !Var(1)
trigger1 = Var(1) := 1
trigger2 = Var(2) = 0
trigger2 = Time > 30
trigger2 = !Var(1)
trigger2 = Var(1) := 1
value = 7036 + Var(2)

[State 1011, Stop]
type = VelSet
trigger1 = Anim > 7035
X = 0
Y = 0
ignorehitpause = 1

[State 200, Dampen]
Type=ParentVarSet
Trigger1 = Var(3)
trigger2 = MoveHit
fvar(39) = Parent, fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1020, Robot]
type = Helper
trigger1 = Anim = 7036
trigger1 = AnimElem = 2
name = "Missile"
ID = 1001
stateno = 1008
pos = 10, -10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2000, HitDef]
type = HitDef
trigger1 = Anim = 7037
attr = S, SA
damage = Floor(61 * Root, FVar(39)),3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,19
sparkno = -1
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
air.fall = 0
fall = 0
fall.recover = 1
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
persistent = 0


[State 1011, Stop]
type = ChangeAnim
trigger1 = Anim = 7036 || Anim = 7037
trigger1 = !AnimTime
value = 7035
ignorehitpause = 1

[State 1011, Stop]
type = Turn
trigger1 = Anim = 7035
trigger1 = Var(1)
trigger1 = (ScreenPos X > GameWidth/2 && Facing < 0) || (ScreenPos X < GameWidth/2 && Facing > 0)
persistent = 0
ignorehitpause = 1

[State 1011, Stop]
type = VelSet
trigger1 = Anim = 7035
trigger1 = Var(1)
X =  2
ignorehitpause = 1

[State 1011, Destroy]
type = ChangeState
trigger1 = MoveReversed
value = 1006
ignorehitpause = 1

[State 1011, Destroy]
type = DestroySelf
triggerall = Var(1)
triggerall = Anim = 7035
trigger1 = FrontEdgeBodyDist < -20
trigger2 = BackEdgeBodyDist < -20

;Proto-4 GetHit
[Statedef 1006]
type = S
movetype = H
anim = 7037
velset = 0, 0
sprpriority = -2

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = -15, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1

[State 1002, Invis]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * Time, 16 * Time
ignorehitpause = 1

[State 1002, Immune]
type = DestroySelf
trigger1 = Time > 16
ignorehitpause = 1

; Vertical Missile
[Statedef 1007]
type    = A
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7039
sprpriority = 2
velset = 0.7, -4.7

[State 1001, Explod]
type = VelAdd
trigger1 = 1
Y = 0.2

[State 1001, Explod]
type = AngleDraw
trigger1 = Vel X != 0
value = 180 + (90  - 180.0*ATan(Vel Y / Vel X)/Pi)

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1009
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1001, HitDef]
type = HitDef
trigger1 = !Time
trigger1 = !var(0)
attr = A, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
priority = 4, Hit
sparkno = -1
damage = Floor(52 * Root, FVar(39)),7
hitsound = S2,1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.52, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = -4, -1
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = IfElse(Root, Var(21) > 0, 0, 144), IfElse(Root, Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add= 128, 100, 7
palfx.mul=256,256,256
palfx.time = 8

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1001, ChangeState]
type = ChangeState
trigger1 = HitCount > 0
trigger2 = Pos Y > - Vel Y && Vel Y > 0
value = 1009
ctrl = 0

; Horizontal Missile
[Statedef 1008]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7040
sprpriority = 2
velset = 4, 0

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1009
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1001, HitDef]
type = HitDef
trigger1 = !Time
trigger1 = !var(0)
attr = S, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
priority = 4, Hit
sparkno = -1
damage = Floor(72 * Root, FVar(39)),7
hitsound = S2,1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.52, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = -4, -1
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = IfElse(Root, Var(21) > 0, 0, 144), IfElse(Root, Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add= 128, 100, 7
palfx.mul=256,256,256
palfx.time = 8

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
var(3) = 1
persistent = 0
ignorehitpause = 1

[State 1001, ChangeState]
type = ChangeState
trigger1 = HitCount > 0
trigger2 = Pos Y > - Vel Y && Vel Y > 0
value = 1009
ctrl = 0


; Missile Explosion
[Statedef 1009]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 7200
sprpriority = 2
velset = 0, 0

[State 1002, Explod]
type = Explod
trigger1 = !Time
anim = 7002
ID = 1002
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1002, End]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1



;---------------------------------------------------------------------------
;Fire Uppercut
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 12
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 200, Dampen]
Type=VarSet
trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1010, Pal]
type = PalFx
trigger1 = Time = [0, 16]
time = 1
add = 9 * Time, 4 * Time, Time/2
mul = 256, 256, 256
ignorehitpause = 1

[State 1010, Pal]
type = PalFx
trigger1 = Time >= 16
time = 1
add = 144, 64, 7
mul = 256, 256, 256
ignorehitpause = 1

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
trigger1 = AnimElem = 2
value = S7000,1
ignorehitpause = 1

[State 1040, End]
type = ChangeAnim
trigger1 = MoveContact 
value = 1010
elem = 3
persistent = 0
ignorehitpause = 1

[State 1250, Hit]
type = HitDef
trigger1 = animelem = 2 
attr = S, SA
damage = IfElse(var(0) = 2, 82, IfElse(var(0) = 1, 72, 62)), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 7
sparkno = s7001
sparkxy = -10, -25
hitsound = s7050,2
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, IfElse(var(0) = 2, -7.5, IfElse(var(0) = 1, -6.5, -5))
air.type = Low
air.velocity = -2, IfElse(var(0) = 2, -7.5, IfElse(var(0) = 1, -6.5, -5))
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 120
yaccel = 0.3
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
palfx.add = 144, 64, 7
palfx.mul = 256,256,256
palfx.time = 8

[State 1010, Pal]
type = VelSet
trigger1 = Time = 6
X = -1
ignorehitpause = 1

[State 1010, Pal]
type = VelAdd
trigger1 = AnimElem = 2
X = 3
ignorehitpause = 1

[State 1020, Grenade]
type = Helper
trigger1 = AnimElem = 2
name = "Fire"
ID = 1010
stateno = 1011
pos = 15, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1010, Pal]
type = PalFx
trigger1 = AnimElemNo(0) = 3
time = 1
add = 144 - 9 * AnimElemTime(3), 64 - 4 * AnimElemTime(3), 7 - AnimElemTime(3)/2
mul = 256, 256, 256
ignorehitpause = 1

[State 1040, End]
type = PalFx
trigger1 = !AnimTime
time = 1
add = 0,0,0
mul = 256, 256, 256

[State 1040, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;The Fire
[Statedef 1011]
movetype = I
type = A
anim = 7013
sprpriority = 4

[State 1011, Pos]
type = VarSet
trigger1 = !Time
v = 0
value = Parent, Var(0)

[State 1011, Explod]
type = Explod
trigger1 = Time % 3 = 0
;trigger1 = AnimElemNo(0) >= 5
anim = 7014
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

[State 1011, Vel]
type = VelSet
trigger1 = !Time
Y = - 3

[State 1011, Vel]
type = VelSet
trigger1 = 1
X = IfElse(Parent, Vel X > 0.2, Parent, Vel X, 0.2)

[State 1011, Vel]
type = VelAdd
trigger1 = 1
Y = 0.2

[State 1011, Destroy]
type = DestroySelf
trigger1 = Vel Y >= 0

;---------------------------------------------------------------------------
; Napalm
[Statedef 1020]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 72
ctrl = 0
anim = 1020
sprpriority = 1
facep2 = 1
velset = 0,0

[State 1020, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcfc", 2, ifelse(command = "qcfb", 1, 0))

[State 1020, Grenade]
type = Helper
trigger1 = AnimElem = 3
name = "Napalm Grenade"
ID = 1020
stateno = 1021
pos = 6,-27
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Napalm Grenade
[Statedef 1021]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7009
sprpriority = 4

[State 200, Dampen]
Type=ParentVarSet
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 1021, Strength]
type = VarSet
trigger1 = !Time
trigger1 = !(var(1) := 0)
var(0) = parent, var(0)

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1023
ignorehitpause = 1

[State 1020, Strength]
type = AngleDraw
trigger1 = 1
value = IfElse(var(0) = 2, -12 * Time, IfElse(var(0) = 1, 3 * Time , 22 * Time))

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, PosSet]
type = PosSet
trigger1 = parent, AnimElemNo(0) = 3 && parent, StateNo = 1020
X = Parent, Pos X - 2
Y = Parent, Pos Y - 27
persistent = 0

[State 1021, Vel]
type = VelSet
trigger1 = parent, AnimElemTime(3) = 0 && parent, StateNo = 1020
x =  IfElse(var(0) = 2, 5.5, IfElse(var(0) = 1, 4, 5)) * Cos(IfElse(var(0) = 2, 0.5 ,IfElse(var(0) = 1, 0.78, 1.4)))
y = -IfElse(var(0) = 2, 5.5, IfElse(var(0) = 1, 4, 5)) * Sin(IfElse(var(0) = 2, 0.5 ,IfElse(var(0) = 1, 0.78, 1.4)))


[State 1021, DoneVar]
type = VarSet
trigger1 = parent, AnimElemTime(3) = 0 && parent, StateNo = 1020
var(1) = 1

[State 1021, Gravity]
type = VelAdd
trigger1 = var(1)
y = IfElse(var(0) = 0, 0.2, 0.2)

[State 1021, Air]
type = PlaySnd
trigger1 = var(1)
value = S7000,1
persistent = 0

[State 1021, Air]
type = StateTypeSet
trigger1 = var(1)
statetype = S
movetype = A
physics = N
persistent = 0

[State 1021, HitDef]
type = HitDef
trigger1 = var(1)
attr = S, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
sparkno = S7000
damage = Floor(5 * Root, FVar(39)),0
sparkxy = -10, 0 
hitsound = S220,1
ground.type = High
ground.slidetime = 5
ground.hittime = 5
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = 0, 0
numhits = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 18, 36)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 4
persistent = 0

[State 1021, ChangeState]
type = DestroySelf
trigger1 = (parent, StateNo != 1020 && !var(1)) 
ignorehitpause = 1

[State 1021, ChangeState]
type = VarSet
trigger1 = !Time
v = 2
value = 0
ignorehitpause = 1

[State 1021, ChangeState]
type = VarSet
trigger1 = MoveHit
v = 2
value = 1
ignorehitpause = 1

[State 1021, ChangeState]
type = ChangeState
trigger1 = MoveHit
trigger2 = Vel Y >= 0 && Pos Y > - Vel Y
value = 1022
ctrl = 0
ignorehitpause = 1

;Exploding by hitting enemy or ground
[Statedef 1022]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 7007
sprpriority = 4
velset = 0,0

[State 200, Dampen]
Type=ParentVarSet
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 1022, Anim]
type = PlaySnd
trigger1 = !Time
value = S7020,7
ignorehitpause = 1

[State 1022, Anim]
type = ChangeAnim
trigger1 = Var(2) && Pos Y < - 15
value = 7010
ignorehitpause = 1

[State 1022, Anim]
type = PosSet
trigger1 = Anim = 7007
Y = 0
ignorehitpause = 1

[State 1021, HitDef]
type = HitDef
trigger1 = !Time
attr = S, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
sparkno = -1
damage = Floor(82 * Root, FVar(39)),0
pausetime = 0, 20
hitsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.5, -3
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity =  -2.5, -3
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = 0, 0
givepower = 36, 36
palfx.add = 144, 64, 7
palfx.mul = 256,256,256
palfx.time = 16
persistent = 0

[State 1022, Explod]
type = Explod
trigger1 = NumExplod(1020) < 3
trigger1 = Time % 3
trigger1 = Time < 22
anim = 7008
ID = 1020
pos = IfElse(Anim = 7007, 25 - Random % 50, 25 - Random % 50), IfElse(Anim = 7007, 5 - Random % 15, 25 - Random % 50)
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0, 0
accel = 0,0
removetime = -2
scale = 1 , 1
sprpriority = 4
ontop = 0
ownpal = 1
removeongethit = 0

[State 1022, PosSet]
type = VelSet
trigger1 = 1
y = 0
x = 0

[State 1021, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1021, Scale]
type = AngleDraw
trigger1 = 1
value = 1
scale = Time/33.0, Time/33.0
;ignorehitpause = 
;persistent = 

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S2,2
channel = 0

[State 1021, Trans]
type = Trans
trigger1 = Time = [0,20]
trans = add

[State 1021, Trans]
type = Trans
trigger1 = Time != [0,20]
trans = addalpha
alpha = 256 - 16 * (Time - 20), 256

[State 1021, End]
type = DestroySelf
trigger1 = Time >= 36

;Exploding by getting hit
[Statedef 1023]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 7010
sprpriority = 4
velset = 0,0

[State 1022, Anim]
type = PlaySnd
trigger1 = !Time
value = S7020,7
ignorehitpause = 1

[State 200, Dampen]
Type=ParentVarSet
trigger1 = MoveHit
fvar(39) = Parent, fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 1021, HitDef]
type = HitDef
trigger1 = !Time
attr = S, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
sparkno = S7001
damage = Floor(82 * Root, FVar(39)),0
sparkxy = -10,-15
hitsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.52, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = 0, 0
givepower = 36, 36
palfx.add = 144, 64, 7
palfx.mul = 256,256,256
palfx.time = 16
persistent = 0

[State 1022, Explod]
type = Explod
trigger1 = NumExplod(1020) < 3
trigger1 = Time % 3
trigger1 = Time < 22
anim = 7008
ID = 1020
pos = 25 - Random % 50, 25 - Random % 50
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0, 0
accel = 0,0
removetime = -2
scale = 1 , 1
sprpriority = 4
ontop = 0
ownpal = 1
removeongethit = 0

[State 1022, PosSet]
type = VelSet
trigger1 = 1
y = 0
x = 0

[State 1021, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1021, Scale]
type = AngleDraw
trigger1 = 1
value = 1
scale = Time/33.0, Time/33.0
;ignorehitpause = 
;persistent = 

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S2,2
channel = 0

[State 1021, Trans]
type = Trans
trigger1 = Time = [0,20]
trans = add

[State 1021, Trans]
type = Trans
trigger1 = Time != [0,20]
trans = addalpha
alpha = 256 - 16 * (Time - 20), 256

[State 1021, End]
type = DestroySelf
trigger1 = Time >= 36

;---------------------------------------------------------------------------
; Hypno Wave
[Statedef 1030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
sprpriority = 1
facep2 = 1
velset = 0,0
poweradd = -500

[State 1030, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = S7050,1
channel = 0

[State 1030, Jump]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 1030, Wave]
type = Helper
trigger1 = AnimElem = 2
name = "Hypno Wave"
ID = 1030
stateno = 1031
pos = 0, -20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1030, Hit]
type = HitDef
trigger1 = AnimElem = 4
attr = S, ST 
hitflag = M-
priority = 2, Miss
sparkno = -1
hitsound = s7010, 0
p1stateno = 1033
p2stateno = 1034
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
trigger1 = AnimElemNo(0) >= 4 && !NumHelper(1030)
value = 0
ctrl = 1

; The Hypno Wave itself
[Statedef 1031]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7011
sprpriority = 4

[State 1031, PosSet]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 1032
trigger1 = !(var(1) := 0)
var(0) = parent, var(0)
ignorehitpause = 1

[State 1031, PosSet]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

[State 7010, Appear]
type = trans
trigger1 = var(1) <= 16
trans = addalpha
alpha = 16 * var(1), 256 - 8 * var(1)
ignorehitpause = 1

[State 7010, Trans]
type = trans
trigger1 = var(1) >= 16
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = , AA, AP, AT
stateno = 1032
ignorehitpause = 1

[State 1031, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , NT, ST, HT
ignorehitpause = 1

[State 1031, PosSet]
type = PosSet
trigger1 = Parent, StateNo = 1030
X = Parent, Pos X
Y = Parent, Pos Y - 24
ignorehitpause = 1

[State 1031, End]
type = ChangeState
trigger1 = Time = 80 || !(Parent, StateNo = 1030)
value = 1032

[State 1031, End]
type = DestroySelf
trigger1 = Parent, StateNo != 1030
trigger1 = Parent, StateNo != 1033
ignorehitpause = 1


; Hypno Wave End
[Statedef 1032]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7011
sprpriority = 4

[State 7010, Freeze]
type = PosFreeze
trigger1 = 1


[State 7010, Trans]
type = trans
trigger1 = Time <= 20
trans = addalpha
alpha = 256, 128
ignorehitpause = 1


[State 7010, Trans]
type = trans
trigger1 = Time > 20
trans = addalpha
alpha = 256 - 16 * (Time - 20) , 128 + 8 * (Time - 20)
ignorehitpause = 1

[State 1031, PosSet]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y - 24
ignorehitpause = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, End]
type = DestroySelf
trigger1 = Time >= 36
trigger2 = Parent, StateNo != 1030
trigger2 = Parent, StateNo != 1033
ignorehitpause = 1

; Successful Hypno Wave
[Statedef 1033]
type = S
physics = N
movetype = I
velset = 0,0
ctrl = 0
anim = 1031

[State 1032, Anim]
type = Explod
trigger1 = NumTarget(1030) && Target(1030), Anim = 5110
anim = 7012
ID = 1030
postype = p1
pos = Facing * (Target(1030), Pos X - Pos X) + Target(1030), Const(size.height)/2 , (Target(1030), Pos Y - Pos Y) - 30
removetime = -1;300
facing = Facing
sprpriority = 3
removeongethit = 0
ownpal = 1
persistent = 0

[State 1032, Self]
type = ChangeState
trigger1 = Time > 90
value = 0
ctrl = 1

; Get Hit - Ground
[Statedef 1034]
type = S
physics = N
movetype = H
velset = 0,0

[State 1032, Anim]
type = PlayerPush
trigger1 = 1
value= 0

[State 1032, Anim]
type = ChangeAnim2
trigger1 = !Time
value= 1032

[State 1032, Self]
type = ChangeAnim
trigger1 = Anim = 1032 && !AnimTime
trigger1 = SelfAnimExist(5110)
value = 5110

[State 1032, Self]
type = ChangeAnim2
trigger1 = Anim = 1032 && !AnimTime
trigger1 = !SelfAnimExist(5110)
value = 5110

[State 1032, End]
type = SelfState
trigger1 = Time > 240
value = 5120

;---------------------------------------------------------------------------
