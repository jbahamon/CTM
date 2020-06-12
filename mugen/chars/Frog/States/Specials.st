;===========================================================================
; Specials: 1000 - 1499
;===========================================================================

;-------------Water-------------

;Water - Ground
[Statedef 1000]
type=S
physics=S
movetype=A
anim=1000
ctrl=0
sprpriority=1
velset=0,0
poweradd=IfElse(Var(21) > 0, 0, 45)
facep2= 1
juggle=12

[State 1000, whatbuttondidyoupress?]
type = VarSet
trigger1 = !time
var(1) = IfElse(command="qcbc",3,ifelse(command="qcbb",2,1))

[State 1000, Sound!]
type=PlaySnd
trigger1= !Time
value = S7010,0
channel = 0

[State 1000, RemoveExplod]
type=removeexplod
trigger1 = AnimElemTime(7) = 0
ID=1005

[State 1000, Water]
type=helper
trigger1 = AnimElem = 2
name="Bubble"
ID=1010
postype=p1
pos=0,-12
stateno=1010
ownpal=1

[State 1000,end]
type=ChangeState
trigger1 = AnimElemTime(7) = 7
ctrl=1
value=0

;Water - Air
[Statedef 1001]
type=A
physics=N
movetype=A
anim=1001
ctrl=0
velset = 0, -.4
sprpriority=1
poweradd=IfElse(Var(21) > 0, 0, 45)
juggle=12

[State 1001, Combo]
type = ChangeAnim
trigger1 = PrevStateNo = [600,699]
trigger2 = PrevStateNo = 220
value = 1001
elem = 3
persistent = 0

[State 1001, whatbuttondidyoupress?]
type=varset
trigger1=!time
var(1)=ifelse(command="qcbc",3,ifelse(command="qcbb",2,1))

[State 1001, Sound!]
type=PlaySnd
trigger1= !Time
value = S7010,0
channel = 1

[State 1001, RemoveExplod]
type=RemoveExplod
trigger1 = PrevStateNo != [600, 699]
trigger1 = PrevStateNo != 220
trigger1 = Time = 45
ID=1005

[State 1001, Water]
type = Helper
trigger1 = AnimElemTime(4) = 0
name="Bubble"
ID=1010
postype=p1
pos=0,-12
stateno=1010
ownpal=1
persistent = 0

[State 1001,end]
type = VelSet
trigger1 = NumHelper(1010)>0
x = -1.4
y = -4
persistent = 0

[State 1001,end]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
Y = 0.48

[State 1001,end]
type = ChangeState
trigger1= AnimElemNo(0) = 4 
trigger1 = Pos y >= - Vel Y && Vel Y > 0
ctrl=0
value=221

;Water Bubble
[Statedef 1010]
type=S
physics=N
movetype=A
anim=1010
ctrl=0
velset=0,0
sprpriority=4

[State 1010, var]
type=varset
trigger1=!time
var(1)=(root,var(1))

[State 1010, var]
type=varset
trigger1=!time
var(0) = (Parent, StateNo = 1000)

[State 1010, var]
type=StateTypeSet
trigger1=!time && !Var(0)
statetype = A
physics = N

[State 1010, noshadow]
type=assertspecial
trigger1=1
flag=noshadow
ignorehitpause=1

[State 1010, vert1]
type=velset
trigger1=time < 120*var(1) && var(0)
y=ifelse(var(1)=3,-.84,ifelse(var(1)=2,-.45,-.24))-sin(time*6)


[State 1010, vert1]
type=velset
trigger1=time < 120*var(1) && !var(0)
y=ifelse(var(1)=3,.54,ifelse(var(1)=2,.35,.14))-sin(time*6)


[State 1010, vert1]
type=velset
trigger1=time>100+20*var(1)
y=0-sin(time*6)

[State 1010, hor]
type=velset
trigger1=time <100+20*var(1)
x=.3*var(1)+.5

