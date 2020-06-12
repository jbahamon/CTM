;===========================================================================
; Standing Moves
;===========================================================================

;---------------------------------------------------------------------------
; Standing Light
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 4                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0.5,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 25, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -10, -30               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S0,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
getpower = IfElse(Var(22) > 0, 0, 72), IfElse(Var(22) > 0, 0, 36)
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
value = S3, 2
channel = 0

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
poweradd= IfElse(Var(22) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 2

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7053
ID = 210
pos = 23, -23
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = 14
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1


[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 54
guardflag = M
hitflag = MAF
pausetime = 16,16
sparkno = S7005
sparkxy = -20, -23
hitsound   = S0,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -2
air.velocity = -2,-.5
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 44, 101)), IfElse(Var(22) > 0, 0, 32)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16

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
juggle  = 8
poweradd= IfElse(Var(22) > 0 && PrevStateNo != 7960, 0, 18)
ctrl = 0
sprpriority = 1

[State 220, Anim]
type = VarSet
trigger1 = !Time
V = 23
value = 220
ignorehitpause = 1

[State 220, Anim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 7960
value = 220

[State 220, Push]
type = HitOverride
trigger1 = AnimElemNo(0) = [2, 3]
stateno = 7960
attr = SCA, AA, AP
time = 1
ignorehitpause = 1

[State 220, Push]
type = NotHitBy
trigger1 = AnimElemNo(0) = [2, 3]
value = , AT
time = 1
ignorehitpause = 1

[State 220, Push]
type = VelSet
trigger1 = AnimElem = 4
X = 2

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem= 4
value = S3, 0
channel = 0

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 7022
ID = 220
pos = 25, 0
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
trigger1 = Animelem = 4
attr = S, NA
animtype  = Hard
damage    = 82
hitflag = MAF
guardflag = HA
pausetime = 16,16
sparkno = S7002
sparkxy = -10, 4
hitsound   = S0,2
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 17
ground.velocity = -5, -4
air.velocity = -5,-4
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 62, 134)), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16
fall = 1
ground.cornerpush.veloff = -3;
air.cornerpush.veloff = -3;

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
juggle  = 5
poweradd= 0
ctrl = 0
velset = 0,0
anim = 400
sprpriority = 2

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 400, 1]
type = PlaySnd
trigger1 = !Time
value = S7, 0
channel = 0

[State 400, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7052
ID = 400
pos = 0,-15
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
ownpal = 1
removeongethit = 1
;ignorehitpause = 
;persistent = 


[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 19
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
ground.velocity = -2
air.velocity = -1.5,-3
getpower = IfElse(Var(22) > 0, 0, 72), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2

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
juggle  = 6
poweradd= IfElse(Var(22) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 410
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 410, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 410, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 2.5
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
damage    = 45
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 10,10
sparkno = S7001
sparkxy = -15,-4
hitsound   = S0,3
guardsound = 6,0
ground.type = Low
ground.slidetime = 8
ground.hittime  = 17
ground.velocity = -2
air.velocity = -3,-4
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(22) > 0, 0, 36)
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
juggle  = 8
poweradd= IfElse(Var(22) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 420
sprpriority = 1

[State 420, Bomb]
type = Helper
trigger1 = AnimElem = 2
name = "Bomb"
ID = 420
stateno = 421
pos = 0,-20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S2,0
channel = 0

[State 420, VelAdd]
type = VelAdd
trigger1 = Anim = 420
trigger1 = AnimElem = 2
x = -0.5
y = 0
ignorehitpause = 1

[State 420, StateTypeSet]
type = StateTypeSet
trigger1 = Anim = 420
trigger1 = AnimElem = 3
statetype = A
physics = N
ignorehitpause = 1

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
trigger1 = Time >= 50
value = 11
ctrl = 1

;Bomb
[Statedef 421]
type=A
physics=N
movetype=A
anim=7050
ctrl=0
juggle = 8
velset=0,0
sprpriority=4

[State 421, Hit]
type = HitBy
trigger1=1
time=-1
value=SCA,NP,SP,HP
ignorehitpause=1

[State 421, StartingVel]
type = VelSet
trigger1 = !Time
X = 2
Y = -3

[State 421, Gravity]
type = VelAdd
trigger1 = Pos Y < 0
Y = .5

[State 421, Hit]
type = HitDef
trigger1 = Time = 5
attr = C, NP
damage    = Floor(69 * IfElse(Var(22) > 0, 0.6, Parent, FVar(39)))
animtype  = Hard
hitflag = MAF
guardflag = M
pausetime = 0,20
sparkno = -1
hitsound   = -1
fall = 1
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -2,-2.3
air.velocity = -1.2,-3
down.velocity = -5,0
down.hittime = 22
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.invertall = 1
palfx.color = 0
palfx.add = 245, 148, 88
palfx.time = 20
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 421, HitOverride]
type=hitoverride
trigger1=1
time=-1
attr=SCA,NP,SP,HP
stateno=422
ignorehitpause=1


[State 1010, burst]
type = PlaySnd
trigger1 = MoveContact || Pos Y >= 0
value = S2,1
channel = 0
ignorehitpause=1

[State 1010, burst]
type = ChangeState
trigger1 = MoveContact || Pos Y >= 0
value = 422
ignorehitpause=1

;Explosion
[Statedef 422]
type = A
physics = N
movetype = I
anim = 7051
velset = 0,0
ctrl = 0
sprpriority = 4

[State 1015, snd]
type = PlaySnd
trigger1=!time
value = S7010,4
channel = 1

[State 1015, assert]
type = AssertSpecial
trigger1=1
flag=noshadow
ignorehitpause=1

[State 1015, end]
type = DestroySelf
trigger1 = !AnimTime

;===========================================================================
; Air Moves
;===========================================================================

;---------------------------------------------------------------------------
;Jump Light
[Statedef 600]
type    = A
movetype= A
physics = A
juggle  = 4
poweradd= IfElse(Var(22) > 0, 0, 0)
ctrl = 0
anim = 600
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 600, 2]
type = StateTypeSet
trigger1 = !Time
trigger1 = Var(22) > 0
physics = N

[State 600, 2]
type = ChangeState
trigger1 = !AnimTime
value = 7950
ctrl = 1
ignorehitpause = 1

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0

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
hitsound   =  S0,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 8
ground.velocity = -4
air.velocity = -1.3,-3
air.hittime = 14
getpower = IfElse(Var(22) > 0, 0, 72), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 600, 2]
type = PosSet
trigger1 = Var(22) > 0
trigger1 = Pos Y > -Vel Y && Vel Y > 0
Y = 0
ignorehitpause = 1


