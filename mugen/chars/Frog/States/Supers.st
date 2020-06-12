;===========================================================================
; Supers: 3000 - 3199
;===========================================================================

;Masamune Stab
[Statedef 3060]
type=S
physics=S
movetype=A
anim=3060
ctrl=0
velset=0,0
sprpriority=1
poweradd = -1000

[State 3060, nhb]
type=nothitby
trigger1=anim=3150&&animelemno(0)<5
value=SCA
time=1
ignorehitpause=1

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
sound = S7000,2
p2defmul = 1
darken = 0

[State 3060,Going Up..]
type=statetypeset
trigger1=animelem=7
statetype=A
physics=A

[State 3060,Jump Frog, Jump!]
type=velset
trigger1=animelemno(0)=7
y=-13

[State 3060, Sound!]
type=PlaySnd
trigger1=animelem=7
value =S7000,3
channel = 1

[State 3060,Jump Frog, Jump!]
type=Screenbound
trigger1=(anim=3060&&animelemno(0)>=7)||(anim=3061)
value=0
movecamera=0,0

[State 3060,Jump Frog, Jump!]
type=PlayerPush
trigger1=1
value = 0
ignorehitpause = 1

[State 3060,Jump Frog, Jump!]
type=velset
trigger1=animelemtime(7)=40
y=0
persistent=0

[State 3060,Jump Frog, Jump!]
type=posadd
trigger1=animelemtime(7)=40
x=((enemynear(0), screenpos x) - screenpos x - 2)*facing
y=-40-screenpos y
persistent=0

[State 3060,Jump Frog, Jump!]
type=changeanim
trigger1=animelemtime(7)=40
value=3061
persistent=0

[State 3060,Jump Frog, Jump!]
type=velset
trigger1=anim=3061
y=13

[State 3060,Stab!]
type=HitDef
Trigger1 = time = 1
attr=A,HT
hitflag=M-
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 3061
p2stateno = 3062
guard.dist = 0
fall = 1
getpower=0

;Masamune - Stabbing
[Statedef 3061]
type=S
physics=S
movetype=A
ctrl=0
anim=3062
velset=0,0
sprpriority=1

[State 3061, Shake]
type = EnvShake
trigger1 = (Time % 10 = 0) && Time < 80
ampl = (Time / 10) + 1
freq = 120
time = 10

[State 3061, :P]
type=posadd
trigger1=!time
y=-8

[State 3061, :P]
type=varset
trigger1=!time
fvar(0)=screenpos x - target, screenpos x

[State 3061, :P]
type=varset
trigger1=!time
fvar(1)= target, screenpos y - screenpos y

[State 3061, :P]
type=varset
trigger1=!time
var(9)= target,screenpos x != [0,160]

[State 3061, flash]
type=allpalfx
time=1
ignorehitpause=1
trigger1=time>=80&&time<112
add=256-((time-80)*8),256-((time-80)*8),256-((time-80)*8)
mul=256,256,256

[State 3061, Snd]
type = PlaySnd
trigger1 = Time = 80
value = 7015,3

;Create Masamune
[State 3061, Masamune]
type=Explod
trigger1=!Time
ID=3060
anim=3699
postype=p1
removetime=80	
pos=0,4
sprpriority=4
ownpal=0

[State 3061, bind]
type=TargetBind
trigger1 = time = [80, 310]
pos = 0, 0

[State 3061, Pal]
type = PalFX
trigger1 = Time < 80
time = 1
add = floor(256*Time/80.0), floor(256*Time/80.0), floor(256*Time/80.0)

[State 3061, Camera Freeze]
type=screenbound
trigger1=1
value=0
movecamera=0,0

;Thou can't see me
[State 3061, Assert]
type=AssertSpecial
trigger1=time>=80&&time<438
flag=invisible

[State 3061, bind]
type=TargetBind
trigger1 = time = [0, 80]
pos = fvar(0), fvar(1)

[State 3062, Telprot]
type = PosSet
trigger1 = Time = 80
X = 0
Y = 0