[State 1010, hor]
type=velset
trigger1=time >100+20*var(1)
x=0

[State 1010, hitdef]
type=hitdef
triggerall = Var(0)
triggerall=!movecontact
triggerall=!movereversed
trigger1 = Time > 0
priority=6,Hit
attr=S,SP
damage= floor(parent, fvar(39)*60), 4
animtype=Hard
hitflag=MAF
guardflag=MA
pausetime=4,4
sparkno=-1
ground.type=High
ground.slidetime=20
ground.hittime=20
ground.velocity=-5
air.velocity=-3.5,-3.5
air.fall=1
p2facing=1
palfx.invertall=1
palfx.color=0
palfx.add = 0, 20, 120
palfx.time=12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower=IfElse(Parent, Var(21) > 0, 0, 90)

[State 1010, hitdef]
type=hitdef
triggerall = !Var(0)
triggerall=!movecontact
triggerall=!movereversed
trigger1 = Time > 0
priority=6,Hit
attr=A,SP
damage= floor(parent, fvar(39)*60), 4
animtype=Hard
hitflag=MAF
guardflag=MA
pausetime=4,4
sparkno=-1
ground.type=High
ground.slidetime=20
ground.hittime=20
ground.velocity=-5
air.velocity=-3.5,-3.5
air.fall=1
p2facing=1
palfx.invertall=1
palfx.color=0
palfx.add = 0, 20, 120
palfx.time=12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower=IfElse(Parent, Var(21) > 0, 0, 90)


[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1015
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1010, burst]
type=changestate
trigger1=movecontact||time > 300
value=1015
ignorehitpause=1

;Bubble Bursting
[Statedef 1015]
type=A
physics=N
movetype=I
anim=1015
velset=0,0
ctrl=0
sprpriority=4

[State 1015, snd]
type=playsnd
trigger1=!time
value = S7010,4
channel = 1

[State 1015, assert]
type=assertspecial
trigger1=1
flag=noshadow
ignorehitpause=1

[State 1015, dieplz]
type=destroyself
trigger1=frontedgedist<-50||backedgedist<0

[State 1015, end]
type=destroyself
trigger1=animtime=0

;Leap Slash
[Statedef 1020]
type=S
physics=S
movetype=A
anim=1020
ctrl=0
velset=0,0
poweradd=IfElse(Var(21) > 0, 0, 115)
sprpriority=1
facep2= 1
juggle=6

[State 1020, Sound!]
type=PlaySnd
trigger1=!time
value =S7000,2
channel = 1

[State 1020, nhb]
type=nothitby
trigger1 = AnimElemNo(0) < 3
value=SCA
time=1
ignorehitpause=1

[State 1020, varset]
type=varset
trigger1=!time
var(1) = ifelse(command="dfc",3,ifelse(command="dfb",2,1))

[State 1020,Jump Frog, Jump!]
type=velset
trigger1 = AnimElem = 5
y=-12-1.3*(var(1)-3)
x=3.1+1.2*var(1)
persistent=0

[State 1020,Jump Frog, Jump!]
type=Screenbound
trigger1=animelemno(0) > 4
value=0
movecamera=0,0

[State 1020,Going Up..]
type=statetypeset
trigger1 = AnimElem = 5
statetype=A

[State 1020,Going Up..]
type=statetypeset
trigger1 = AnimElem = 6
physics=A

[State 1020,The "Slash" of Leap Slash]
type=HitDef
trigger1=!time
attr=A,SA
damage=72
animtype=Hard
hitflag=MAF
hitsound=S7002,3
guardflag=HA
pausetime=14,14
sparkno=-1
ground.type=High
ground.slidetime=0
ground.hittime=7
ground.velocity=0
air.velocity=0,0
air.fall=1
fall=1
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=12

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1020, hit]
type = PlayerPush
trigger1 = AnimElemNo(0) = 8
value = 0

