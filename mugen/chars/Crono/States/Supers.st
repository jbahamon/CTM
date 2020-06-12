;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Luminaire
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2000, SNd]
type = PlaySnd
trigger1 = !Time
value = S7200,0
channel = 0

[State 2000, up!]
type = VarSet
trigger1 = !Time
var(1) = 0
persistent=0

[State 2000, up!]
type = VarSet
trigger1 = !Time
var(2) = 0
persistent=0

[State 2000, up!]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 2020
trigger1 = var(2) := 60
ignorehitpause = 1
value = 2000
elem = 4

[State 2000, up!]
type = VarAdd
trigger1 = 1
var(2) = 1

[State 2000, up!]
type = PlayerPush
trigger1 = 1
value = 0

[State 2000, up!]
type = StateTypeSet
trigger1 = AnimElemNo(0) > 3
statetype = A
physics = N
persistent = 0

[State 2000, up!]
type = Velset
trigger1 = AnimElemNo(0) > 3
y = -0.3
persistent=0

[State 3110, Stop]
type = VelSet
trigger1 = Var(2) > 60
y = -0.3*Cos((pi/60)*(Var(2) - 60))

[State 2000, NHB]
type = NotHitBy
trigger1 = Time < 45
time = 1
value = SCA

[State 2000, Super Pause FX]
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

[State 1022, Rays]
type = Helper
trigger1 = NumHelper(2003) < 4
trigger1 = NumHelper(7000)
trigger1 = AnimElemNo(0) > 1
ID = 2003
stateno = 2003
supermovetime = 9999999
pos = 0, 0
postype = p1 ;p2,front,back,left,right
facing = 1
scale = 1 , 1
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 2000, SNd]
type = PlaySnd
trigger1 = NumHelper(2000)
value = S7200,1
channel = 0
persistent = 0


