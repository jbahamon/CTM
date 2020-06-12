;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Hell's Geyser - HP Down
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2000, Super Pause FX]
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

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7100,3
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2001
ctrl = 0

;Hell Geyser Summoning
[Statedef 2001]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2000, Geyser]
type = Helper
trigger1 = AnimElem = 2
name = "Hell Geyser"
ID = 2000
stateno = 2002
pos = 30, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Hell Geyser 
[Statedef 2002]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3
velset = 0,0

[State 2013, Damage Var]
type = PlaySnd
trigger1 = !Time && PrevStateNo != 2003
value = S7120,0
ignorehitpause = 1

[State 2013, Damage Var]
type = VarSet
trigger1 = !Time && PrevStateNo != 2003
V = 1
value = 0

[State 1001, Dampen]
Type = ParentVarset
Triggerall = MoveHit
trigger1 = Parent, FVar(39) > 0.86
fvar(39) = Parent, Fvar(39)*0.86
ignorehitpause = 1

[State 2003, RealTime]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 2003
value = 7200
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = AngleDraw
scale = 0.8, 0.8
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 128, 256
ignorehitpause = 1

[State 1022, Souls]
type = Helper
trigger1 = Var(0) % 20 = 0
trigger1 = AnimElemTime(21) = [-10, 70]
trigger1 = Anim = 7200
ID = 2005
stateno = 2005
pos = 25 - (Random % 50), - (Random % 50)
postype = p1 ;p2,front,back,left,right
facing = 1
scale = 1 , 1
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 1022, Souls]
type = Helper
trigger1 = Var(0) % 20 = 4
trigger1 = AnimElemTime(21) = [-30, 50]
trigger1 = Anim = 7200
ID = 2005
stateno = 2005
pos = 25 - (Random % 50), - (Random % 50)
postype = p1 ;p2,front,back,left,right
facing = 1
scale = 1 , 1
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = !Time && PrevStateNo != 2003
type = VarSet
v = 0
value = -1
persistent = 0
ignorehitpause = 1

[State 2003, Var]
trigger1 = 1
type = VarAdd
v = 0
value = 1
ignorehitpause = 1

[State 2003, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2003
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = Var(0) % 6 = 0
trigger1 = Var(0) = [10, 110]
attr = S, HP
damage = Ceil(5 * Parent, FVar(39)),0
animtype = Light
air.type = High
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,6
sparkno = -1
hitsound = -1
guardsound = 5,0
ground.type = High
ground.velocity = 0, -1
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,-1
airguard.velocity = 0, 0
air.hittime = 6
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 6
envshake.freq = 120
envshake.ampl = 2
palfx.color = 0
palfx.invertall = 1
palfx.add = 140, 120, 180
palfx.mul = 256, 256, 256
palfx.time = 9
ignorehitpause = 1
numhits = 0
air.juggle = 18

[State 2013, HitDef]
type = HitDef
trigger1 = Var(0) = 110
trigger2 = !Time && Var(0) >= 110
attr = S, HP
damage = 3,3
animtype = Light
air.type = High
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,0
sparkno = -1
hitsound = S7020,5
guardsound = 5,0
ground.type = High
ground.velocity = 0, -5
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,-5
airguard.velocity = 0, 0
air.hittime = 5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
palfx.color = 0
palfx.invertall = 1
palfx.add = 20, 0, 80
palfx.mul = 256, 256, 256
palfx.time = 3
ignorehitpause = 1
numhits = 0
persistent = 0

[State 2003, End]
type = ChangeAnim
trigger1 = Anim = 7200 && Var(0) >= 120
value = 7201
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime && Anim = 7201
ignorehitpause = 1

;Hell Geyser GetHit
[Statedef 2003]
type    = S
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2003, RealTime]
trigger1 = 1
type = AngleDraw
scale = 0.8, 0.8
ignorehitpause = 1

[State 2003, Var]
trigger1 = 1
type = VarAdd
v = 0
value = 1
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 128, 256
ignorehitpause = 1

[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 6965]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)
ignorehitpause=1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2003
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2002
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime && Anim = 7201
ignorehitpause = 1

;Geyser Soul
[Statedef 2005]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 7205
sprpriority = 3
velset = 0, 2

[state 2014, dist x]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2014, Vel]
type = VelAdd
trigger1 = Vel Y >= - 4
Y = -0.2