[State 1020, Hitspark]
type = Explod
trigger1 = HitCount
anim = 7005
ID = 1020
pos = 0, IfElse(Pos y > -20, -Pos y, 20)
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 1020,And Down We Go..]
type=velset
trigger1 = animelemtime(8) >= 0
trigger2 = animelemtime(7) > 0
trigger2 = command = "a" || command="b" || command="c" 
x=0
y=8
persistent=0

[State 1020,And Down We Go..]
type=velset
trigger1=screenpos x <=20||screenpos x >=300
x=0


[State 1020,Hit, hit, hit!]
type=ChangeAnim
trigger1 = vel y > 0 && AnimElemNo(0) < 8
value=1020
elem=8

[State 1020, Sound!]
type=PlaySnd
trigger1 = AnimElem = 8
value = S7000,3
channel = 1

[State 1020,Landing..]
type=ChangeState
trigger1 = pos y >= 0 && vel y > 0;
value=1021
ctrl=0

;Landing from Leap 
[Statedef 1021]
type=S
physics=S
movetype=I
anim=1021
ctrl=0
velset=0,0
sprpriority=1

[State 1021,Get Back!]
type=velset
trigger1=animelem=2
x=-2
y=-1.5

[State 1021,Fall again... :/]
type=statetypeset
trigger1=animelem=2
statetype=A
physics=A

;Slurp Cut
[Statedef 1030]
type=S
physics=S
movetype=A
anim=1030
juggle=0
ctrl=0
velset=0,0
poweradd=-200
sprpriority=1
facep2= 1

[State 7015, ChangeAnim]
type = VarAdd
trigger1 = !Time
trigger1 = Var(21) > 0
var(22) = -200
ignorehitpause = 1

[State 1020, Sound!]
type=PlaySnd
trigger1=!time
value =S7015,0
channel = 1

[State 1030, whatbuttondidyoupress?]
type=varset
trigger1=!time
var(3)=ifelse(command="qcfc",14,ifelse(command="qcfb",9,5))+3

[State 1030,Slurp!]
type=HitDef
Trigger1 = 1
attr=S,ST
hitflag=M-
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1035
p2stateno = 1036
guard.dist = 0
fall = 1

[State 1030, Return Tongue]
type=changeanim
trigger1=var(3)=12
trigger1=animelem=13
value=1030
elem=25

[State 1030, Return Tongue]
type=changeanim
trigger1=var(3)=8
trigger1=animelem=9
value=1030
elem=27

[State 1030, End]
type = ChangeState
Trigger1 = Animtime=0
value = 0
ctrl=1

;Slurpin' (Frog)
[Statedef 1035]
type    = S
movetype= A
physics = N
sprpriority=1

[State 1035, Return]
type=changeanim
trigger1=1
value=1030
elem=34-animelemno(0)
persistent=0

[State 1035, Bind 1]
type = TargetBind
trigger1 = anim=1030&&animelemno(0)>1
pos = 20 + (35-animelemno(0))*5,0

[State 1035, end1]
type=changeanim
trigger1=anim=1030&&animtime=0
value=1035

[State 1035, Bind 2]
type = TargetBind
trigger1 = anim=1035 && AnimElemTime(2) < 5
pos = 20,0

[State 1035, OMG it Hurts!]
type = TargetLifeAdd
trigger1 = anim=1035 && AnimElemTime(2) = 5
value = -floor(148 * fvar(39))

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.7
persistent = 0
ignorehitpause = 1

[State 1035, OMG it Hurts!]
type = playsnd
trigger1 = anim=1035 && AnimElemTime(1) = 8
value = S7001,3
channel=1

[State 1035, Shake]
type = EnvShake
trigger1 = anim = 1035 && AnimElemTime(2) = 0
time = 12
freq = 120
ampl = 4

[State 1035, There you Go]
type = TargetState
trigger1 = anim = 1035 && AnimElemTime(2) = 10
value = 1037