[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 50
movetime = 50
anim = -1
sound = -1
p2defmul = 1
darken = 0

[State 2000, Geyser]
type = Helper
trigger1 = Time > 50 && !NumHelper(7000)
name = "Luminaire"
ID = 2000
stateno = 2001
pos = 0, Floor(-Pos Y)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 9999


[State 2010, End]
type = ChangeState
trigger1 = Time > 5 && !NumHelper(7000) && !NumHelper(2000)
value = 50
ctrl = 0

;Luminaire Aura
[Statedef 2001]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3
velset = 0,0
juggle = 10

[State 2020, Var]
type = ParentVarSet
trigger1 = MoveHit
var(1) = 1
ignorehitpause = 1

[State 2001, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo != 2002
value = 7200
ignorehitpause = 1

[State 2001, Anim]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 2002
var(0) = 0
ignorehitpause = 1

[State 2001, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 2002
ignorehitpause = 1

[State 3101, hitdef]
type = HitDef
trigger1 = !Time
trigger1 = AnimElemNo(0) < 30
attr = S, HP
numhits=1
damage=floor(153* parent, fvar(39)),0
animtype=Hard
hitflag = MAF
hitsound = S7010,3
guardflag=MA
pausetime=0,60
sparkno=-1
ground.type=Low
ground.slidetime=2
ground.hittime=1
ground.velocity=-1,-4;
air.velocity=-1,-4;
air.juggle =10
fall=1
fall.recover=0
air.fall=1
p1sprpriority = 4
p2facing=1
palfx.invertall=1
palfx.color=0
palfx.add = 120, 120, 30
palfx.time=60
getpower=0
ID = 2000
nochainID = 2000

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.73
persistent = 0
ignorehitpause = 1

[State 2003, BGPal]
type = BGPalFX
trigger1 = AnimElemTime(1) = [30, 46]
time = 1
add = (AnimElemTime(1) - 30) * 16, (AnimElemTime(1) - 30) * 16, (AnimElemTime(1) - 30) * 16
ignorehitpause = 1

[State 2003, BGPal]
type = BGPalFX
trigger1 = AnimElemTime(1) > 46
trigger1 = AnimTime <= -32
time = 1
add = 256, 256, 256
ignorehitpause = 1

[State 2003, BGPal]
type = BGPalFX
trigger1 = AnimTime > -32
time = 1
add = - AnimTime * 8, - AnimTime * 8, - AnimTime * 8
ignorehitpause = 1


[State 2003, RealTime]
trigger1 = 1
type = AssertSpecial
flag = noshadow
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 2003, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;Luminaire GetHit
[Statedef 2002]
type    = S
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2003, RealTime]
trigger1 = 1
type = AssertSpecial
flag = noshadow
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 256, 256
ignorehitpause = 1


[State 12007]
Type=VarAdd
Trigger1=1
var(0)=1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 1021, Var]
type = ChangeState
trigger1 = var(0) >= 12
value = 2001


[State 2003, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;Luminaire Ray
[Statedef 2003]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7201
sprpriority = 3

[State 2003, Initial Angle]
type = VarSet
trigger1 = !Time
fvar(0) = Random/1000.0 * 360.0
ignorehitpause = 1

[State 2003, Rotating Speed]
type = VarSet
trigger1 = !Time
fvar(1) = ((Random/1000.0 * 0.2) + 0.4)* IfElse(GameTime % 2 > 0, -1, 1)
ignorehitpause = 1

[State 2003, Extending Speed]
type = VarSet
trigger1 = !Time
fvar(2) = Random/1000.0 * 0.2
ignorehitpause = 1

[State 2003, Initial Size]
type = VarSet
trigger1 = !Time
fvar(3) = 0.2*(Random/1000.0) + 0.6
ignorehitpause = 1


[State 2003, Rotating Speed]
type = VarSet
trigger1 = Time
fvar(0) = Floor((fvar(0) + 3*fvar(1))) % 360
ignorehitpause = 1

[State 2003, Angle in Radians]
type = VarSet
trigger1 = Time
fvar(4) = FVar(0) * 0.01745329251 + Pi/2.0
ignorehitpause = 1

;An ellipse in polar form :)
[State 2003, RealTime]
trigger1 = 1
type = AngleDraw
scale = 2.1 / (exp(0.5*ln(6*Sin(FVar(4))*Sin(FVar(4)) + 16*Cos(fvar(4))*Cos(FVar(4))))), 0.1
value = fvar(0)
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = Time = [0, 16]
type = Trans
trans = addalpha
alpha = IfElse(GameTime % 4 > 1, 0, (Time) * 16), 256
ignorehitpause = 1


[State 2003, RealTime]
trigger1 = Time = [16, 50]
type = Trans
trans = addalpha
alpha = IfElse(GameTime % 4 > 1, 0, 256), 256
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = Time = [50, 66]
type = Trans
trans = addalpha
alpha = IfElse(GameTime % 4 > 1, 0, 256 - (Time - 50) * 16), 256
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = Time >= 66
ignorehitpause = 1

;---------------------------------------------------------------------------
; Confuse
[Statedef 2010]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= -1000
ctrl = 0
anim = 2010
sprpriority = 1
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA


[State 2010, PalFx]
type = PalFX
trigger1 = (Time % 8 = 0)
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2010, Offset]
type = OffSet
trigger1 = Time % 2 = 0
X = (random % 8) - 4
Y = (random % 8) - 4

[State 2010, Super Pause FX]
type = Helper
trigger1 = Time = 1
helpertype = Normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7200,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Confuse - Jump
[Statedef 2011]
type    = A
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
anim = 2011
sprpriority = 1
velset = 3.3,-4

[State 2011, Snd]
type = PlaySnd
trigger1 = !Time
value = S7000,1

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = 1
time = 3
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = !Time
length = 8
palbright = 0, 0, 0
palcolor = 256
paladd = 1,1,1
palcontrast = 256, 256, 256
palmul = 1, 1, 1
timegap  = 3
framegap = 3
trans = none
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 2021, Jump]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 2021, Jump]
type = PlayerPush
trigger1 = 1
value = 0