;---------------------------------------------------------------------------
;Jump Mid
[Statedef 610]
type    = A
movetype= A
physics = A
juggle  = 3
poweradd= IfElse(Var(22) > 0, 0, 18)
ctrl = 0
anim = 610
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 600, 2]
type = StateTypeSet
trigger1 = !Time
trigger1 = Var(22) > 0
physics = N

[State 610, 1]
type = VelSet
trigger1 = Time = 5
trigger1 = var(21) > 10
X = 3

[State 610, 1]
type = VelAdd
trigger1 = Time > 5 && Vel X > .1
X = -.1

[State 610, zwoom]
type = VelSet
trigger1 = Time = [0,13]
trigger1 = var(21) > 10
Y = 0

[State 610, 1]
type = PlaySnd
trigger1 = Time = 1
value = S3,0
channel = 0

[State 610, Explod]
type = Explod
trigger1 = Time < 8
trigger1 = AnimElemNo(0) = 2
trigger1 = var(21) > 10
trigger1 = !NumExplod(600)
anim = 7005
ID = 600
pos = -10, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 610, 1]
type = VarAdd
trigger1 = Time = 13
trigger1 = var(21) > 10
var(21) = -10

[State 610, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 40
guardflag = HA
hitflag = MAF
priority = 4
pausetime = 12,12
sparkno = S7006
sparkxy = -13,-20
hitsound   = S0,1
guardsound = 6,0
animtype = Med
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -2, -3
air.velocity = -2,-4
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 92, 154)), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 630, 2]
type = VarSet
trigger1 = !Time
V = 0
value = 0
persistent = 0

[State 630, 2]
type = VarSet
trigger1 = MoveContact
V = 0
value = 1
persistent = 0

[State 630, 2]
type = VarAdd
trigger1 = Var(0) > 0
trigger1 = MoveContact
V = 0
value = 1

[State 600, 2]
type = PosSet
trigger1 = Var(22) > 0
trigger1 = Pos Y > -Vel Y && Vel Y > 0
Y = 0
ignorehitpause = 1

[State 630, 2]
type = ChangeState
trigger1 = Var(0) > 15
trigger2 = Time > 25 && Var(22) > 0
value = 7950
ctrl = 1


;---------------------------------------------------------------------------
;Jump Strong
; CNS difficulty: easy
[Statedef 620]
type    = A
movetype= A
physics = A
juggle  = 3
poweradd= IfElse(Var(22) > 0, 0, 18)
ctrl = 0
anim = 620
sprpriority = 1

[State 600, 2]
type = StateTypeSet
trigger1 = Var(22) > 0
physics = N


[State 600, 2]
type = StateTypeSet
trigger1 = Var(22) = 0
physics = A

[State 630, Freeze]
type = VelSet
trigger1 = AnimElemNo(0) = 1
trigger1 = var(21) > 15
x = 0
y = 0

[State 630, Freeze]
type = VelSet
trigger1 = AnimElem = 2
trigger1 = var(21) > 15
x = 2
y = IfElse(Var(22), 0, -3)

[State 620, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,0
channel = 0

[State 610, Explod]
type = Explod
trigger1 = AnimElem = 2
trigger1 = var(21) > 15
anim = 7041
ID = 600
pos = -10, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 610, 1]
type = VarSet
trigger1 = !Time
V = 0
value = 0

[State 610, 1]
type = VarAdd
trigger1 = Time = 5
trigger1 = var(21) > 15
trigger1 = var(0) := 1
var(21) = -15

[State 630, 2]
type = HitDef
trigger1 = !Time
trigger1 = var(21) > 15
attr = A, NA
damage = 60
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 8,8
sparkno = S7001
sparkxy = -13,0
hitsound   = S0,3
guardsound = 6,0
fall = Var(22) = 0
ground.type = High
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -4
air.velocity = -2,-3
air.hittime = 14
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 92, 154)), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 630, 2]
type = VarSet
trigger1 = MoveContact
V = 0
value = 2
persistent = 0

[State 630, 2]
type = VarAdd
trigger1 = Var(0) > 1
trigger1 = MoveContact
V = 0
value = 1

[State 630, 2]
type = ChangeState
trigger1 = Var(0) > 15
trigger2 = Var(22) & Time > 35
value = 7950
ctrl = 1