[State 3061, Masa]
type=helper
ID=3500
name="Masa"
stateno=3063
trigger1=time=120 || time=160
ignorehitpause=1
postype=left
pos=floor(target, screenpos x -15),floor(- (random/1000.0)*target,const(size.height))
ownpal=1

[State 3061, Mune]
type=Helper
name="Mune"
ID=3600
stateno=3064
trigger1=time=140 || time = 180
ignorehitpause=1
postype=left
pos=floor(target, screenpos x +15),floor(- (random/1000.0)*target,const(size.height))
ownpal=1
facing=-1

[State 3061, Damage]
type=TargetLifeAdd
trigger1=time=134 || time = 154 || time=174 || time=194
value=-floor(45*fvar(39))
kill=0

[State 3061, Snd]
type=playsnd
trigger1=time=134 || time=154 || time=174 || time=194
value=S7002,2
channel=1

[State 3061, ow!!]
type=envshake
trigger1 = time=194 || time=174 || time=154 || time=134 
time=20
freq=40
ampl=-2
phase=0

[State 3061, Masamune]
type=helper
ID=3700
name="Masa+mune"
stateno=3065
trigger1=time=240
ignorehitpause=1
postype=left
pos=floor(target, screenpos x)- ifelse(var(9),-50,50)
facing=ifelse(var(9),-1,1)
ownpal=1

[State 3061, ow!!]
type=envshake
trigger1=time=240
time=70
freq=60
ampl=-3
phase=0

[State 3061, bind]
type=TargetBind
trigger1=time>=310&&time<365
pos=var(9)*ln((exp(time-310))/2)/6, -((time-310)/1.5)

[State 3061, xD]
type=TargetFacing
trigger1=time=365
value= Facing * (2*(var(9)) - 1)
persistent=0

[State 3061, xD]
type=TargetVelSet
trigger1=time=365
X= 10 * Facing * (1 - 2 * var(9))
Y=0

[State 3061, xD]
type=TargetState
trigger1=time=365
value=3052

[State 3061, flash]
type=allpalfx
time=1
ignorehitpause=1
trigger1=time>=436&&time<468
add=256-((time-436)*8),256-((time-436)*8),256-((time-436)*8)
mul=256,256,256

[State 3061, Snd]
type = PlaySnd
trigger1 = Time = 436
value = 7015,3
	
[State 3061, ChangeAnim]
type=ChangeAnim
trigger1=time=436
value=3063

[State 3061, Teleporto]
type=posset
trigger1=time=436
x=0
y=0

[State 3061, End]
type=ChangeState
trigger1=anim=3063&&animtime=0
value=0
ctrl=1

;Masamune - Stabbed
[Statedef 3062]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority=0

[State 3062, anim]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3064

[State 3062, out]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Masa
[Statedef 3063]
anim=3502
sprpriority=4

[State 3063, trans]
type=trans
trigger1=time>19
trans=addalpha
alpha=256-(time-19)*12,128+(time-19)*6

[State 3063, destroyself]
trigger1=time=40
type=destroyself

;Mune
[Statedef 3064]
anim=3602
sprpriority=4

[State 3064, trans]
type=trans
trigger1=time>19
trans=addalpha
alpha=256-(time-19)*12,128+(time-19)*6

[State 3064, destroyself]
trigger1=time=40
type=destroyself

;Masamune
[Statedef 3065]
anim=3704
sprpriority=0

[State 3065, Snd]
type = PlaySnd
trigger1 = !Time 
value = S7020,1

[State 3063, trans]
type=trans
trigger1=time<19
trans=addalpha
alpha=256-(19-time)*12,128+(time-19)*6

[State 3065, trans]
type=trans
trigger1=time>144
trans=addalpha
alpha=256-(time-144)*8,128+(time-144)*4
	