[State 2014, Vel]
type = Trans
trigger1 = Time = [36,52]
trans = addalpha
alpha = 256 - 16 *(Time - 36), 16 *(Time - 36)


[State 2014, DestroySelf]
type = DestroySelf
trigger1 = Time >= 52


;---------------------------------------------------------------------------
;Dark Matter
[Statedef 2010]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2
juggle = 8

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

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
sound = S7100,3
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Dark Matter Summoning
[Statedef 2011]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2011, Dark Matter]
type = Helper
trigger1 = !Time
name = "Dark Matter"
ID = 2010
stateno = 2012
pos = -5, -15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2011, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Dark Matter (invisible)
[Statedef 2012]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7300
sprpriority = 3
velset = 0,0

[State 2012, Boom]
type = ChangeState
trigger1 = Parent, StateNo = 2011
trigger1 = Parent, AnimElem = 2
value = 2013
ignorehitpause = 1

[State 2012, Fail]
type = DestroySelf
trigger1 = Parent, StateNo != 2010
trigger1 = Parent, StateNo != 2011
ignorehitpause = 1

;Dark Matter Projectile
[Statedef 2013]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 0
juggle = 14

[State 2013, Snd]
type = PlaySnd
trigger1 = !Time && PrevStateNo != 2014
value = S7200,0

[State 2013, Damage Var]
type = VarSet
trigger1 = !Time && PrevStateNo != 2014
V = 0
value = 0

[State 2013, Prevent Undergound Juggles]
type= targetbind
trigger1= movehit=1
trigger1= numtarget=1 && numenemy
trigger1= (target,time<=1) && (target,ID=enemynear,ID); this is just to prevent Simul issues as usual
trigger1= !(target,hitshakeover) && (target, hitfall) && (target, pos y>0)
pos= ceil(p2dist x), ceil(-pos y); keeps P2 at the same horizontal distance, but resets his Y position
ignorehitpause= 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
trigger1 = Var(0)
trigger1 = Var(0) := 1
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 2013, PosAdd]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 2014
value = 7210
ignorehitpause = 1

[State 2013, PosAdd]
type = VelSet
trigger1 = !Time && PrevStateNo != 2014
X = 3
ignorehitpause = 1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2014
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = Time % 10 = 0
trigger1 = AnimElemNo(0) < 30
attr = S, HP
damage = Ceil(55 * Parent, FVar(39)),3
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
air.fall = 1
fall = 1
p1sprpriority = 0
p2sprpriority = 2
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.color = 0
palfx.invertall = 1
palfx.add = 140, 120, 180
palfx.mul = 256, 256, 256
palfx.time = 20
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) = [0, 32]
trans = addalpha
alpha = 8 * AnimElemTime(1), 256 - 8 * AnimElemTime(1)
ignorehitpause = 1

[State 2013, End]
type = VelMul
trigger1 = AnimElemNo(0) > 40
trigger2 = PrevStateNo = 2014
trigger3 = NumTarget
trigger3 = (Vel X * Facing * (ScreenPos X - Target, ScreenPos X) > 0) ;|| (Vel X < 0 && (ScreenPos X < Target, ScreenPos X))
X = IfElse(MoveContact, 0, 0.93)
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(53) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(53), 8 * AnimElemTime(53)
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = AnimElemTime(53) <= 0
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = AngleDraw
trigger1 = AnimElemTime(53) > 0
scale = 0.5 - 0.5 * AnimElemTime(53)/32.0, 0.5 - 0.5 * AnimElemTime(53)/32.0
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = AnimElemTime(53) > 32
ignorehitpause = 1

;Dark Matter GetHit
[Statedef 2014]
type    = S
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) = [0, 32]
trans = addalpha
alpha = 8 * AnimElemTime(1), 256 - 8 * AnimElemTime(1)
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(53) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(53), 8 * AnimElemTime(53)
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = AnimElemTime(53) <= 0
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = AngleDraw
trigger1 = AnimElemTime(53) > 0
scale = 0.5 - 0.5 * AnimElemTime(53)/32.0, 0.5 - 0.5 * AnimElemTime(53)/32.0
ignorehitpause = 1

[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 6965]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)
ignorehitpause=1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2014
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2013
ignorehitpause = 1

[State 2013, End]
type = DestroySelf
trigger1 = AnimElemTime(53) > 32
ignorehitpause = 1

;---------------------------------------------------------------------------

