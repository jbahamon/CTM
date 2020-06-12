;===========================================================================
; Helpers and other States
;===========================================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7300

[State 7000, Var]
type = VarSet
trigger1 = !Time
var(0) = (Parent, StateNo = 2100)

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
mul = 256 - floor(19.2 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 64, 0, 256
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
time = 1
mul = ceil(38.4 * (time - 40)), ceil(51.2 * (time - 40)), 256
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

; Super Armor :)
[StateDef 11777]
Type = A
MoveType = I
Physics = N
ctrl=0

[State 3510, Elem]
Type = ChangeAnim
trigger1 = root, selfanimexist(Root, Anim)
trigger1 = ifelse((root, movetype = H), (root, stateno = [5000, 5300]), 1)
trigger1 = Anim != Root, Anim || AnimElemNo(0) != Root, AnimElemNo(0)
Value = Root, Anim
Elem = Root, AnimElemNo(0)
ignorehitpause = 1

[State 775, customstatesanim]
type = AssertSpecial
trigger1 = root, movetype = H && (root, stateno != [5000, 5300])
trigger2 = !root, selfanimexist(root, anim)
flag = invisible
ignorehitpause = 1

[State 11777]
Type=StateTypeSet ; You want to mimic the statetype of the player, to let the correct types of attacks hit only
Trigger1 = root,statetype = A
Trigger1 = statetype != A
Statetype = A

[State 11777]
Type=StateTypeSet
Trigger1 = root,statetype = C
trigger1 = statetype != C
Statetype = C

[State 11777]
Type = StateTypeSet
Trigger1 = root,statetype = S
trigger1 = statetype != S
Statetype=S

[State 11777]
Type = StateTypeSet
Trigger1 = root,statetype = L
trigger1 = statetype != L
Statetype =L

[State 6965]
Type=Assertspecial ; But is invisible
Trigger1=1
flag=invisible
flag2=noshadow
ignorehitpause=1