[State 3065, Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,4

[State 3065, destroyself]
trigger1=time=176
type=destroyself

;The Sword
[Statedef 3066]
anim=3699
sprpriority=4

[State 3066, xD]
type=trans
trigger1=time<64
trans=addalpha
alpha=256-time*4,time*4

[State 3066, xD]
type=trans
trigger1=time>=64
trans=addalpha
alpha=0,256

[State 3066, xD]
type=angledraw
trigger1=1
scale=1+(ln((exp(time))/1.2))/5.0,1+(ln((exp(time))/1.2))/5.0

[State 3066, xD]
type=destroyself
trigger1=time>=64

;-----------------
;TODO: Rename these states...

; Hit by Fast Kung Fu Palm..er.. Fast Masamune-Palm? :P
; (a custom gethit state)
[Statedef 3052]
type    = A
movetype= H
physics = N

[State 3052, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = 1
value = 3051

[State 3061, xD]
type=Velset
trigger1=1
X=-12
Y=0

[State 3052, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 3053

[Statedef 3053]
type    = A
movetype= H
physics = N

[State 3061, xD]
type=Velset
trigger1=1
X=-12
Y=0

[State 3053, Velocity]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 3053, No scroll]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 3053, Hit wall]
type = ChangeState
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist <= 20
trigger2 = FrontEdgeBodyDist <= 20
value = 3054

[State 3053, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

[Statedef 3054]
type    = A
movetype= H
physics = N

[State 3054, Turn]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 30)

[State 3054, Pos]
type = PosAdd
trigger1 = Time = 0
x =  15- BackEdgeBodyDist

[State 3054, Stop moving]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 3054, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3054, Spark]
type = Explod
trigger1 = Time = 0
anim = F72
pos = 0, floor (screenpos y) - 50
postype = back
sprpriority = 3

[State 3054, Anim]
type = ChangeAnim2
trigger1 = Time = 0
value = 3052

[State 3054, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F7,0

[State 3054, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 3055

[Statedef 3055]
type    = A
movetype= H
physics = N

[State 3055, 1]
type = NotHitBy
trigger1 = 1
value = , NA, NP

[State 3055, Vel Y]
type = VelSet
trigger1 = Time = 0
y = -6

[State 3055, Vel X]
type = VelSet
trigger1 = Time = 0
x = 1.6

[State 3055, Turn]
type = Turn
trigger1 = (Time = 0) && (BackEdgeDist < 30)

[State 3055, Gravity]
type = VelAdd
trigger1 = 1
y = .35

[State 3055, Anim 5050]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 3055, Anim 5052]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 3055, Anim 5060]
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 3055, Anim 5062]
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 3055, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;--------------

;Water Supers =)

;Water Pillar
[Statedef 3100]
type = S
physics=N
movetype=A
anim=3100
ctrl=0
velset=0,0
juggle = 16
sprpriority=1
poweradd = -1000

[State 2010, NHB]
type = NotHitBy
trigger1 = animelemno(0) <= 5
time = 1
value = SCA

[State 7015, ChangeAnim]
type = VarAdd
trigger1 = !Time
trigger1 = Var(21) > 0
var(22) = -1000
ignorehitpause = 1

[State 3100, up!]
type=statetypeset
trigger1=animelemno(0)=5
statetype=A

[State 3100, up!]
type=velset
trigger1=animelemno(0)=5
y=-0.7
persistent=0

[State 3100, Stop]
type=velset
trigger1=time>=56&&animelemno(0)>=5
y=-0.2*sin((pi/90)*(35-time))

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 5
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
trigger1 = time = 5
time = 45
movetime = 45
anim = -1
sound = S7010,0
p2defmul = 1
darken = 0

[State 3110, Explod]
type=Explod
trigger1=time=5
anim=7350
ID=7350
pos=0,-12
postype=p1
ownpal=1
removeongethit=1
supermovetime=999
ignorehitpause=0
sprpriority=2
bindtime = -1

[State 3100, Explod]
type=Explod
trigger1=time=5
anim=7350
ID=7350
pos=0,-12
postype=p1
ownpal=1
removeongethit=1
supermovetime=999
ignorehitpause=0
sprpriority=2
bindtime = -1