;Black Wind
[Statedef 2020]
type=S
physics=S
movetype=A
anim=2020
ctrl=0
velset=0,0
sprpriority=1
poweradd = -1000

[State 3060, nhb]
type = NotHitBy
trigger1 = Time <=45
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

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,6
p2defmul = 1
darken = 0

[State 2020, Attack]
type = VelSet
trigger1 = AnimElemNo(0) >= 5
X = 5.2

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2022
p2stateno = 2023
guard.dist = 0
fall = 1
getpower = 0

[State 2020, Attack]
type = ChangeState
trigger1 = Time >= 55 && !MoveHit
value = 2021

;Black Wind Miss
[Statedef 2021]
type = C
physics = C
movetype = I
anim = 2021
ctrl = 0
sprpriority = 1

[State 2021, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Black Wind Success
[Statedef 2022]
type = S
physics = N
movetype = A
anim = 2022
ctrl = 0
sprpriority = 1

[State 2021, End]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2021, End]
type = VarSet
trigger1 = !Time
trigger1 = !(Var(0) := 0)
FV = 0
value = Facing * (Target, ScreenPos X - ScreenPos X)
ignorehitpause = 1

[State 2021, End]
type = VarAdd
trigger1 = Time <= 16
FV = 0
value = - Vel X
ignorehitpause = 1

[State 2022, Bound]
type = TargetBind
trigger1 = Time < 16
pos = FVar(0), 0

[State 2021, End]
type = PalFx
trigger1 = Time = [0, 16]
time = 1
add = -16 * Time, -16 * Time, -16 * Time
color = IfElse(Time <= 4, 256 - Time * 64 , 0)
ignorehitpause = 1

[State 2021, End]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 16 * Time , 16 * Time
ignorehitpause = 1

[State 2021, End]
type = AssertSpecial
trigger1 = Time >= 16
trigger1 = Anim != 0
flag = Invisible
ignorehitpause = 1

[State 2021, End]
type = VelSet
trigger1 = Time >= 16
X = 0
Y = 0
ignorehitpause = 1

[State 2021, End]
type = PosSet
trigger1 = Time = 16
X = Target, Pos X - 30 * Facing
Y = 0
ignorehitpause = 1

[State 2022, Bound]
type = TargetBind
trigger1 = Time >= 16 && NumTarget
pos = 30, 0

[State 200, Explod]
type = EnvShake
trigger1 = Time = [16, 120] 
trigger1 = GameTime % 4 = 3
freq = 120
time = 3
ampl = 4
ignorehitpause = 1


[State 200, Explod]
type = Helper
trigger1 = Time = [16, 120] 
trigger1 = GameTime % 4 = 3
stateno = 2026
ID = 2026
pos = Floor(30 + (0.7 - 1.4 * Random /1000.0) * (Target, Const(size.ground.front) + Target, Const(size.ground.back))) , - Floor((1.5 - Random /900.0) * (Target, Const(size.height)))
postype = p1  ;p2,front,back,left,right
facing = 1 - 2 * (Random % 2) 
sprpriority = 2
ownpal = 1
ignorehitpause = 1

[State 200, Explod]
type = TargetLifeAdd
trigger1 = Time = [16, 120]
trigger1 = GameTime % 4 = 3
value = -4
kill = 0
ignorehitpause = 1

[State 200, Explod]
type = TargetLifeAdd
trigger1 = Time = 140
value = -31
ignorehitpause = 1
persistent = 0

[State 200, Explod]
type = EnvShake
trigger1 = Time = 140
freq = 120
time = 30
ampl = 8
ignorehitpause = 1
persistent = 0

[State 2022, Snd]
type = PlaySnd
trigger1 = Time = 140
value = S7040,3


[State 200, Explod]
type = TargetState
trigger1 = Time < 140 && NumTarget 
trigger1 = Target, StateNo != [2023, 2024]
value = 2023
ignorehitpause = 1

[State 200, Explod]
type = TargetState
trigger1 = Time = 140
value = 2023
ignorehitpause = 1

[State 200, Explod]
type = TargetState
trigger1 = Time = 170
value = 2024
ignorehitpause = 1

[State 2022, Bound]
type = TargetDrop
trigger1 = Time = 170

[State 200, Explod]
type = Explod
trigger1 = Time = 140
anim = 7008
ID = 2020
pos = 30, Floor((Target, Const(size.mid.pos.y)))
postype = p1  ;p2,front,back,left,right
facing =  -1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 2,2
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0