[State 2021, Hit]
type = HitDef
trigger1 = !Time
attr = A, HT 
hitflag = MA-
priority = 4, Miss
sparkno = -1
p1stateno = 2012
p2stateno = 2013
guard.dist = 0
damage = 20, 3 
animtype = Hard
p1facing = 1
pausetime = 5, 0
ground.velocity = 0,0
ground.cornerpush.veloff = 0
fall = 1
fall.recovertime = 120
air.type = Low
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 4
envshake.freq = 120
envshake.ampl = 3
air.fall = 0
fall.recover = 0
p1sprpriority = 1
p2sprpriority = 1
kill = 0

[State 620, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621

; Confuse - Success
[Statedef 2012]
type = A
physics = N
movetype = A
poweradd = 0
velset = 0,0

[State 1010, Snd]
type = PlaySnd
trigger1 = !Time
value = S7200,3
channel = 0
loop = 1
ignorehitpause = 1


[State 1010, Snd]
type = PlaySnd
trigger1 = Time = 80
value = S7110,0
channel = 0
loop = 1
ignorehitpause = 1

[State 2023, Shake]
type = BGPalFx
trigger1 = Time = [0, 16]
add = 256 -16 * Time, 256 -16 * Time, 256-16 * Time
mul = 256, 256, 256
time = 1
ignorehitpause = 1

[State 2012, Pos]
type = Turn
trigger1 = !Time
trigger1 = NumTarget
trigger1 = Facing = Target, Facing
ignorehitpause = 1

[State 2012, Pos]
type = PosSet
trigger1 = !Time
trigger1 = NumTarget
X = Target, Pos X - 20*Facing
ignorehitpause = 1

[State 2022, !Push]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2022, Helper]
type = Helper
trigger1 = !Time
helpertype = normal ;player
name = "Marker"
ID = 2010
stateno = 2015
pos = Floor(Target, Pos X - Pos X ) * Facing , Floor(-Pos Y)
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause =  1
persistent = 0

[State 2022, Var]
type = VarSet
trigger1 = !Time
var(0) = IfElse(Pos X > Target, Pos X, -1,1)
ignorehitpause =  1

[State 2022, Var]
type = VarSet
trigger1 = !Time
var(2) = 0
ignorehitpause =  1
 
[State 2022, Screenbound]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause =  1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(0) = IfElse(Pos Y > 0, 0, Pos Y)
persistent = 0
ignorehitpause = 1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(1) = Target, Pos Y
persistent = 0
ignorehitpause = 1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(2) = 0
ignorehitpause = 1

[State 2022, Var]
type = VarAdd
trigger1 = 1
fvar(2) = facing * pi * (1/20.0 + (Time / 400000.0))
ignorehitpause = 1

[State 2022, Move]
type = PosSet
trigger1 = !Var(2)
trigger1 = NumHelper(2010)
X = (Helper(2010), Pos X) - Cos(fvar(2)) * 25 * Var(0) 
Y = FVar(0) + 4 * Sin(Time/20.0)
ignorehitpause =  1

[State 2022, Move]
type = SprPriority
trigger1 = 1
value = IfElse(Sin(fvar(2))*Facing > 0, 2, 0)

[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) > 0 
trigger1 = Sin(fvar(2) + pi/4.0) > 0
var(1) = 0


[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) > 0 
trigger1 = Sin(fvar(2) + pi/4.0) < 0
var(1) = 1

[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) < 0 
trigger1 = Sin(fvar(2) + pi/4.0) < 0
var(1) = 2


[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) < 0 
trigger1 = Sin(fvar(2) + pi/4.0) > 0
var(1) = 3

[State 2012, Anim]
type = ChangeAnim
trigger1 = !Var(2)
trigger1 = Anim != (2013 + var(1))
value = 2013 + var(1)

[State 2022, Move]
type = TargetBind
trigger1 = Target, StateNo = 2013
trigger1 = NumHelper(2010)
pos = ((Helper(2010), Pos X) - Pos X) * Facing , FVar(1) - Pos Y
time = 1
ignorehitpause = 1