[State 3100, Water!]
type=helper
trigger1=time = 55
stateno=3101
postype=p1
pos=0,floor(-pos y+20)
ownpal=1
ID=3100
name="Water Pillar"

[State 3100, Stop]
type=ChangeState
trigger1=time>120&&!NumHelper(3100)
value=50
ctrl=0

;The Pillar
[Statedef 3101]
type=S
physics=N
movetype=A
anim=7202
ctrl=0
velset=0,0
sprpriority=4

[State 3101, Realtime]
type = VarSet
trigger1 = !Time && PrevStateNo != 3102
trigger1 = Var(1) := 250
trigger1 = !(Var(2) := 0)
V = 0
value = 0
ignorehitpause = 1

[State 3101, Snd]
type = PlaySnd
trigger1 = !Var(0)
value = S7010,2
channel = 1
persistent = 0

[State 3101, hitdef]
type = HitDef
trigger1 = Var(0) % 40 = 0
attr=S,HP
numhits=1
damage=floor(39* parent, fvar(39)),0
animtype=Hard
hitflag = MAF
hitsound = S7010,3
guardflag=MA
pausetime=0,39
sparkno=-1
ground.type=Low
ground.slidetime=2
ground.hittime=1
ground.velocity=-1,-4;
air.velocity=-1,-4;
fall=1
fall.recover=0
air.fall=1
p1sprpriority = 4
p2facing=1
palfx.invertall=1
palfx.color=0
palfx.add = 0, 20, 120
palfx.time=40
getpower=0

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
trigger1 = !Var(2)
trigger1 = (Var(2) := 1)
fvar(39) = parent, fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 3101, Shake]
type = EnvShake
trigger1 = !Var(0)
time = 190
freq = 120
ampl = 4

[State 3101, Shake]
type = EnvShake
trigger1 = Anim = 7201 && !AnimTime
time = 0
ampl = 0

[State 3101, Close]
type=ChangeAnim
trigger1 = Var(0) >= 162
trigger2 = Parent, StateNo != 3100
trigger3 = Var(1) <= 0
value=7201
persistent=0

[State 3101, RealTime]
type = VarAdd
trigger1 = 1
V = 0
value = 1
ignorehitpause = 1


[State 3101, Close]
type = DestroySelf
trigger1 = Anim = 7201 && !AnimTime

[Statedef 3102]
type = A
movetype = H
physics = N
velset = 0, 0
sprpiority = 4
anim = 7202

[State 3102, damage]
type = VarAdd
trigger1 = !Time
V = 1
value = - floor(GetHitVar(damage) * 0.5)

[State 3102, nhb]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 3102, pos]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = 20
ignorehitpause = 1

[State 3102, end]
type = ChangeState
trigger1 = Time >= floor(0.7 * GetHitVar(hittime)) 
value = 3101
ignorehitpause = 1

; Bubble Rush
[Statedef 3110]
physics=N
movetype=A
anim=3110
velset=0,0
ctrl=0
juggle = 16
sprpriority=1
poweradd = -1000

[State 7015, ChangeAnim]
type = VarAdd
trigger1 = !Time
trigger1 = Var(21) > 0
var(22) = -1000
ignorehitpause = 1

[State 7015, ChangeAnim]
type = VarSet
trigger1 = !Time
var(0) = Pos Y < 0
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = Time = [0, 50]
time = 1
value = SCA

[State 3110, up!]
type=statetypeset
trigger1=time=5
statetype=A

[State 3110, up!]
type=velset
trigger1=time<5
y=-0.7
persistent=0

[State 3110, Stop]
type=velset
trigger1=time=[5,60]
y=-0.3*sin((pi/60)*(35-time))

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 5
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
trigger1 = time = 5
time = 45
movetime = 45
anim = -1
sound = S7010,0
p2defmul = 1
darken = 0

[State 3110, Explod]
type=Explod
trigger1=time=5
anim=7350
ID=7350
pos=0,-12
postype=p1
ownpal=1
removeongethit=1
supermovetime=999
ignorehitpause=0
sprpriority=2
bindtime = -1