[State 200, Explod]
type = Explod
trigger1 = Time = 140
anim = 7008
ID = 2020
pos = 30, Floor((Target, Const(size.mid.pos.y)))
postype = p1  ;p2,front,back,left,right
facing =  1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 2,2
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 2021, Egg]
type = Helper
trigger1 = Time = 140
name = "Fake Magus"
ID = 2020
stateno = 2025
pos = 30, Floor((Target, Const(size.mid.pos.y)))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2022, AllFX]
type = BGPalFX
trigger1 = Time = [140, 172]
time = 1
add = 256 - 8 * (Time - 140), 256 - 8 * (Time - 140), 256 - 8 * (Time - 140)
color = IfElse(Time < 160, 0, IfElse(Time < 168, 32 * (Time - 160), 256))
time = 1

[State 2022, AllFX]
type = AllPalFX
trigger1 = Time = [140, 160]
time = 1
color = 0

[State 2022, AllFX]
type = AllPalFX
trigger1 = Time = [160, 168]
time = 1
color = 32 * (Time - 160)

[State 2021, End]
type = ChangeAnim
trigger1 = Time > 180 && !NumHelper(2020)
trigger1 = Anim != 0
trigger1 = (Var(0) := 1)
value = 0

[State 2021, End]
type = PalFx
trigger1 = Var(0) > 0
time = 1
add = -16 * (16 - Var(0)), -16 * (16 - Var(0)), -16 * (16 - Var(0))
color = IfElse(Var(0) >= 4, 256, 256 - (4 - Var(0)) * 64)
ignorehitpause = 1

[State 2021, End]
type = Trans
trigger1 = Var(0) > 0
trans = addalpha
alpha = 16 * Var(0), 256 - 16 * Var(0)
ignorehitpause = 1

[State 2021, End]
type = VarAdd
trigger1 = Var(0) > 0
V = 0
value = 1
ignorehitpause = 1

[State 2021, End]
type = ChangeState
trigger1 = Var(0) > 16
value = 0
ctrl = 1


; Black Wind - Hit
[Statedef 2023]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = Anim != 2023
value = 2023
ignorehitpause = 1

[State 2022, AllFX]
type = PalFX
trigger1 = !Time
time = 8
sinadd = 64, 64, 64, 16
mul = 256, 256, 256

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050


; Black Wind - End
[Statedef 2024]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 2024, Vel]
type = VelSet
trigger1 = !Time
y = -9
x = -2

[State 2024, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2024

[State 2024, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 2025

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= -Vel Y)
value = 5100
ctrl = 0

;Fake Magus
[Statedef 2025]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 2022
sprpriority = 4
velset = 0.6, -0.6

[State 2025, End]
type = DestroySelf
trigger1 = Parent, StateNo != 2022

[State 2025, Darken]
type = PalFX
trigger1 = 1
add = -64, -64, -64
color = 0
time = 1
ignorehitpause = 1

[State 2025, Afterimage]
type = Trans
trigger1 = Time < 16
trans = addalpha
alpha = 128, 64
ignorehitpause = 1


[State 2025, Afterimage]
type = Trans
trigger1 = Time = [16, 32]
trans = addalpha
alpha = 128 - 8 * (Time - 16), 64 +  12 * (Time - 16)
ignorehitpause = 1


[State 2014, DestroySelf]
type = DestroySelf
trigger1 = Time >= 32

; Black Wind Cuts
[Statedef 2026]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 7008
sprpriority = 4
velset = 0,0

[State 2026, Snd]
type = PlaySnd
trigger1 = !Time
value = S7040,1

[state 2014, dist x]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2025, Afterimage]
type = PalFX
trigger1 = 1
add = -128, -128 , -128
ignorehitpause = 1

[State 2025, Afterimage]
type = Trans
trigger1 = Time = [4, 8]
trans = addalpha
alpha = 128- 32 * (Time - 4), 128 + 32* (Time - 4)
ignorehitpause = 1

[State 2014, DestroySelf]
type = DestroySelf
trigger1 = Time >= 8

;---------------------------------------------------------------------------

;Midnight Blackness
[Statedef 2100]
type=S
physics=N
movetype=A
anim=2100
ctrl=0
velset=0,0
sprpriority=1
poweradd = -3000

[State 3060, nhb]
type = NotHitBy
trigger1 = Time <=45
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

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7000,1
p2defmul = 1
darken = 0