[State 2022, Move]
type = SprPriority
trigger1 = 1
value = IfElse(Sin(pi * time/20.0)*Facing > 0, 2, 0)

[State 1020, Afterimage]
type = AfterImage
trigger1 = !Time
length = 10
palbright = 0, 0, 0
palcolor = 256
paladd = 1,1,1
palcontrast = 256, 256, 256
palmul = 1, 1, 1
timegap  = 1
framegap = 1
trans = none
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = !Var(2)
time = 3
ignorehitpause = 1

[State 2022, End]
type = VarSet
trigger1 = Time > 120
trigger1 = Abs(Cos(fvar(2)) - 1) < 0.3
trigger1 = Abs(Sin(fvar(2))) < 0.3
var(2) = 1

[State 2023, Shake]
type = EnvShake
trigger1 = (Time % 20 = 0 )
trigger1 = !Var(2)
trigger2 = Anim = 2017 && AnimElem = 2
time = 18
freq = 120
ampl = 6

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Var(2)
time = 0
ignorehitpause = 1
persistent = 0

[State 2022, End]
type = ChangeAnim
trigger1 = Var(2)
value = 2017
persistent = 0


[State 1010, Snd]
type = PlaySnd
trigger1 = Anim = 2017
trigger1 = AnimElem = 2
value = S7200,2
channel = 0
persistent = 0
ignorehitpause = 1

[State 2022, End]
type = TargetState
trigger1 = Var(2)
trigger1 = NumTarget
trigger1 = AnimElemTime(2) = 3
value = 2014

[State 2022, End]
type = VelSet
trigger1 = Var(2)
trigger1 = !AnimTime
X = -3 
Y = -5


[State 2022, End]
type = ChangeState
trigger1 = Var(2)
trigger1 = !AnimTime
value = 50
ctrl = 0

;Confuse - Hit
[Statedef 2013]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2012

[State 2023, Shake]
type = PalFx
trigger1 = (Time % 20 = 0 )
add = 200, 200, 200
mul = 256, 256, 256
time = 4

[State 2023, Shake]
type = LifeAdd
trigger1 = (Time % 20 = 0 )
value = -13
kill = 0

[State 2023, End]
type = SelfState
trigger1 = Time > 10 && !GetHitVar(IsBound)
value = 5050

;Confuse - Into the air
[Statedef 2014]
type = A
movetype = H
physics = N
sprpriority = 1
velset = -3, - 7

[State 2023, Shake]
type = LifeAdd
trigger1 = !Time
value = -10
kill = 0


[State 2023, Shake]
type = PalFx
trigger1 = !Time
add = 200, 200, 200
mul = 256, 256, 256
time = 12

[State 2024, PosAdd]
type = PosAdd
trigger1 = !Time
Y = Const(size.mid.pos.y)

[State 2024, Gravity]
type = VelAdd
trigger1 = 1
Y = .5

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 803