[State 3110, Water]
type=helper
trigger1=time=[53,61]
name="Bubble"
ID=3111
postype=p1
pos=0,-12
stateno=3111
ownpal=1

[State 3110, Stop]
type=velset
trigger1=time=62
x=-1.4
y=-3.8

[State 3110, Stop]
type=veladd
trigger1=time>62
y=0.4

[State 3110, lol]
type=ChangeState
trigger1=time=62
value=50

;Small bubble
[Statedef 3111]
type=S
movetype=A
physics=N
anim=1011
sprpriority=4


[State 3111, randomVar]
type=Varset
trigger1=!time
var(0)=Parent, Var(0)

[State 3111, randomVar]
type=StateTypeSet
trigger1=!time
trigger1 = Var(0)
statetype = A
physics = N

[State 3111, randomVar]
type=Varset
trigger1=!time
fvar(0)=(random*pi/500)

;Thanks to Bia/SMEE for the heat-seeking projectile code :) 

[State 3111, X]
Type = VarSet
Trigger1 = 1
fvar(13) = (EnemyNear(0), Pos X- Pos X) * Facing

[State 3111, Y]
Type = VarSet
trigger1 = 1
fvar(14) = (EnemyNear(0), pos Y - Pos Y +Enemynear(0),Const(size.mid.pos.y))

[State 3111, Vector Length]
Type = VarSet
trigger1 =1
fvar(15) = Exp(0.5*ln((fvar(13) * fvar(13))+(fvar(14) * fvar(14))))

[State 3111, vel]
type=Velset
trigger1 = time < 15
x=cos(fvar(0))*3 + Fvar(13)/fvar(15) * 0.23*time
y=sin(fvar(0))*3 + FVar(14)/fvar(15) * 0.23*time

[State 3111, Vel]
type=velset
trigger1 = time >= 15
X = Fvar(13)/fvar(15) * 4.8 
Y = (FVar(14)/fvar(15) * 4.8) - Sin(Time * 0.62)

[State 3111,Hitdef]
type=hitdef
triggerall = Var(0)
triggerall=!movecontact
triggerall=!movereversed
trigger1 = Time > 0
attr=A,HP
hitflag=MAF
guardflag=MA
animtype=Medium
priority=4
damage=floor(parent, fvar(39)*21),2
pausetime=2,14
sparkno=-1
hitsound = 5,0
ground.type = Low
air.type=Low
ground.slidetime=2
ground.hittime=1
ground.velocity=-1.0,-3.0
air.velocity=-1.0,-3.0
fall=1
fall.recover=0
air.fall=1
palfx.invertall=1
palfx.color=0
palfx.add = 0, 20, 120
palfx.time=40
getpower=0
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2


[State 3111,Hitdef]
type=hitdef
triggerall = !Var(0)
triggerall=!movecontact
triggerall=!movereversed
trigger1 = Time > 0
attr=S,HP
hitflag=MAF
guardflag=MA
animtype=Medium
priority=4
damage=floor(parent, fvar(39)*21),2
pausetime=2,14
sparkno=-1
hitsound = 5,0
ground.type = Low
air.type=Low
ground.slidetime=2
ground.hittime=1
ground.velocity=-1.0,-3.0
air.velocity=-1.0,-3.0
fall=1
fall.recover=0
air.fall=1
palfx.invertall=1
palfx.color=0
palfx.add = 0, 20, 120
palfx.time=40
getpower=0
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2


[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 3111, HitOverride]
type=hitoverride
trigger1=1
time=-1
attr=SCA, AA, AP
stateno=1015
ignorehitpause=1

[State 2012, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 3111, burst]
type=changestate
trigger1=movecontact||time > 70
trigger2 = fvar(15) < 3
value=1015
ignorehitpause=1


;Frog Squash Da - Attempt
[Statedef 3000]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3000
ctrl = 0
sprpriority = 2

[State 3000, Super Pause FX]
type = Helper
trigger1 = time = 5
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3000, Super Pause]
type = SuperPause
trigger1 = Time = 5
time = 45
movetime = 45
anim = -1
sound = S7015,3
p2defmul = 1
darken = 0