[State 2020, Attack]
type = PlaySnd
trigger1 = AnimElem = 4
value = S7010,5
channel = 0
persistent = 0

[State 2020, Attack]
type = VelSet
trigger1 = AnimElemNo(0) >= 4
X = 2.2

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) = 4
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = AnimElem = 4
length = 10
palbright = 0, 0, 0
palcontrast = 128, 128, 256
paladd = 0,0,0
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2102
p2stateno = 2103
guard.dist = 0
fall = 0
getpower = 0

[State 2020, Attack]
type = ChangeState
trigger1 = Time >= 85 && !MoveHit
value = 2101

;Midnight Blackness Miss
[Statedef 2101]
type = C
physics = C
movetype = I
anim = 2021
ctrl = 0
sprpriority = 1

[State 2021, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Midnight Blackness Success
[Statedef 2102]
type = S
physics = S
movetype = A
anim = 2102
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 2022, Bound]
type = PosAdd
trigger1 = !Time && FrontEdgeBodyDist < 50
X = - (50 - FrontEdgeBodyDist)

[State 200, Explod]
type = Explod
trigger1 = Anim = 2102
trigger1 = AnimElem = 4
anim = 7260
ID = 2100
pos = 30, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 200, Explod]
type = Explod
trigger1 = Anim = 2102
trigger1 = AnimElemNo(0) = 4
trigger1 = !NumExplod(2100)
anim = 7265
ID = 2102
pos = 30, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 2002, BoomSnd]
type = PlaySnd
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(3) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60
value = S7101,0
channel = 0

[State 2002, BoomSnd]
type = PlaySnd
triggerall = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElem = 3
value = S7120,0
channel = 0

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(4) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60 
ID = 2100
stateno = 2110
name = "Cloud"
pos = 37, Floor(1.3 * (Target, Const(size.mid.pos.y)) + IfElse(Anim = 2104, IfElse(NumHelper(2101), -30, (Target, Const(size.head.pos.y))), 0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(4) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60
ID = 2100
name = "Cloud"
stateno = 2110
pos = 30, Floor(0.7 * (Target, Const(size.mid.pos.y)) + IfElse(Anim = 2104, IfElse(NumHelper(2101), -30, (Target, Const(size.head.pos.y))), 0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(4) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60
ID = 2100
name = "Cloud"
stateno = 2110
pos = 37, Floor(IfElse(Anim = 2104, IfElse(NumHelper(2101), -30, (Target, Const(size.head.pos.y))), 0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Custom]
type = Helper
trigger1 = NumTarget
trigger1 = !(Target, SelfAnimExist(12000)) || !(Target, SelfAnimExist(12001) )
trigger1 = Target, StateNo = 2104
ID = 2101
name = "Replacement Helper"
stateno = 2108
pos = 30, 0
postype = p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2002, Transform]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemNo(0) = 4 
trigger1 = NumHelper(2100)
value = 2104
persistent = 0

[State 2002, Transform]
type = ChangeAnim
trigger1 = NumTarget
trigger1 = Anim = 2102
trigger1 = Target, StateNo = 2104
trigger1 = !NumHelper(2100)
value = 2104
persistent = 0

[State 2002, Transform]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElem = 3
value = 2105
persistent = 0

[State 2022, Bound]
type = TargetBind
triggerall = NumTarget
trigger1 = Target, StateNo = [2103, 2104]
pos = 30, 0

[State 2002, Transform]
type = TargetBind
trigger1 = NumTarget
trigger1 = Target, StateNo = 2105
pos = Floor(30 + 1.5*Sin(2*Time)), IfElse(!NumHelper(2101), Floor((Target, Const(size.head.pos.y))), 0)

[State 200, Send to Drain]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) = 60
value = 2024
ignorehitpause = 1

[State 2022, Let Target Go]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) = 60

[State 2022, Absorb Life - Enemy]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) < 60
value = -3

[State 2022, Absorb Life - Self]
type = LifeAdd
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) < 60
value = 1

[State 2022, FX]
type = PalFX
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElem = 3
time = 60
add = 64, 64, 64
sinadd = 64, 64, 64, 128
mul = 256, 256, 256

[State 2022, FX]
type = PalFX
trigger1 = !NumTarget
time = 1
add = 0, 0, 0
mul = 256, 256, 256