[State 2024, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 804

[State 2024, Life]
type = LifeAdd
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = -15

[State 2024, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 2024, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 14
freq = 120
ampl = 8

[State 2024, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 2024, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0

;Marker
[Statedef 2015]
type = S
movetype = I
physics = N
anim = 7300
sprpriority = -1

[State 2021, Invisible]
type = Width
trigger1 = 1
value = 0,0

[State 2021, Invisible]	
type = PlayerPush
trigger1 = 1
value = 0

[State 2021, End]
type = DestroySelf
trigger1 = Parent, Stateno != 2012

;---------------------------------------------------------------------------
; Lightning 2/Thundastorm
[Statedef 2020]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2020
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2000, up!]
type = VarSet
trigger1 = !Time
var(1) = 0
persistent=0

[State 2000, up!]
type = VarSet
trigger1 = !Time
var(2) = 0
persistent=0

[State 2000, up!]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 2000
trigger1 = var(2) := 60
ignorehitpause = 1
value = 2000
elem = 4

[State 2000, up!]
type = VarAdd
trigger1 = 1
var(2) = 1

[State 2000, up!]
type = PlayerPush
trigger1 = 1
value = 0

[State 2000, up!]
type = StateTypeSet
trigger1 = AnimElemNo(0) > 3
statetype = A
physics = N
persistent = 0

[State 2000, up!]
type = Velset
trigger1 = AnimElemNo(0) > 3
y = -0.3
persistent=0

[State 3110, Stop]
type = VelSet
trigger1 = Var(2) > 60
y = -0.3*Cos((pi/60)*(Var(2) - 60))


[State 2000, NHB]
type = NotHitBy
trigger1 = Time < 45
time = 1
value = SCA

[State 2000, Super Pause FX]
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

[State 1022, Sparks]
type = Helper
trigger1 = Time = 3
helpertype = Normal
name = "Gathering Sparks"
id = 2022
pos = 0, -20
postype = p1
facing = 1
stateno = 2022
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 0

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 50
movetime = 50
anim = -1
sound = S7100,0
p2defmul = 1
darken = 0

[State 2020, Var]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 2020, Var]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 2000, Geyser]
type = Helper
trigger1 = Time > 50 && !NumHelper(7000)
trigger1 = GameTime % 8 = 0
trigger1 = Var(0) < 4
trigger1 = (Var(0) := (Var(0) + 1))
name = "Thunder"
ID = 2020
stateno = 2021
postype = p1 ;p2,front,back,left,right
pos = IfElse(Var(0) = 1, 20, IfElse(Var(0) = 2, 70, IfElse(Var(0) = 3, 35, 52))), - Floor(Pos Y)
facing = IfElse(Random % 2 > 0, 1, -1)
keyctrl = 0
ownpal = 1
supermovetime = 9999

[State 2010, End]
type = ChangeState
trigger1 = Time > 5 && !NumHelper(7000) && Var(0) >= 4
value = 50
ctrl = 0

;The Lightnings
[Statedef 2021]
type = S
physics = N
movetype = A
anim = 7103
velset = 0,0
juggle = 4
sprpriority = 3


[State 1001, NoShadow]
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
trigger1 = AnimElem = 4
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
scale = 1.5, 1
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
attr = S,HP
damage = Floor(Parent, FVar(39)*50), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4, 30
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4,-3
air.velocity  = -0.4, -3
fall = 1
air.fall = 1
air.juggle = 4
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

[State 2020, Var]
type = ParentVarSet
trigger1 = MoveHit
var(1) = 1
ignorehitpause = 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.85
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


;Gathering Sparks
[Statedef 2022]
type = A
movetype = I
physics = N
anim = 7300

[State 2022, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = -60,60
     
[State 2022, VarRandom]
type = VarRandom
trigger1 = 1
v = 1
range = -60,60

[State 2022, VarRandom]
type = BindToParent
trigger1 = 1
pos = 0, -20

[State 2022, Helper]
type = Helper
trigger1 = ((GameTime%6) = 0)
helpertype = Normal
name = "Spark"
id = 2023
pos = var(0),var(1)
postype = p1
facing = 1
stateno = 2023
keyctrl = 0
ownpal = 1
supermovetime = 99999
pausemovetime = 0
ignorehitpause = 1

[State 2022, End]
type = DestroySelf
trigger1 = Parent, NumHelper(2020)
trigger2 = Parent, StateNo != 2020

;Spark
[Statedef 2023]
type = A
movetype = I
physics = N
anim = 7102
sprpriority = 3

[State 2023]
type = PosAdd
trigger1 = 1
X = (ParentDist X)/5.0 
Y = (ParentDist Y)/5.0

[State 9002, End]
type = DestroySelf
trigger1 = (ParentDist X <= 5) && (ParentDist Y <= 5) && (Time > 10)


;Frenzy Activation
[Statedef 2100]
type = S
movetype = I
physics = S
anim = 2100
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 1000, Pawnch]
type = Helper
trigger1 = Time > 40 && !NumHelper(7000) && !NumHelper(2100) && Var(21) > 0
name = "Frenzy Clone"
ID = 7200
stateno = 7200
pos = 0, -100
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 99999

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause FX]
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