[State 3000, End]
type = ChangeState
trigger1 = Time > 5 
trigger1 = !NumHelper(3030)
value = 0
ctrl = 1

[State 3000, End]
type = ChangeState
trigger1 = NumHelper(3030)
trigger1 = Helper(3030), MoveHit
trigger1 = Helper(3030), StateNo = 7016
value = 3001
ctrl = 0

;Frog Squash Da - Connected
[Statedef 3001]
type = S
movetype = A
anim = 0

[State 3001, Anim]
type = ChangeAnim
trigger1 = Anim != 3001
trigger1 = Helper(3030), StateNo != 7016
value = 3001

[State 3001, Bubble]
type = Helper
trigger1 = Anim = 3001
trigger1 = !NumHelper(3030) || Helper(3030), StateNo = 7019
trigger1 = !NumHelper(3031)
trigger1 = !NumHelper(3002)
helpertype = normal ;player
name = "Masa & Mune"
ID = 3031
stateno = 7017
pos = 0,-30
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 99999
persistent = 0

[State 3001, Safety]
type = ChangeState
trigger1 = !NumHelper(3030) || Helper(3030), StateNo = 7019
trigger1 = Anim != 3001
value = 0

[State 3001, Bubble]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal ;player
name = "Time Bubble"
ID = 3002
stateno = 3013 
pos = 0,-30
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 99999

[State 3001, Stop]
type = Pause
trigger1 = AnimElemNo(0) > 6 
time = 2
movetime = 2

[State 3001, Snd]
type = PlaySnd
trigger1 = AnimElemNo(0) > 6
trigger1 = !NumHelper(3002)
value = S7010,4
;channel = 0
persistent = 0

[State 3001, BGPalFX]
type = BGPalFX
triggerall = AnimElemNo(0) > 6 
trigger1 = !NumHelper(3002)
time = 1
mul = 0, 120, 256
sinadd = 20,20,20,10
invertall = 1
color = 0

[State 3001, End]
type = ChangeState
trigger1 = !NumHelper(3030) || Helper(3030), StateNo = 7019
trigger1 = !NumHelper(3031)
trigger1 = !NumHelper(3002)
value = 3002

;Throwing the Sword
[Statedef 3002]
anim = 3002

[State 3002, Var]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 3001, Bubble]
type = Helper
trigger1 = AnimElem = 4
helpertype = normal ;player
name = "Sword"
ID = 3003
stateno = 3014
pos = 0,-30
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 0

[State 3001, Stop]
type = Pause
trigger1 = AnimElemTime(6) < 140 
time = 2
movetime = 2

[State 3001, Snd]
type = PlaySnd
trigger1 = AnimElemtime(1) = 20
value = S7000,2
channel = 0
persistent = 0

[State 3002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S7000,3

[State 3002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6
value = S7015,1
channel = 0

[State 3002, BGPalFX]
type = BGPalFX
trigger1 = AnimElemTime(6) < 140
time = 1
;add = 0,0,0
mul = 0, 120, 256
sinadd = 20,20,20,10
invertall = 1
color = 0

[State 3002, End]
type = ChangeState
trigger1 = AnimElemTime(6) = 210
value = 3003

;Jump
[Statedef 3003]
anim = 3004
ctrl = 0
sprpriority = 2

[State 3003, SB]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3003, ChangeAnim]
type = VelSet
trigger1 = Anim = 3004 && AnimElem = 2
Y = - 10
persistent = 0

[State 3003, ChangeAnim]
type = PlaySnd
trigger1 = Anim = 3004 && AnimElem = 2
value = 7000,0
persistent = 0

[State 3003, ChangeAnim]
type = StateTypeSet
trigger1 = Anim = 3004 && AnimElem = 2
statetype = A
physics = N
persistent = 0


[State 3003, PosSet]
type = VelSet
trigger1 = ScreenPos Y < -120
Y = 0
persistent = 0


[State 3003, PosSet]
type = PosSet
trigger1 = ScreenPos Y < -120
X = fvar(0)
persistent = 0

[State 3003, PosSet]
type = ChangeAnim
trigger1 = ScreenPos Y < -120
value = 3005
persistent = 0

[State 3003, fall]
type = VarSet
trigger1 = !Time
var(1) = 25
persistent = 0

[State 3003, fall]
type = VarSet
trigger1 = !Time
var(0) = 0
persistent = 0

[State 3003, fall]
type = VelSet
trigger1 = Anim = 3005
trigger1 = AnimElemTime(1) = 50
Y = 13
persistent = 0

[State 3003, PosSet]
type = Helper
trigger1 = ScreenPos Y < -120
trigger1 = AnimElemTime(1) = 10
helpertype = normal ;player
name = "Frog"
ID = 3015
stateno = 3015
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 3003, fall]
type = PlaySnd
trigger1 = ScreenPos Y < -60
value = 7016,0
channel = 0
persistent = 0

