;===========================================================================
; Standing Moves
;===========================================================================

;---------------------------------------------------------------------------
; Standing Light
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 2                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)
facep2 = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7010
ID = 200
pos = 20, 0
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
damage = 18                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -5, 0              ;X-offset for the "hit spark" rel. to p2,
			;Y-offset for the spark rel. to p1
hitsound = S7040, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 13             ;Time opponent is in hit state
ground.velocity = -0.8             ;Velocity at which opponent is pushed
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -0.8,-.8           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.juggle  = 2
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
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 1
facep2 = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7011
ID = 210
pos = 0, -28
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
damage    = 42
guardflag = M
hitflag = MAF
pausetime = 12,12
sparkno = S7001
sparkxy = -5, -10
hitsound   = S7040,1
guardsound = 6,0
ground.type = High
ground.slidetime = 0
ground.hittime  = 15
ground.velocity = -1.1, -3
air.velocity = -1.1,-3
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
air.juggle  = 4
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
juggle  = 6
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 220
sprpriority = 1
facep2 = 1

[State 220, 1]
type = VelSet
trigger1 = AnimElemNo(0) = 4
X = 1.9

[State 220, 1]
type = VelSet
trigger1 = AnimElemNo(0) > 4
X = 0

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000, 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 7012
ID = 220
pos = 7, -29
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

[State 620, 3]
type = HitDef
trigger1 = !Time
attr = S, NA
damage = 62
guardflag = H
hitflag = MAF
priority = 4
pausetime = 12, 12
sparkno = S7002
sparkxy = -10, -35
hitsound   = S7040,3
guardsound = 6,0
animtype = DiagUp
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -6, -5
air.velocity = -6, -5
air.juggle  = 6
yaccel = 0.4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
fall = 1
fall.recover = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

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
juggle  = 2
poweradd= 0
ctrl = 0
velset = 0,0
anim = 400
sprpriority = 1
facep2 = 1