[State 2110, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 40
movetime = 40
anim = -1
pos = 0, -20
sound = S7200,2
p2defmul = 1
darken = 0


[State 2110, VarSet]
type = VarSet
trigger1 = Time > 40
v = 21
value = 1

[State 2110, End]
type = ChangeState
trigger1 = Time > 40 && !NumHelper(7000) && !NumHelper(2100) && Var(21) > 0
value = 0
ctrl = 1


;Shining Sword Attack
[Statedef 2200]
type=S
physics=N
movetype=A
anim=2200
ctrl=0
velset=0,0
sprpriority=1
poweradd = -3000

[State 2110, VarSet]
type = VarSet
trigger1 = !Time
v = 21
value = 0

[State 200, Explod]
type = Explod
trigger1 = GameTime % 5 = 0
trigger1 = Anim = 2200
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
supermovetime = 99999
removeongethit = 1
ignorehitpause = 1


[State 3060, nhb]
type = VarSet
trigger1 = !Time
V = 21
value = 0
ignorehitpause = 1

[State 3060, nhb]
type = NotHitBy
trigger1 = Time <=32
value = SCA
time = 1
ignorehitpause = 1

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

[State 2010, Super Pause FX]
type = PalFX
trigger1 = time = [0, 32]
add = 256 - 8 * Time, 256 - 8 * Time, 64 - 2 * Time
time = 2

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 32
movetime = 32
anim = -1
sound = S7200,2
p2defmul = 1
darken = 0

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = MA-
priority = 1, Miss
sparkno = -1
hitsound = S7040,2
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2202
p2stateno = 2102
guard.dist = 0
fall = 1
getpower = 0

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) = 2
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = AnimElem = 2
length = 10
palbright = 0, 0, 0
palcontrast = 256, 256, 128
paladd = 0,0,0
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 1020, Pal]
type = PalFX
trigger1 = AnimElemNo(0) = 2
add = Floor(40 + 40*Sin(AnimElemTime(2)/10.0)), Floor(40 + 40*Sin(AnimElemTime(2)/10.0)), Floor(40 + 40*Sin(AnimElemTime(2)/10.0))
mul = 256, 256, 128
time = 2

[State 2020, Attack]
type = VelSet
trigger1 = AnimElemNo(0) >= 2
X = 3.3

[State 2020, Attack]
type = PlaySnd
trigger1 = Time = 40
channel = 0
value = S7000,3


[State 2020, Attack]
type = ChangeState
trigger1 = Time >= 65 && !MoveHit
value = 2201

;Shining Sword Miss
[Statedef 2201]
type = C
physics = C
movetype = I
anim = 2201
ctrl = 0
sprpriority = 1

[State 2021, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Shining Sword Success
[Statedef 2202]
type = S
physics = S
movetype = A
anim = 2202
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1020, Pal]
type = AfterImageTime
trigger1 = !Time
time = 0
ignorehitpause = 1

[State 1020, Pal]
type = PalFX
trigger1 = Anim = 2202
add = Floor(40 + 40*Sin(Time/10.0)), Floor(40 + 40*Sin(Time/10.0)), Floor(40 + 40*Sin(Time/10.0))
mul = 256, 256, 128
time = 2
ignorehitpause = 1

[State 2102, StartPos]
type = VarSet
trigger1 = !Time
trigger1 = NumTarget
FV = 0
value = (Target, Pos X - Pos X) * Facing
ignorehitpause = 1

[State 2102, StartPos]
type = VarSet
trigger1 = !Time
trigger1 = NumTarget
FV = 1
value = Target, Pos Y - Pos Y
ignorehitpause = 1

[State 2202, Trans]
type = Trans
trigger1 = Anim = 2202
trigger1 = AnimElemTime(2) > 10
trans = addalpha
alpha = 256 - (AnimElemTime(2) - 10)* 16, (AnimElemTime(2) - 10)* 16
ignorehitpause = 1

[State 2022, Bound]
type = TargetBind
trigger1 = NumTarget
trigger1 = Target, StateNo = 2102
pos = FVar(0), FVar(1)
ignorehitpause = 1