[State 3003, fall]
type = VelSet
trigger1 = Anim = 3005
trigger1 = Pos Y > -80
Y = 0
persistent = 0

[State 3003, fall]
type = PlaySnd
trigger1 = Anim = 3005
trigger1 = Pos Y > -80
value = 7016,1
channel = 0
persistent = 0

[State 3003, fall]
type = EnvShake
trigger1 = Anim = 3005
trigger1 = Pos Y > -80
trigger1 = var(0) := 40
time = 20
persistent = 0

[State 3003, fall]
type = VarAdd
trigger1 = var(0) > 0
var(0) = -1

[State 3003, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 3003, fall]
type = ChangeAnim
trigger1 = var(0) = 1
value = 195
persistent = 0

[State 3003, fall]
type = PlaySnd
trigger1 = var(0) = 1
value = S7015,1
persistent = 0

[State 3003, Var]
type = VarSet
trigger1 = !Time
var(1) = 0
persistent = 0

[State 3003, Var]
type = VarSet
trigger1 = Anim = 195
var(1) = 90
persistent = 0

[State 3003, Var]
type = VarAdd
trigger1 = var(1) > 0
v = 1
value = -1

[State 3003, End]
type = VelSet
trigger1 = var(1) = 1
X = -4
Y = -7

[State 3003, End]
type = ChangeState
trigger1 = var(1) = 1
value = 50

;Bubble
[Statedef 3013]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1016
sprpriority = 5

[State 3001, Snd]
type = PlaySnd
trigger1 = !Time
value = S7010,1
;channel = 0


[State 3013, Scale]
trigger1 = 1
type = AngleDraw
scale = Time/8.0, Time/8.0

[State 3012, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3011, end]
type = DestroySelf
trigger1 = Time = 130

;Sword
[Statedef 3014]
anim = 3011
sprpriority = 1

[State 3014, ChangeAnim]
type = PosSet
trigger1 = !Time
X = Parent, Pos X  + 30 * Facing
Y = Parent, Pos Y - 15
persistent = 0

[State 3014, Vel]
type = VelSet
trigger1 = !Time
X = 7.7
persistent = 0

[State 3014, Stab]
type = ParentVarSet
trigger1 =  Abs(Parent, fvar(0) - Pos X) < 6
trigger2 = Facing > 0 && Pos X > Parent, fvar(0)
trigger3 = Facing < 0 && Pos X < Parent, fvar(0)
v = 0
value = 1
persistent = 0

[State 3014, fade]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 3014, fade]
type = VarSet
trigger1 = Parent, Var(0) > 0
var(0) = 1
persistent = 0

[State 3001, Snd]
type = PlaySnd
trigger1 = Var(0) > 0
value = S7002,2
channel = 0
persistent = 0

[State 3014, fade]
type = VarAdd
trigger1 = var(0) > 0
var(0) = 1

[State 3014, fade]
type = trans
trigger1 = var(0) > 0
trans = addalpha
alpha = 256 - 32 * var(0), 32 * var(0)