[State 6965, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA, AA, AP , AT
StateNo = 11777
Time = 1
ForceAir = 0
ignorehitpause=1

[State 6965, BindToRoot]
Type = BindToRoot
Trigger1 = 1
Time = 1
Facing = 1
Pos = 0, 0
ignorehitpause=1

[State 6966, ParentVarAdd]
Type = ParentVarAdd
Trigger1 = Time = 0
fV = 29
Value = GetHitVar(damage)
ignorehitpause=1

[State 6966, ParentVarAdd]
Type=Hitfallset
Trigger1=1
value=0

[State 6965, Var]
Type = ParentVarSet
Trigger1 = GetHitVar(damage) > 0
var(22) = 1
ignorehitpause=1

[State 6965, DestroySelf]
Type = DestroySelf
Trigger1 = !(Root, NumHelper(1020))
ignorehitpause=1


;Frenzy
[Statedef 7200]
type = A
physics = N
movetype = I
anim = 0
ctrl = 0
velset = 0, 0

[State 7200, Pal]
type = PalFX
trigger1 = 1
add = 80, 80, 80
time = 1
ignorehitpause = 1

[State 775, End]
type = changestate
trigger1 = !ishelper(7200)
trigger1 = !ishelper(7201)
value = 0
ctrl = 1
ignorehitpause = 1

[State 3510, No Shadow]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow
ignorehitpause = 1

[State 3510, Turn]
Type = Turn
TriggerAll = IsHelper
Trigger1 = Facing != Parent,Facing
ignorehitpause = 1

[State 3510, Start]
Type = VarRangeSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Value = Root, Anim
First = 0
Last = 9

[State 3510, Start]
Type = VarRangeSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Value = Root, AnimElemNo(0)
First = 10
Last = 19

[State 3510, Start]
Type = VarRangeSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Value = Floor(Parent,Pos X)
First = 20
Last = 29

[State 3510, Start]
Type = VarRangeSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Value = Floor(Parent,Pos Y)
First = 30
Last = 39

[State 775, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 775, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1


[State 3510, Pos X]
Type = VarSet
Trigger1 = IsHelper
V = 20 + GameTime % 10
Value = Floor(Parent,Pos X)
IgnoreHitPause = 1

[State 3510, Pos Y]
Type = VarSet
Trigger1 = IsHelper
V = 30 + GameTime % 10
Value = Floor(Parent,Pos Y)
IgnoreHitPause = 1

[State 775, sts]
type = VarRangeSet
trigger1 = !Time
Value = 2
First = 40
Last = 49
ignorehitpause = 1

[State 775, Anim]
type = VarSet
trigger1 = 1
V = GameTime % 10
Value = Parent,Anim
ignorehitpause = 1

[State 775, Anim]
type = VarSet
trigger1 = 1
V = 10 + GameTime % 10
Value = Parent,AnimelemNo(0)
ignorehitpause = 1

[State 3510, Elem]
Type = ChangeAnim
trigger1 = root, selfanimexist(Var((GameTime % 10 + 5) % 10))
trigger1 = ifelse((root, movetype = H), (root, stateno = [5000, 5300]), 1)
trigger1 = Anim != Var((GameTime % 10 + 5) % 10) || AnimElemNo(0) != Var(10 + ((GameTime % 10 + 5) % 10))
Value = Var((GameTime % 10 + 5) % 10)
Elem = Var(10 + ((GameTime % 10 + 5) % 10))
ignorehitpause = 1

[State 775, customstatesanim]
type = AssertSpecial
trigger1 = root, movetype = H && (root, stateno != [5000, 5300])
trigger2 = !root, selfanimexist(root, anim)
trigger3 = Root, StateNo = 2200
flag = invisible
ignorehitpause = 1


[State 3510, Positioning]
Type = PosSet
Trigger1 = 1
X = Var(20 + ((GameTime % 10 + 5) % 10))
Y = Var(30 + ((GameTime % 10 + 5) % 10))
ignorehitpause = 1

[State 775, spr]
type = sprpriority
trigger1 = 1
value = IfElse(IsHelper(7200), 0, -1)
ignorehitpause = 1

[State 3510, ï™êg]
Type = Helper
TriggerAll = IsHelper(7200)
TriggerAll = NumHelper(7201) = 0
Trigger1 = Time = 0
ID = 7201
name = "Frenzy Clone"
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 7200
OwnPal = 1
supermovetime = 9999999

[State 775, sts]
type = VarSet
trigger1 = 1
V = 40 + GameTime % 10
Value = IfElse(Parent, MoveType = A, 0, IfElse(Parent, MoveType = H, 1, 2))
ignorehitpause = 1

[State 775, sts]
type = statetypeset
trigger1 = Var(40 + ((GameTime % 10 + 5) % 10)) = 0
movetype = A
ignorehitpause = 1

[State 775, sts]
type = statetypeset
trigger1 = Var(40 + ((GameTime % 10 + 5) % 10)) = 1
movetype = H
ignorehitpause = 1

[State 775, sts]
type = statetypeset
trigger1 = Var(40 + ((GameTime % 10 + 5) % 10)) = 2
movetype = I
ignorehitpause = 1

[State 775, hitreset]
type = movehitreset
trigger1 = !(root, movecontact)
ignorehitpause = 1

[State 775, dampener]
type = attackmulset
trigger1 = 1
value = 0.35
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = anim = 200 && animelem = 2
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
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
getpower = 0
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ignorehitpause = 1

[State 210, Hit1]
type = HitDef
trigger1 = Anim = 210 && AnimElem = 2
attr = S, NA
animtype  = Medium
damage    = 23
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
getpower = 0
givepower = 18, 18
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ignorehitpause = 1

[State 620, 3]
type = HitDef
trigger1 = Anim = 220 && AnimElem = 2
attr = S, NA
damage = 72
guardflag = HA
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
yaccel = 0.4
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
fall = 1
fall.recover = 0
ignorehitpause = 1

[State 400, 2]
type = HitDef
trigger1 = Anim = 400 && AnimElem = 2
attr = C, NA
damage    = 19
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
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2
ignorehitpause = 1

[State 410, 2]
type = HitDef
trigger1 = Anim = 410 && AnimElem = 3
attr = C, NA
damage    = 34
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
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ignorehitpause = 1

[State 420, 2]
type = HitDef
trigger1 =  Anim = 420 && AnimElem = 2
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
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.juggle  = 6

[State 600, 2]
type = HitDef
trigger1 = Anim = 600 && AnimElem = 2
attr = A, NA
damage    = 20
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
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ignorehitpause = 1

[State 610, 2]
type = HitDef
trigger1 = Anim = 610 && AnimElem = 2
attr = A, NA
damage = 45
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
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
air.fall = 1
ignorehitpause = 1

[State 620, 3]
type = HitDef
trigger1 = Anim = 620 && AnimElem = 2
attr = A, NA
damage = 72
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
getpower = 0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
fall = 1
fall.recover = 0
ignorehitpause = 1

[State 1250, Hit]
type = HitDef
trigger1 = Anim = 1010 && (AnimElem = 1)
attr = S, SA
damage = 40, 9
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
guard.cornerpush.veloff = 0;-12.74
getpower = 0
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
ignorehitpause = 1

[State 1030, Hit]
type = HitDef
trigger1 = Anim = 1030 && AnimElem = 1
damage = 120, 10
pausetime = 12, 12
attr = A, SA 
hitflag = MAF
guardflag = MA
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
getpower=0
ignorehitpause = 1

[State 7200, End]
type = DestroySelf
trigger1 = Root, Var(21) <= 0
ignorehitpause = 1