[State 2022, Go Back]
type = ChangeAnim
trigger1 = Anim = 2104
trigger1 = !AnimTime
value = 2105

[State 2022, Go Back]
type = VelSet
trigger1 = Anim = 2105
X = -1.2


[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Anim = 2105
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = Anim = 2105
trigger1 = AnimElemTime(1) = 1
length = 10
palbright = 0, 0, 0
palcontrast = 128, 128, 256
paladd = 0,0,0
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 2022, Go Back]
type = ChangeState
trigger1 = Anim = 2105
trigger1 = !AnimTime
value = 0
ctrl = 1

; Midnight Blackness - Hit
[Statedef 2103]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2022, FX]
type = PalFX
trigger1 = !Time
time = 9999
add = -64, -64, -64
sinadd = -64, -64, -64, 128
mul = 256, 256, 256

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 2103
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Midnight Blackness - Transformation
[Statedef 2104]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2022, NoPalFX]
type = PalFX
trigger1 = !Time
time = 1
add = 0, 0, 0
sinadd = 0, 0, 0, 16
mul = 256, 256, 256

[State 2023, Anim]
type = ChangeAnim
triggerall = !Time 
trigger1 = SelfAnimExist(12000) && SelfAnimExist(12001) 
value = 12000
ignorehitpause = 1

[State 2023, Anim]
type = AssertSpecial
trigger1 = !SelfAnimExist(12000) || !SelfAnimExist(12001) 
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = Time > 5
trigger1 = !gethitvar(isbound)
value = 5050

; Midnight Blackness - Drained
[Statedef 2105]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2022, FX]
type = PalFX
trigger1 = !Time
time = 60
add = -32, -32, -32
sinadd = -32, -32, -32, 32
mul = 256, 256, 256

[State 2023, Anim]
type = ChangeAnim
triggerall = !Time 
trigger1 = SelfAnimExist(12000) && SelfAnimExist(12001) 
value = 12001
ignorehitpause = 1

[State 2023, Anim]
type = AssertSpecial
trigger1 = !SelfAnimExist(12000) || !SelfAnimExist(12001) 
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = Time > 5
trigger1 = !gethitvar(isbound)
value = 5050

; Midnight Blackness - Replacement Helper
[Statedef 2108]
type = A
movetype = I
physics = N
anim = 7261
sprpriority = 1

[State 2108, Change]
type = ChangeState
trigger1 = Parent, Anim = 2104
trigger1 = Parent, AnimElem = 3
value = 2109

[State 802, Exit]
type = DestroySelf
trigger1 = Parent, StateNo != 2102
trigger2 = !(Parent, NumTarget)

; Midnight Blackness - Replacement Helper, Drained
[Statedef 2109]
type = A
movetype = I
physics = N
anim = 7262
sprpriority = 1

[State 2108, Elevation]
type = PosAdd
trigger1 = !Time
Y = - 30

[State 2022, FX]
type = PalFX
trigger1 = !Time
time = 60
add = -64, -64, -64
sinadd = -64, -64, -64, 128
mul = 256, 256, 256

[State 2108, Shake]
type = PosAdd
trigger1 = 1
X = 0.5*Sin(2*Time)

[State 802, Exit]
type = DestroySelf
trigger1 = Parent, StateNo != 2102
trigger2 = !(Parent, NumTarget)

; Transformation Clouds
[Statedef 2110]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
sprpriority = 3

[State 2110, Anim]
type = ChangeAnim
trigger1 = !Time
value = 7263 + (Random % 2)

[State 2110, Scale]
type = AngleDraw
trigger1 = 1
scale = 1 + Time/10.0, 1 + Time/10.0

[State 2110, Scale]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * (Time), 16 * (Time)

[State 2110, DestroySelf]
type = DestroySelf
trigger1 = Time > 16

;Magic Wall Activation
[Statedef 2200]
type = S
movetype = I
physics = S
anim = 2200
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 200, Explod]
type = Explod
trigger1 = !Time
anim = 7023
ID = 200
pos = 0, -40
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
supermovetime = 9999999

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
time = 45
movetime = 45
anim = -1
pos = 0, -20
sound = S7100,3
p2defmul = 1
darken = 0

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 9
removetime = -2
anim = 7110
pos = 0, -20
ownpal = 1
sprpriority = 3
removeongethit = 1
supermovetime = 99999

[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 21
value = 1

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && Var(21) > 0
value = 0
ctrl = 1