[State 2102, Launch]
type = EnvShake
trigger1 = Anim = 2202
trigger1 = AnimElem = 2
ampl = 8
freq = 120
time = 12

[State 2022, Bound]
type = ChangeAnim
trigger1 = Anim = 2202
trigger1 = !AnimTime
value = 7300

[State 2102, Launch]
type = VarAdd
trigger1 = Anim = 7300
trigger1 = AnimElemTime(1) = [5, 10]
trigger2 = Anim = 2202
trigger2 = AnimElemNo(0) = 2
FV = 0
value = 0.6

[State 2102, Launch]
type = VarAdd
trigger1 = Anim = 7300
trigger1 = AnimElemTime(1) < 10
trigger2 = Anim = 2202
trigger2 = AnimElemNo(0) = 2
FV = 1
value = -8 + 0.3 * (Time - 1)

[State 2102, Launch]
type = Helper
trigger1 = Anim = 7300
ID = 2200
name = "Fake Crono"
stateno = 2203
pos = Floor(FVar(0))+ 30 + Target, Const(size.air.back), -154
postype = p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 99999
persistent = 0

[State 2202, Signal from clone]
type = VarSet
trigger1 = !Time
var(1) = 0
ignorehitpause = 1

[State 2103, Signal from clone]
type = VarAdd
trigger1 = Anim = 7300
trigger1 = AnimElemTime(1) > 10
trigger1 = !NumHelper(2200)
trigger2 = Anim = 0
V = 1
value = 1

[State 2202, Signal from clone]
type = VarSet
trigger1 = !Time
var(2) = 0
ignorehitpause = 1

[State 2202, Signal from clone]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, StateNo = 2102
trigger1 = Target, Time >= 200
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 2103, Trans]
type = ChangeAnim
trigger1 = Var(1) > 0
value = 0
persistent = 0

[State 2103, Trans]
type = Trans
trigger1 = Var(1) > 0
trans = addalpha
alpha = 16 * Var(1), 256 - 16 * Var(1)

[State 2103, End]
type = TargetState
trigger1 = Var(2) > 0 
value = 2103
persistent = 0

[State 2103, End]
type = AssertSpecial
trigger1 = Var(1) > 0
flag = noautoturn

[State 2103, End]
type = Turn
trigger1 = Var(1) > 0
persistent = 0

[State 2103, End]
type = ChangeState
trigger1 = Var(1) >= 16
value = 0
ctrl = 1

;Fake Crono
[Statedef 2203]
type = A
physics = N
movetype = A
anim = 2203
ctrl = 0
velset = 0, 2.7
sprpriority = 2

[State 200, Explod]
type = Explod
trigger1 = GameTime % 5 = 0
trigger1 = !Var(1)
anim = 7102
ID = 1000
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-1 + (Random/1000.0)*0.7
accel = 0,-0.3
random = 27,7
sprpriority = 3
removetime = -2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1020, Pal]
type = PalFX
trigger1 = 1
add = Floor(40 + 40*Sin(Time/10.0)), Floor(40 + 40*Sin(Time/10.0)), Floor(40 + 40*Sin(Time/10.0))
mul = 256, 256, 128
time = 2

[State 2203, Anim]
type= Trans
trigger1 = Anim = 2203
trans = addalpha
alpha = 16*AnimElemTime(1), 256 - 16*AnimElemTime(1)

[State 2203, Anim]
type= VelSet
trigger1 = Anim = 2204
Y = 0

[State 2203, Anim]
type= ChangeAnim
trigger1 = Anim = 2203
trigger1 = !AnimTime
value = 2204

[State 2203, EnvShake]
type= EnvShake
trigger1 = Anim = 2204
trigger1 = AnimElem = 2
ampl = 16
time = 18
freq = 120
persistent = 0


[State 210, 1]
type = PlaySnd
trigger1 = Anim = 2204
trigger1 = AnimElem = 2
value = S7040,2