[State 400, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7010
ID = 200
pos = 20, 3
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

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 20
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = M
pausetime = 8, 8
sparkno = S7000
sparkxy = -5,0
hitsound   = S7040,0
guardsound = 6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 9
ground.velocity = -2
air.velocity = -1.5,-3
air.juggle  = 2
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 400, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
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

[State 410, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000, 1

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7011
ID = 210
pos = 0, -28
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
trigger1 = AnimElem = 3
attr = C, NA
damage    = 39
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 10,10
sparkno = S7001
sparkxy = -9, -5
hitsound   = S7040,2
guardsound = 6,0
ground.type = Low
ground.slidetime = 8
ground.hittime  = 17
ground.velocity = -2
air.velocity = -3,-4
air.juggle  = 4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

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

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,1

[State 420, 2]
type = HitDef
trigger1 = !Time
attr = C, NA
damage    = 56
animtype  = Hard
hitflag = MAF
guardflag = L
pausetime = 20,20
sparkno = -1
hitsound   = S7040,3
fall = 1
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 12
ground.velocity = -4,-1
air.velocity = -4,-1
down.velocity = -5,0
down.hittime = 22
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.juggle  = 6

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 420, 1]
type = VelSet
trigger1 = AnimElem = 2
x = 3.5

[State 420, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7009
ID = 210
pos = 40, 0
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

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
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

[State 620, VelAdd]
type = VelMul
trigger1 = Anim = 600
trigger1 = AnimElemNo(0) < 3
Y = 0.9

[State 620, VelAdd]
type = VelSet
trigger1 = Anim = 600
trigger1 = AnimElem = 3
Y = - 3.2

[State 620, VelAdd]
type = VelAdd
trigger1 = Anim = 600 && AnimElemNo(0) >= 3
trigger2 = Anim != 600
Y = 0.3


[State 200, Explod]
type = Explod
trigger1 = AnimElem = 3
trigger1 = Anim = 600
anim = 7013
ID = 201
pos = 21, -30
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


[State 600, 1]
type = PlaySnd
trigger1 = Time = 1
value = 7000, 0


[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 20
hitflag = MAF
guardflag = HA
priority = 3
pausetime = 7,8
sparkno = S7004
sparkxy = -5, -36
hitsound   =  S7040,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 8
ground.velocity = -4
air.velocity = -1.3,-3
air.hittime = 14
air.juggle  = 2
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

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
facep2 = 1

[State 610, Boom]
type = VelAdd
trigger1 = Anim = 610
trigger1 = AnimElemNo(0) > 1
trigger2 = Anim != 610
Y = 0.5

[State 610, Boom]
type = VelMul
trigger1 = Anim = 610
trigger1 = AnimElemNo(0) = 1
Y = 0.9

[State 610, 1]
type = PlaySnd
trigger1 = Anim = 610
trigger1 = AnimElem = 2
value = S7000, 1

[State 210, Explod]
type = Explod
trigger1 = Anim = 610
trigger1 = AnimElem = 2
anim = 7014
ID = 210
pos = 8, -13
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

[State 610, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 40
hitflag = MAF
guardflag = HA
animtype = Medium
priority = 3
pausetime = 8,8
sparkno = S7007
sparkxy = -10,10
hitsound   = S7040,1
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -0.5, 0
air.velocity = -0.5,3
air.hittime = 14
air.juggle  = 4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
air.fall = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 610, Fall]
type = CtrlSet
trigger1 = Anim = 610
trigger1 = AnimElemTime(3) >= 7
value = 1
persistent = 0

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
anim = 47
sprpriority = 1
velset = 0,0


[State 611, Pos]
type = RemoveExplod
trigger1 = !Time
ID = 411

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
physics = N
juggle  = 7
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
anim = 620
sprpriority = 1
facep2 = 1

[State 210, Explod]
type = Explod
trigger1 = Anim = 620
trigger1 = AnimElem = 2
anim = 7015
ID = 210
pos = 0, 0
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

[State 620, VelAdd]
type = VelMul
trigger1 = Anim = 620
trigger1 = AnimElemNo(0) < 2
Y = 0.9

[State 620, VelAdd]
type = VelAdd
trigger1 = Anim = 620
trigger1 = AnimElem = 2
Y = - 4

[State 620, VelAdd]
type = PlaySnd
trigger1 = Anim = 620
trigger1 = AnimElem = 2
value = S7000,1

[State 620, VelAdd]
type = VelSet
trigger1 = Anim = 620
trigger1 = AnimElem = 2
X = 2

[State 620, VelAdd]
type = VelAdd
trigger1 = Anim = 620 && AnimElemNo(0) >= 2
trigger2 = Anim != 620
Y = 0.4

[State 620, 3]
type = HitDef
trigger1 = !Time
attr = A, NA
damage = 61
hitflag = MAF
guardflag = HA
priority = 4
pausetime = 12,12
sparkno = S7003
sparkxy = 0, 0
hitsound   = S7040,3
guardsound = 6,0
animtype = Med
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -2, 0	
air.velocity = -2, 7
air.juggle  = 7
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
fall = 1
fall.recover = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 610, Fall]
type = ChangeAnim
trigger1 = Anim = 620
trigger1 = !AnimTime
trigger1 = Vel X > 0
value = 42

[State 610, Fall]
type = ChangeAnim
trigger1 = Anim = 620
trigger1 = !AnimTime
trigger1 = Vel X <= 0
value = 41

[State 620, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621


;Jump Strong Landing
[Statedef 621]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 47
sprpriority = 1
velset = 0,0

[State 611, Pos]
type = RemoveExplod
trigger1 = !Time
ID = 421

[State 611, Pos]
type = PosSet
trigger1 = !Time
Y = 0

[State 611, End]
type = ChangeState
trigger1 = Time > 15
value = 0
ctrl = 1

;---------------------------------------------------------------------------

; Cleave
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
value = S7000,1

[State 800, Hit]
type = hitdef
trigger1 = !time
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s7040, 2
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

;Cleave - Push, Jump and Slash
[Statedef 801]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 801
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
velset = 0,0

[State 801, Helper]
type = Helper
trigger1 = !Time
trigger1 = NumTarget
helpertype = normal ;player
name = "Marker"
ID = 800
stateno = 804
pos = Floor(Target, Pos X - Pos X) * Facing , Floor(-Pos Y)
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause =  1
persistent = 0

[State 801, Throw Enemy]
type = VarSet
trigger1 = AnimElem = 2
trigger1 = NumTarget
FV = 0
value = (Target, Pos X - Pos X) * Facing
persistent = 0

[State 801, Throw Enemy]
type = VarSet
trigger1 = AnimElem = 2
trigger1 = NumTarget
FV = 1
value = Target, Const(size.head.pos.y) * 0.8
persistent = 0

[State 801, Throw Enemy]
type = VarSet
trigger1 = AnimElem = 2
trigger1 = NumTarget
FV = 2
value = FVar(1)/20.0 - 0.5 * 0.5 * 20
persistent = 0 

[State 801, Throw Enemy]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N
movetype = A

[State 801, Move]
type = PosAdd
trigger1 = AnimElemNo(0) = 2
X = FVar(0) / 20.0
Y = FVar(2) + 0.5 * AnimElemTime(2)

[State 2022, Move]
type = TargetBind
trigger1 = NumHelper(800)
trigger1 = NumTarget
pos = Floor((Helper(800), Pos X) - Pos X) * Facing , -Pos Y
ignorehitpause = 1

[State 801, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 800, Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7040,1
channel = 0


[State 800, Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = S7040,3
channel = 0

[State 801, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0


[State 802, LifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = -42
kill = Time > 60

[State 802, Shake]
type = EnvShake
trigger1 = AnimElem = 5
time = 5
freq = 120
ampl = 4

[State 801, Throw Enemy]
type = TargetState
trigger1 = AnimElem = 6
value = 803

[State 801, Throw Enemy]
type = TargetDrop
trigger1 = AnimElem = 6

[State 801, Throw Enemy]
type = VelSet
trigger1 = AnimElem = 6
X = -FVar(0)/20.0
Y = -FVar(1)/20.0 - 0.5 * 0.5 * 20

[State 801, Throw Enemy]
type = VelAdd
trigger1 = AnimElemNo(0) = 6
Y = 0.5

[State 801, End]
type = ChangeState
trigger1 = AnimElemNo(0) = 6
trigger1 = Vel Y > 0 && Vel Y > - Pos Y
trigger2 = !NumTarget && AnimElemNo(0) < 6
value = 621
ctrl = 1

;Cleave - Gethit
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

[State 802, LifeAdd]
type = LifeAdd
trigger1 = Time = 37
value = -42
kill = Time > 60

[State 802, Shake]
type = EnvShake
trigger1 = Time = 37
time = 5
freq = 120
ampl = 4

[State 802, Shake]
type = PalFX
trigger1 = Time = 37
add = 200, 200, 200
mul = 256, 256, 256
time = 5


[State 802, Shake]
type = PalFX
trigger1 = Time = 76
add = 200, 200, 200
mul = 256, 256, 256
time = 5

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 802

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Cleave - Air
[Statedef 803]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Vel]
type = VelSet
trigger1 = !Time
y = -6
x = -4

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

[State 803, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 803, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 14
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

;Marker
[Statedef 804]
type = A
physics = N
movetype= I
anim = 7300
ctrl = 0
velset = 0,0
sprpriority = 3

[State 804, Move]
type = PosAdd
trigger1 = Time = [0,12]
X = 2

[State 804, NoShadow]
type = DestroySelf
trigger1 = Parent, StateNo != 801
ignorehitpause = 1