[State 1035, There you Go]
type = VelSet
trigger1 = anim = 1035 && AnimElemTime(2) = 10
X = 1
Y = -5

[State 1035, There you Go]
type = StateTypeSet
trigger1 = anim = 1035 && AnimElemTime(2) = 10
statetype = A
physics = A


;-------Slurp'ed (Enemy)-------

;Dragged
[Statedef 1036]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority=0

[State 1036, anim]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1036

[State 1036, out]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Cut
[Statedef 1037]
type    = A
movetype= A
physics = N
velset = -1,-5
sprpriority=0

[State 1037, anim]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1037

[State 1037, blink]
type = palfx
Trigger1 = Time=0
add=200,200,200
mul=256,256,256
time=7

[State 1037, fall fall fall!]
type = VelAdd
Trigger1 = 1
y = .4

[State 1037, HitGround]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100

;Line Slash
[Statedef 1040]
type=A
physics=N
movetype=A
anim=1040
ctrl=0
juggle = 16
velset=0,0
poweradd=IfElse(Var(21) > 0, 0, 115)
sprpriority=1
facep2= 1

[State 1040, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7023
ID = 1040
pos = 42, 0
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

[State 1040, HitGround]
type = Width
trigger1 = AnimElemNo(0) = 2
value = 15,-3

[State 1040, vel]
type = VelSet
trigger1 = AnimElemNo(0) = 1
trigger1 = Anim = 1040
x = -1.7
y = IfElse(floor(Pos Y) < -5, 1.9, 0)

[State 1040, SB]
type = ScreenBound
trigger1 = AnimElemNo(0) = 2
value = 1
movecamera = 0, 1

[State 1040, vel]
type = VelSet
trigger1 = AnimElem = 2
x = 6.5
y = 0

[State 1040, vel]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000,3
channel = 1

[State 1040, :P]
type = PlayerPush
trigger1 = AnimElemNo(0) = 2
value = 0

[State 1040, hit]
type=HitDef
trigger1=!Time
attr=A,SA
damage=75,2
animtype=Hard
hitflag=MAF
hitsound=S7002,2
guardflag=MA
pausetime=5,5
sparkno=S7006
sparkxy = 0, -3
ground.type=High
ground.slidetime=0
ground.hittime=7
ground.velocity=-2,-5
air.velocity=-2,-5
air.fall=1
fall=1
fall.recover=0
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=12
getpower=IfElse(Var(21) > 0, 0, 50)

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.86
ignorehitpause = 1
persistent = 0

[State 1040, HitGround]
type = VarSet
trigger1 = !time
var(2) = 0

[State 1040, HitGround]
type = VarSet
trigger1 = MoveHit
var(2) = 7
persistent = 0

[State 1040, HitGround]
type = VarAdd
trigger1 = Var(2)>0
var(2) = -1

[State 1040, HitGround]
type = Velset
triggerall = Anim = 1040
trigger1 = FrontEdgeBodyDist <= 30 || Var(2) = 1
trigger1 = AnimElemTime(2) > 9
trigger2 = AnimElemTime(2) = 15
x = -1.4
y = -3.8

[State 1040, Explod]
type = RemoveExplod
triggerall = Anim = 1040
trigger1 = NumExplod(1040)
trigger1 = FrontEdgeBodyDist <= 30 || Var(2) = 1
trigger1 = AnimElemTime(2) > 9
trigger2 = AnimElemTime(2) = 15
ignorehitpause = 1

[State 1040, HitGround]
type = ChangeAnim
triggerall = Anim = 1040
trigger1 = FrontEdgeBodyDist <= 30 || Var(2) =  1
trigger1 = AnimElemTime(2) > 9
trigger2 = AnimElemTime(2) = 15
value = 1041

[State 1040, HitGround]
type = StateTypeSet
trigger1 = Anim = 1041
physics = A


