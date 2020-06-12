;===========================================================================
; Standing Moves
;===========================================================================

;Standing Light
[StateDef 200]
anim = 200
ctrl = 0
type = S
movetype = A
physics = S
sprpriority = 1
velset = 0,0
poweradd = 0
juggle = 3 
facep2= 1

[State 200, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,0

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 200
pos = 4, -35
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

[State 200, HitDef]
type = HitDef
trigger1 = !Time
attr = S, NA      
damage = 15,0
animtype=Light   
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8,8
sparkno=S7001
sparkxy= 0,-40
hitsound = S7001,0
guardsound = 6,0   
air.juggle = 3     
ground.type = High    
ground.slidetime = 4  
ground.hittime  = 9  
ground.velocity = -2
air.velocity = -2,-2
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower= IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 200, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl=1

;Standing Medium
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 210
sprpriority=1
facep2= 1

[State 200, Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7021
ID = 210
pos = 10, 4
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

[State 210, hit]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
animtype  = Medium
damage    = 38
hitflag = MAF
guardflag = M
pausetime = 10,10
hitsound = S7001,1
guardsound = 6,0
sparkno=s7002
sparkxy=-8,5
ground.type = High
ground.slidetime = 7
ground.hittime  = 13
ground.velocity = -1
air.velocity = 0,4
animtype=Medium
air.animtype=Medium
air.juggle = 4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=10

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Standing Strong
[Statedef 220]
type=S
physics=S
movetype=A
anim=220
ctrl=0
velset=0,0
poweradd= IfElse(Var(21) > 0, 0, 18)
juggle = 12
sprpriority=1
facep2= 1

[State 220, vel]
type = VelSet
trigger1 = AnimElem = 2
X = 2
Y = -8

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7022
ID = 220
pos = 20, -28
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
ignorehitpause = 1
removeongethit = 1

[State 200, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,1

[State 220, hit]
type = HitDef
trigger1 = AnimElem = 2
attr = A, NA
animtype=Diagup
air.animtype=Diagup
damage    = 59
guardflag = M
hitflag = MAF
pausetime = 12,12
hitsound = S7001,3
guardsound = 6,0
sparkno=s7003
sparkxy=0,0
air.type = Low
ground.slidetime = 11
ground.velocity = 0,-6
air.velocity = 0,-6
air.juggle = 12
fall = Var(21) = 0
fall.recover = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=12
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 220, change]
type=statetypeset
trigger1=animelemtime(2)>=0
statetype=A
physics=N

[State 220, gravity]
type = VelAdd
trigger1=animelemtime(2)>=0
Y = .5

[State 220, end]
type=changestate
trigger1= AnimElemNo(0) = 4 
trigger1 = Pos y >= - Vel Y && Vel Y > 0
value=221

; Landing
[Statedef 221]
type = S
physics = S
movetype = I
anim = 47
velset = 0,0
ctrl = 0

[State 221, Pos]
type = PosSet
trigger1 = 1
Y = 0

[State 221, End]
type = ChangeState
trigger1 = Time >= 10
value = 0
ctrl = 1

;===========================================================================
; Crouching Moves
;===========================================================================

;Crouching Light
[StateDef 400]
anim = 400
ctrl=0
type= C 
movetype = A
physics = C
sprpriority=2
velset=0,0
poweradd= 0
juggle=3 
facep2= 1

[State 400, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0  

[State 400, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 400
pos = 4, -35
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

[State 400, HitDef]
type = HitDef
trigger1 = Animelem=2   
attr = C, NA           
damage = 20     
priority = 3, Hit       
pausetime = 8,8
sparkno=S7001;
sparkxy= 0,-30
hitsound = S6,1      
guardsound = 6,0         
hitflag = MAF
guardflag = M
ground.type = Low
ground.slidetime = 4 
ground.hittime  = 9  
ground.velocity = -2.3
air.velocity = -2,-2
air.juggle = 3
animtype=Light
air.animtype=Light
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower=IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 400, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching Medium
[StateDef 410]
anim = 410
ctrl=0
type = C
movetype = A
physics = C
sprpriority=1
velset=0,0
poweradd= IfElse(Var(21) > 0, 0, 18)
juggle=4 
facep2= 1

[State 410, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 420, Explod]
type = Explod
trigger1 = !Time
anim = 7023
ID = 410
pos = 23, 4
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
ignorehitpause = 1
removeongethit = 1

[State 410, HitDef]
type = HitDef
trigger1 = Animelem = 2   
attr = C, NA           
damage = 39   
priority = 3, Hit       
pausetime = 12,12
sparkno=S7006
sparkxy=-10,0
hitsound = S6,1      
guardsound = 6,0         
hitflag = MAF
guardflag = L
ground.type = Low
ground.slidetime = 6 
ground.hittime  = 9  
ground.velocity = -2
air.velocity = -2,-2
air.juggle = 4
animtype=Light
air.animtype=Light
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower=IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 410, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 3.5

[State 410, 1]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 420, 1]
type = RemoveExplod
trigger1 = NumExplod(410) && !AnimTime
ID = 410

[State 410, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl=1

;Crouching Strong
[StateDef 420]
anim = 420
ctrl=0
type = C
movetype = A
physics = C
sprpriority=2
velset=0,0
poweradd= IfElse(Var(21) > 0, 0, 18)
juggle=6 
facep2= 1

[State 420, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 420, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7023
ID = 420
pos = 35, 0
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
ignorehitpause = 1
removeongethit = 1

[State 420, HitDef]
type = HitDef
trigger1 = Animelem=2   
attr = C, NA           
damage = 52
priority = 3, Hit       
pausetime = 15,15
sparkno=S7004
sparkxy=-10,0
hitsound = S6,1      
guardsound = 6,0         
guardflag = L
hitflag = MAF
ground.type = Trip   
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -3.6
air.velocity = -3,-1.6
animtype=Hard
air.juggle = 6
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=8
getpower= IfElse(Var(21) > 0, 0, 216), IfElse(Var(21) > 0, 0, 36)
givepower=36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 420, 1]
type = VelSet
trigger1 = AnimElem = 2
x = 5.5

[State 420, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 420, 1]
type = RemoveExplod
trigger1 = NumExplod(420) && AnimElem = 3
ID = 420

[State 420, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl=1

;===========================================================================
; Air Moves
;===========================================================================

;Light Air
[Statedef 600]
type=A
physics=A
movetype=A
anim=600
ctrl=0
poweradd=0
juggle=4
sprpriority = 1
facep2= 1
poweradd= 0

[State 600, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,0

[State 600, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7020
ID = 600
pos = 4, -35
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

[State 600, Hitdef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 20
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 8,8
sparkno=s7001
sparkxy= 0,-40
hitsound   = S7001,0
guardsound = 6,0
ground.type = High
air.type = High
ground.slidetime = 7
ground.hittime  = 5
ground.velocity = -5
air.velocity = -1.3,-5
animtype=Light
air.animtype=Light
air.juggle = 4
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=12
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

;Medium Air
[Statedef 610]
type=A
physics=A
movetype=A
anim=610
ctrl=0
poweradd= IfElse(Var(21) > 0, 0, 18)
juggle=4
sprpriority = 1
facep2= 1

[State 610, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 610,freeze]
type=velset
trigger1 = PrevStateNo = 1040
trigger1 = AnimElemNo(0) = 1
x=(vel x)/2
Y = 0

[State 610, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7021
ID = 610
pos = 12, -3
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

[State 610, HitDef]
type = HitDef
trigger1 = time=0;
attr = A, NA          
damage = 37           
pausetime = 10,10    
hitsound   = S7001,1    
guardsound = 6,0
sparkno=s7002
sparkxy=-10,5
guardflag = HA
hitflag = MAF
ground.type = High    
air.type = High 
ground.slidetime = 9  
ground.hittime  = 12  
ground.velocity = -2.5
air.velocity = 0,10
animtype=Hard
air.animtype=Hard
fall=0
air.juggle = 4
air.fall=Var(21) = 0
down.bounce =1
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=9
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.86
persistent = 0
ignorehitpause = 1

;Strong Air
[Statedef 620]
type=A
physics=N
movetype=A
anim=620
ctrl=0
velset=0,0
poweradd= IfElse(Var(21) > 0, 0, 18)
juggle=12
sprpriority = 1
facep2= 1

[State 620, vel]
type=velset
trigger1=animelem=2
x=3
y=-8

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7022
ID = 220
pos = 20, -35
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

[State 620, Snd]
type = PlaySnd
trigger1 = Animelem=2 
value = S7000,1

[State 620, hit]
type = HitDef
trigger1 = AnimElem = 2
attr = A, NA
animtype=Diagup
air.animtype=Diagup
damage    = 58
guardflag = HA
hitflag = MAF
pausetime = 15,15
hitsound   = S7001,3
guardsound = 6,0
sparkno=s7003
sparkxy=4,0   
ground.type = High
air.type = High
fall = Var(21) = 0
ground.velocity = -3,-6
air.velocity = -3,-6
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=15
air.juggle = 12
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 220, gravity]
type = VelAdd
trigger1 = 1
Y = .5

[State 620, end]
type=changestate
trigger1= AnimElemNo(0) = 4 
trigger1 = Pos y >= - Vel Y && Vel Y > 0
value=221

;---------------------------------------------------------------------------
; Blade Strike
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
hitsound = s7000, 0
p1facing = 1
p2facing = Var(0)
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

;Blade Strike - Dissapear
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

[State 802, Shake]
type = PlaySnd
trigger1 = Time = 32
trigger2 = Time = 59
trigger3 = Time = 86
value = S7001,3

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "var(0) = %d"
params = var(0)

[State 801, Bind]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 16 * Time, 16 * Time
ignorehitpause = 1

[State 801, Bind]
type = AssertSpecial
trigger1 = Time > 16
trigger1 = anim =  801
flag = noshadow
flag2 = invisible
ignorehitpause = 1

[State 801, Bind]
type = VarSet
trigger1 = !Time
trigger1 = NumTarget
V = 1
value = (Target, Pos X - Pos X) * Facing
ignorehitpause = 1

[State 801, Bind]
type = TargetBind
trigger1 = NumTarget
pos = Var(1), 0

[State 801, First hit]
type = Explod
trigger1 = Time = 25
trigger1 = NumTarget
removetime = -2
ID = 800
anim = 802
bindtime = -1
pos = Var(1), Floor(1.1 * Target, Const(size.head.pos.y))
ownpal = 1
sprpriority = -1
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 801, First hit]
type = Explod
trigger1 = Time = 55
removetime = -2
ID = 800
anim = 803
bindtime = -1
facing = -Var(0)
pos = Var(1) + IfElse(Var(0) < 0, - Floor(Target, Const(size.ground.front)), Floor(Target, Const(size.ground.back))), Floor(Target, Const(size.mid.pos.y))
ownpal = 1
sprpriority = 3
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 801, First hit]
type = Explod
trigger1 = Time = 90
removetime = -2
ID = 800
anim = 804
bindtime = 1
facing = Var(0)
pos = Var(1) - IfElse(Var(0) < 0, - Floor(Target, Const(size.ground.front)), Floor(Target, Const(size.ground.back))), Floor(Target, Const(size.mid.pos.y))
ownpal = 1
vel = 0, -5
accel = 0, 0.4
facing = -1
sprpriority = 3
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 801, push]
type = VarAdd
trigger1 = Anim = 801
trigger1 = AnimElemNo(0) = 1
var(1) = 2

[State 801, Throw Enemy]
type = ChangeAnim 
trigger1 = Time > 90
trigger1 = !NumExplod(800)
value = 805
persistent = 0

[State 801, Throw Enemy]
type = Trans
trigger1 = Anim = 805
trigger1 = AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 16 * AnimElemTime(1), 256 - 16 * AnimElemTime(1)

[State 801, Throw Enemy]
type = TargetState
trigger1 = NumTarget
trigger1 = Time >= 95
value = 803
persistent = 0

[State 801, Throw Enemy]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Time >= 95

[State 801, End]
type = ChangeState
trigger1 = !NumTarget
trigger1 = Anim = 805
trigger1 = !AnimTime
value = 0
ctrl = 1

;Shockwave - Gethit
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
trigger1 = Time = 32
trigger2 = Time = 59
trigger3 = Time = 86
value = -27
kill = Time > 60

[State 802, Shake]
type = EnvShake
trigger1 = Time = 32
trigger2 = Time = 59
trigger3 = Time = 86
time = 5
freq = 120
ampl = 4

[State 802, Shake]
type = PalFX
trigger1 = Time = 32
trigger2 = Time = 59
trigger3 = Time = 86
add = 200, 200, 200
mul = 256, 256, 256
time = 5

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 806

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Shockwave - Air
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
value = 807

[State 803, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 808

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