[State 2203, EnvShake]
type= EnvShake
trigger1 = AnimElemTime(AnimElemNo(0)) = 1
trigger1 = AnimElemNo(0) = [3, 20]
trigger1 = AnimElemNo(0) % 2 = 0 
ampl = 4
time = 4
freq = 120


[State 210, 1]
type = PlaySnd
trigger1 = AnimElemTime(AnimElemNo(0)) = 1
trigger1 = AnimElemNo(0) = [3, 20]
trigger1 = AnimElemNo(0) % 2 = 0 
value = S7040,2


[State 2102, Ki]
type = Helper
trigger1 = Anim = 2204
trigger1 = AnimElemTime(22) = 10
ID = 2201
name = "Beam Attack"
stateno = 2205
pos = 12, -12
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 99999

[State 2103, Shake]
type = EnvShake
trigger1 = NumHelper(2201)
trigger1 = Helper(2201), AnimElemTime(6) = 0
time = 30
ampl = 16
freq = 100

[State 2103, Signal for Parent]
type = VarSet
trigger1 = !Time
V = 0
value = 0

[State 2103, Signal for Parent]
type = VarSet
trigger1 = NumHelper(2201)
trigger1 = Helper(2201), AnimElemTime(6) = 20
V = 0
value = 1

[State 2103, Signal from Beam]
type = VarSet
trigger1 = !Time
V = 1
value = 0

[State 2103, Shake]
type = ParentVarAdd
trigger1 = NumHelper(2201)
trigger1 = Helper(2201), AnimElemTime(6) = [0, 10]
FV = 0
value = - 2

[State 2203, Anim]
type= Trans
trigger1 = Anim = 2203
trans = addalpha
alpha = 16*AnimElemTime(1), 256 - 16*AnimElemTime(1)

[State 2103, Signal from Beam]
type = VarAdd
trigger1 = Anim = 2204
trigger1 = AnimElemTime(22) > 30
trigger1 = !NumHelper(2201)
V = 1
value = 1

[State 2103, Trans]
type = Trans
trigger1 = Var(1)
trans = addalpha
alpha = 256 - 16 * Var(1), 16 * Var(1)

[State 2103, End]
type = DestroySelf
trigger1 = Var(1) >= 16


;Beam Attack
[Statedef 2205]
type = A
movetype = I
physics = N
anim = 7250
sprpriority = 2

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,1
ignorehitpause = 1

[State 2205, Assert]
type = AngleDraw
trigger1 = 1
scale = 1.5, 1.5
ignorehitpause = 1

[State 2205, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) < 20
trans = add
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 20
trans = addalpha
alpha = 256 - 8 * (AnimElemTime(6) - 20), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
ignorehitpause = 1


; Shining Sword - Hit
[Statedef 2102]
type = A
movetype = H
physics = N
sprpriority = 0

[State Hit, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2210
ignorehitpause = 1

[State 802, Exit]
type = PalFX
trigger1 = Time = 50
add = 200, 200, 200
mul = 256, 256, 256
time = 18

[State 802, Exit]
type = LifeAdd
trigger1 = Time = 50
value = -30
kill = 0

[State 802, Exit]
type = PalFX
triggerall = Time = [60, 166]
trigger1 = (Time - 60) % 10 = 8
add = 200, 200, 200
mul = 256, 256, 256
time = 3

[State 802, Exit]
type = LifeAdd
triggerall = Time = [60, 166]
trigger1 = (Time - 60) % 10 = 8
value = -6
kill = 0

[State 802, Exit]
type = PalFX
trigger1 = Time = 180
add = 200, 200, 200
mul = 256, 256, 256
time = 22

[State 802, Exit]
type = LifeAdd
trigger1 = Time = 180
value = -147
kill = 0


[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Shining Sword - Hit 2
[Statedef 2103]
type = A
movetype = H
physics = N
sprpriority = 0

[State 2024, Vel]
type = VelSet
trigger1 = !Time
y = -9
x = 2

[State 2024, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2211

[State 2024, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 2212

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= -Vel Y)
value = 5100
ctrl = 0