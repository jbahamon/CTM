;===========================================================================
; Standing Moves
;===========================================================================

;---------------------------------------------------------------------------
; Standing Light
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 3                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)
facep2 = 1

[State 200, VelSet]
type = Velset
trigger1 = Var(21) > 0
x = 2.8

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 200
pos = 10, -5
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

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = IfElse(Var(21) > 0, 17, 20)                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -10, -15               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7020, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-.8           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Mid
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 2
facep2 = 1

[State 210, VelSet]
type = Velset
trigger1 = Var(21) > 0
x = 2.8

[State 210, Vel]
type = VelAdd
trigger1 = AnimElem = 2 || AnimElem = 4
x = 2

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 4
value = S7000, 0

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2 || AnimElem = 4
anim = 7021
ID = 210
pos = 10, 0
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

[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = IfElse(Var(21) > 0, 16, 21)
guardflag = M
hitflag = MAF
pausetime = 12,12
sparkno = S7007
sparkxy = -10, 0
hitsound   = S7040,1
guardsound = 6,0
ground.type = High
ground.slidetime = 0
ground.hittime  = 20
ground.velocity = -.5
air.velocity = -.5,-.5
forcenofall = 1
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 18, 18
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 210, Hit2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
animtype  = Medium
damage    = 20
guardflag = M
hitflag = MAF
pausetime = 10,10
sparkno = S7007
sparkxy = -10, 0
hitsound   = S7040,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -3
air.velocity = -3,-1
forcenofall = 1
ground.cornerpush.veloff = 0;
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 18, 18
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 210, 4]
type = SprPriority
trigger1 = AnimElem = 5
value = 2

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong
[Statedef 220]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 220
sprpriority = 1
facep2 = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 220, VelSet]
type = Velset
trigger1 = Var(21) > 0
x = 2.8

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem= 3
value = S7000, 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7022
ID = 220
pos = 20, 4
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

[State 220, 2]
type = HitDef
trigger1 = Animelem = 2
attr = S, NA
animtype  = Hard
damage    = IfElse(Var(21) > 0, 42, 62)
guardflag = HA
hitflag = MAF
pausetime = 12,12
sparkno = S7002
sparkxy = -10, 4
hitsound   = S7020,3
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 17
ground.velocity = -4
air.velocity = -4,-2
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Crouching Moves
;===========================================================================

;---------------------------------------------------------------------------
;Crouching Light
[Statedef 400]
type    = C
movetype= A
physics = C
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 400
sprpriority = 2
facep2 = 1

[State 400, VelSet]
type = Velset
trigger1 = Var(21) > 0
x = 2.8

[State 400, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7010, 1

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 11
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = M
pausetime = 8, 8
sparkno = S7000
sparkxy = -10,-10
hitsound   = S7040,0
guardsound = 6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 9
ground.velocity = -1.3
air.velocity = -1.3,-3
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -1.3
air.cornerpush.veloff = -1.3

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 400, 3]
type = CtrlSet
trigger1 = Time = 6
value = 1

[State 400, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11

;---------------------------------------------------------------------------
;Crouching Mid
[Statedef 410]
type    = C
movetype= A
physics = C
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 410
sprpriority = 1
facep2 = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 410, VelSet]
type = Velset
trigger1 = Var(21) > 0
x = 2.8

[State 410, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 410, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 2
y = 0
ignorehitpause = 1

[State 610, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7023
ID = 610
pos = 20, 5
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

[State 410, 2]
type = HitDef
trigger1 = AnimElem = 2
attr = C, NA
damage    = 40
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 10,10
sparkno = S7001
sparkxy = -15,-4
hitsound   = S7020,2
guardsound = 6,0
ground.type = Low
ground.slidetime = 8
ground.hittime  = 17
ground.velocity = -2
air.velocity = -3,-4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 410, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouching Strong
; CNS difficulty: easy
[Statedef 420]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= IfElse(Var(21) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 420
sprpriority = 1
facep2 = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 420, VelSet]
type = Velset
trigger1 = Var(21) > 0
x = 2.8

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1

[State 420, VelAdd]
type = VelAdd
trigger1 = Anim = 420
trigger1 = AnimElem = 3
x = 3
y = 0
ignorehitpause = 1

[State 420, StateTypeSet]
type = StateTypeSet
trigger1 = Anim = 420
trigger1 = AnimElem = 3
statetype = A
physics = N
ignorehitpause = 1

[State 420, 2]
type = HitDef
trigger1 = !Time
attr = C, NA
damage    = 58
animtype  = Hard
hitflag = MAF
guardflag = L
pausetime = 20,20
sparkno = S7008
sparkxy = -5,-15
hitsound   = S7020,4
fall = 1
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 12
ground.velocity = -1,-2
air.velocity = -1,-3
down.velocity = -5,0
down.hittime = 22
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 420, ChangeAnim]
type = ChangeAnim
trigger1 = MoveHit || Time = 30
trigger1 = Anim = 420
elem = 1
value = 11

[State 420, StateTypeSet]
type = StateTypeSet
trigger1 = Anim = 11
trigger1 = AnimElem = 1
statetype = C
physics = C
ignorehitpause = 1

[State 420, 3]
type = ChangeState
trigger1 = Anim = 11
trigger1 = Time >= 25
value = 11
ctrl = 1

;===========================================================================
; Air Moves
;===========================================================================

;---------------------------------------------------------------------------
;Jump Light
[Statedef 600]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= 0
ctrl = 0
anim = 600
sprpriority = 1
facep2 = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 600, 1]
type = PlaySnd
trigger1 = Time = 1
value = 7000, 0