[State 3014, stab]
type = PlayerPush
trigger1 = 1
value = 0

[State 3014, End]
type = DestroySelf
trigger1 = var(0) >= 8

;Big Frog
[Statedef 3015]
anim = 3013
sprpriority = 1

[State 3015, Fade]
type = varset
trigger1 = !Time
persistent = 0
var(1) = 0

[State 3015, PalFX]
type = VarSet
trigger1 = 1
var(0) = (32 * GameTime) % 360

[State 3015, PalFX]
type = VarSet
trigger1 = 1
fvar(1) = ((32 * GameTime) % 360)/60.0

[State 3015, PalFX]
type = VarSet
trigger1 = 1
fvar(2) = 128.0 * (fvar(1) - floor(fvar(1)))

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [0,1]
color = 0
time = 1
add = 128, floor(fvar(2)), 0
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [1,2]
color = 0
time = 1
add = 128 - floor(fvar(2)), 128, 0
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [2,3]
color = 0
time = 1
add = 0, 128, floor(fvar(2))
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [3,4]
color = 0
time = 1
add = 0, 128 - floor(fvar(2)), 128 
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [4,5]
color = 0
time = 1
add = floor(fvar(2)), 0, 128 
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [5,6]
color = 0
time = 1
add = 128, 0, 128 - floor(fvar(2))
mul = 200, 200, 200

[State 3015, PalFX]
type = PalFX
trigger1 = fvar(1) = [5,6]
color = 0
time = 1
add = 128, 0, 128 - floor(fvar(2))
mul = 200, 200, 200

[State 3015, Fade]
type = varset
trigger1 = Parent, Stateno != 3003
persistent = 0
var(1) = 31

[State 3015, PalFX]
type = Trans
trigger1 = !Var(1)
trans = AddAlpha
alpha = 224, 32

[State 3015, PalFX]
type = Trans
trigger1 = Var(1) > 0
trans = AddAlpha
alpha = 7 * Var(1), 7 * (32 - Var(1))

[State 3015, telprot]
type = PosSet
trigger1 = !var(1)
X = Parent, Pos X
Y = Parent, Pos Y

[State 3015, Fade]
type = VarAdd
trigger1 = var(1) > 0
v = 1
value = -1

[State 3015, Fade]
type = DestroySelf
trigger1 = (var(1) = 1)

;Opponent
[Statedef 3020]
movetype = H
velset = 0,0

[State 3020, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050
	
[State 3020, anim]
type = ChangeAnim2
trigger1 = !Time
value = 3020
ignorehitpause = 1

;Opponent
[Statedef 3021]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0

[State 3021, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 3021, anim]
type = ChangeAnim2
trigger1 = !Time
value = 3021
ignorehitpause = 1

[State 3021, anim]
type = VelSet
trigger1 = !Time
X = -2
Y = -5

[State 3021, anim]
type = VelAdd
trigger1 = Vel X < 0
X = 0.1

[State 3021, anim]
type = VelSet
trigger1 = Vel X > 0
X = 0
[State 3021, anim]
type = VelSet
trigger1 = Pos Y < 0
Y = 0

[State 3021, anim]
type = PosSet
trigger1 = Pos Y < 0
Y = 0

;Grand Dream Activation
[Statedef 3030]
type = S
movetype = I
physics = S
anim = 3030
ctrl = 0
velset = 0,0
sprpriority = 2
facep2 = 1

[State 3030, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3030, PalFx]
type = PalFX
trigger1 = 1
time = 2
sinadd = 200, 200, 200, 10

[State 3030, Super Pause FX]
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

[State 3030, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 60
movetime = 60
anim = -1
sound = S7000,2
p2defmul = 1
darken = 0

[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 21
value = 1

[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 22
value = 3000
persistent = 0

[State 2020, Super Pause FX]
type = helper
trigger1 = time > 1 && Var(21) > 0 
stateno = 7010
ID = 3030
name = "Masa&Mune"
postype = p1
pos = 0,-20
ownpal = 1
persistent = 0
supermovetime = 9999


[State 2110, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