[State 600, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 600
pos = 10, -5
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

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 20
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 7,8
sparkno = S7000
sparkxy = -10,-18
hitsound   =  S7020,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 8
ground.velocity = -4
air.velocity = -1.3,-3
air.hittime = 14
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 600, 3]
type = CtrlSet
trigger1 = Time = 17
value = 1

;---------------------------------------------------------------------------
;Jump Mid
[Statedef 610]
type    = A
movetype= A
physics = N
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
anim = 610
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 610, 2]
type = PlaySnd
trigger1 = Time = 2
value = S7000, 0

[State 610, Set]
type = Varset
trigger1 = !Time
var(0) = Vel X > 0

[State 610, Vel]
type = VelSet
trigger1 = !Time && Var(0)
X = 0
Y = 0

[State 610, VelAdd]
type = VelAdd
trigger1 = !Var(0)
Y = 0.49

[State 610, VelAdd]
type = VelSet
trigger1 = AnimElemTime(2) = 0 && Var(0)
x = 5
y = 5

[State 610, Explod]
type = Explod
trigger1 = AnimElem = 2
trigger1 = Vel X >2
anim = 7023
ID = 610
pos = 30, 5
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

[State 610, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 40
hitflag = MAF
guardflag = HA
priority = 4
pausetime = 12,12
sparkno = S7001
sparkxy = -13,0
hitsound   = S7020,2
guardsound = 6,0
animtype = Med
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -5
air.velocity = -5,-4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 610, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 611

;Jump Mid Landing
[Statedef 611]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 131
sprpriority = 1
velset = 0,0

[State 611, Pos]
type = PosSet
trigger1 = !Time
Y = 0

[State 611, End]
type = ChangeState
trigger1 = Time > 10
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Jump Strong
; CNS difficulty: easy
[Statedef 620]
type    = A
movetype= A
physics = A
juggle  = 8
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
anim = 620
sprpriority = 1
facep2 = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 630, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 620, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7022
ID = 620
pos = 22, -5
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

[State 630, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 60
hitflag = MAF
guardflag = HA
priority = 3
pausetime = 8,8
sparkno = S7002
sparkxy = -13,0
hitsound   = S7020,3
guardsound = 6,0
fall = 1
ground.type = High
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -4
air.velocity = -2,-3
air.hittime = 14
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

;---------------------------------------------------------------------------
;Boulder Toss
[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 800
sprpriority = 2
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Pal]
type = PalFX
trigger1 = 1
add = Floor(32 * Sin(Time * Pi/16.0)) + 32, 32 + Floor(32 * Sin(Time * Pi/16.0)), 32 + Floor(32 * Sin(Time * Pi/16.0))
mul = 256, 256, 256
time = 1

[State 800, Direction]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "holdback", -1, 1)

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7010,0

[State 800, Hit]
type = hitdef
trigger1 = !time
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s7000, 0
p1facing = 1
p2facing = var(0)
p1stateno = 801
p2stateno = 802
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Boulder Toss - Throw
[Statedef 801]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 801
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
velset = 0,0

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemTime(5) < 3
pos = 15, 0

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemTime(5) = [3,5]
pos = 10, -5

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemTime(5) = [6,8]
pos = 5, -10

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 9 && AnimElemTime(6) < 0
pos = 1, -15

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemNo(0) = 6
pos = 1, -25

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemNo(0) = 7
pos = 1, -30

[State 801, Throw Enemy]
type = TargetState
trigger1 = AnimElem = 8
value = 803

[State 801, Sound]
type = Turn
trigger1 = (var(0) < 0) && AnimElem = 6

[State 801, Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = S7010,1

[State 801, Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = S7000,2

[State 801, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Boulder Toss - Gethit
[Statedef 802]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 802, Priority]
type = SprPriority
trigger1 = AnimElem = 3
value = 2

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 802

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Boulder Toss - Air
[Statedef 803]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Vel]
type = VelSet
trigger1 = !Time
y = -9
x = -2

[State 803, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 803, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 803

[State 803, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 804

[State 803, Life]
type = LifeAdd
trigger1 = (Vel y > 0) && (Pos y >= - Vel Y)
value = -75

[State 803, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= - Vel Y)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 803, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= - Vel Y)
time = 14
freq = 120
ampl = 4

[State 803, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= - Vel Y)
y = 0

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= - Vel Y)
value = 5100
ctrl = 0


