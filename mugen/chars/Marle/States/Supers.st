;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Guardia Soldiers
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
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
sound = S7100,1
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2001
ctrl = 0

;Guardia Soldiers Attempt
[Statedef 2001]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2001
sprpriority = 2
facep2 = 1

[State 3060, Snd]
type = PlaySnd
trigger1 = !Time
value = S7050,2
channel = 0
ignorehitpause = 1

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = S7020,2
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2002
p2stateno = 2003
guard.dist = 0
fall = 1
getpower = 0

[State 2001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Guardia Soldiers - Success
[Statedef 2002]
type = S
movetype = A
physics = N
sprpriority = 1
anim = 2005

[State 2002, Bind]
type = VarSet
trigger1 = !Time
V = 0
value = 0

[State 2002, Bind]
type = VarSet
trigger1 = !Time
V = 1
value = 0

[State 2002, Bind]
type = VarSet
trigger1 = !Time
V = 2
value = 0

[State 2002, Bind]
type = VarSet
trigger1 = !Time
FV = 0
value = Target, Pos X 

[State 2002, Bind]
type = VarSet
trigger1 = !Time
FV = 1
value = Target, Pos Y

[State 2002, Bind]
type = VarAdd
trigger1 = NumTarget
trigger1 = Target, StateNo = 2003
FV = 0
value = Facing * 2

[State 2002, Bind]
type = VarAdd
trigger1 = NumTarget
trigger1 = Target, StateNo = 2003
FV = 1
value = -4 + Time * 0.43

[State 2002, Bind]
type = TargetState
trigger1 = NumTarget
trigger1 = Target, StateNo = 2003
trigger1 = FVar(1) >= Pos Y
value = 2004

[State 2002, Bind]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, StateNo = 2004
FV = 1
value = 0
persistent = 0

[State 2002, Bind]
type = EnvShake
trigger1 = NumTarget
trigger1 = Target, StateNo = 2004
freq = 120
ampl = 6
time = 6
persistent = 0

[State 2002, Bind]
type = ChangeAnim
trigger1 = NumTarget
trigger1 = Target, StateNo = 2004
value = 2002
persistent = 0

[State 2002, Bind]
type = TargetBind
trigger1 = NumTarget
pos = Floor(Facing * (FVar(0) - Pos X)), Floor(FVar(1) - Pos Y)

[State 2002, Soldier]
type = Helper
trigger1 = Time % 30 = 29
trigger1 = NumTarget
trigger1 = Var(2) < 6
trigger1 = (Var(2) := Var(2) + 1)
name = "Guardia Soldier"
ID = 2000
stateno = 2005
pos = Floor(IfElse(Var(2) % 2 > 0, (- ScreenPos X - 10)*Facing, (GameWidth - ScreenPos X + 10)*Facing)), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2002, Turn]
type = Helper
trigger1 = Var(0)
trigger1 = Time % 3 = 0
ID = 2006
stateno = 2006
name = "Cloud"
pos = Floor(Facing * (FVar(0) - Pos X) + Random % 70 - 35), Floor(FVar(1) - Pos Y - Random % 30 + 10)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Shake]
type = EnvShake
trigger1 = Var(0)
trigger1 = Var(1) < 80
trigger1 = Time % 6 = 0 
freq = 120
ampl = 6 + Random % 4
time = 6 + Random % 4

[State 2002, Shake]
type = PlaySnd
trigger1 = Var(0)
trigger1 = Var(1) < 80
trigger1 = Time % 6 = 0 
value = S7020, Random % 6

[State 2002, Shake]
type = EnvShake
trigger1 = Var(0)
trigger1 = Var(1) < 80
trigger1 = Time % 6 = 3 && Random % 2 
freq = 120
ampl = 6 + Random % 4
time = 6 + Random % 4


[State 2002, Time]
type = VarAdd
trigger1 = Var(0) = 6
V = 1
value = 1

[State 2002, Time]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = Var(0) = 6
trigger1 = Var(1) < 80
trigger1 = Var(1) % 6 = 0
value = -12

[State 2022, Let Target Go]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Var(1) > 80

[State 2002, Time]
type = ChangeState
trigger1 = Var(1) = 120
value = 0
ctrl = 1


; Guardia Soldiers - Hit 1
[Statedef 2003]
type = A
movetype = H
physics = N
sprpriority = 1
velset = 0, 0

[State 2023, Anim]
type = ScreenBound 
trigger1 = 1
value = 0
movecamera = 0, 0
ignorehitpause = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2003
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

; Guardia Soldiers - On ground
[Statedef 2004]
type = L
movetype = H
physics = N
ctrl = 0
sprpriority = 0
velset = 0, 0


[State 2023, Anim]
type = ScreenBound 
trigger1 = 1
value = 0
movecamera = 0, 0
ignorehitpause = 1

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2004

[State 803, Hit Ground]
type = SelfState
trigger1 = !GetHitVar(isbound)
value = 5100
ctrl = 0

;Guardia Soldier
[Statedef 2005]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
sprpriority = 2
juggle = 14
anim = 7200

[State 2013, Turn]
type = Turn
triggerall = !Time
triggerall = !(Var(0) := 0)
trigger1 = ScreenPos X > GameWidth
trigger1 = Facing > 0
trigger2 = ScreenPos X < 0
trigger2 = Facing < 0

[State 2013, Turn]
type = PosAdd
triggerall = !Time
trigger1 = Abs(Pos X - Parent, FVar(0)) < 80
X = IfElse(Facing < 0, 80 - Parent, FVar(0), Parent, FVar(0) - 80)
persistent = 0

[State 2013, Turn]
type = VelSet
trigger1 = !Time
X = 3

[State 2013, Turn]
type = VarSet
trigger1 = !Time
V = 1
value = Parent, Var(2)

[State 2013, Turn]
type = ChangeAnim
trigger1 = Abs(Pos X - Parent, FVar(0)) < 80
value = 7201
persistent = 0

[State 2013, JumpSnd]
type = PlaySnd
trigger1 = Anim = 7201
value = S7000,1
persistent = 0

[State 2013, Turn]
type = VelSet
trigger1 = Abs(Pos X - Parent, FVar(0)) < 80
X = 4
Y = -4
persistent = 0

[State 2013, Turn]
type = VelAdd
trigger1 = Anim = 7201
Y = 0.4

[State 2013, Turn]
type = ChangeAnim
trigger1 = Anim = 7201 && Pos Y > 0
trigger1 = Var(0) := 1
trigger2 = Anim = 7201 && AnimElemTime(1) >= 20
trigger2 = Var(0) := 1
value = 7203
persistent = 0

[State 2013, JumpSnd]
type = PlaySnd
trigger1 = Var(0) = 1
value = S7020,2
persistent = 0

[State 2013, Turn]
type = VelSet
trigger1 = Anim = 7203
X = 0
Y = 0
persistent = 0

[State 2013, Turn]
type = Turn
trigger1 = Var(0) = 2
persistent = 0

[State 2013, Turn]
type = PosSet
trigger1 = Anim = 7203
Y = 0
persistent = 0

[State 2013, Parent]
type = ParentVarAdd
trigger1 = Anim = 7203
V = 0
value = 1
persistent = 0

[State 2013, Turn]
type = VarAdd
trigger1 = Parent, StateNo != 2002
trigger2 = Var(0) >= 2
trigger3 = Parent, Var(1) > 70
V = 0
value = 1

[State 2013, End]
type = VelSet
trigger1 = Var(0) > Var(1)*10
X = 3
persistent = 0

[State 2013, End]
type = ChangeAnim
trigger1 = Anim != 7200 && Var(0) >= 2
value = 7200

[State 2013, End]
type = DestroySelf
triggerall = Var(0) >= 2
trigger1 = ScreenPos X < -20
trigger2 = ScreenPos X > (GameWidth + 20)

; Fight Clouds
[Statedef 2006]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
sprpriority = 4

[State 2110, Anim]
type = ChangeAnim
trigger1 = !Time
value = 7205 + (Random % 2)

[State 2110, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.7 + Time/30.0, 0.7 + Time/30.0

[State 2110, Scale]
type = Trans
trigger1 = Time > 16
trans = addalpha
alpha = 256 - 32 * (Time - 16), 32 * (Time - 16)

[State 2110, DestroySelf]
type = DestroySelf
trigger1 = Time > 24

;---------------------------------------------------------------------------
; Ice II
[Statedef 2010]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2
juggle = 14

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
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Ice II Summoning
[Statedef 2011]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2011, Var]
type = VarSet
trigger1 = !Time
V = 0
value = 0

[State 2011, Ice II]
type = Helper
trigger1 = !Time
name = "Ice 2"
ID = 2010
stateno = 2012
pos = -5, -120
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2011, Ice II]
type = Helper
trigger1 = Time > 0
trigger1 = !NumHelper(2010)
trigger1 = Var(0) := 1
name = "Ice 2"
ID = 2010
stateno = 2012
pos = -5, -120
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2011, End]
type = ChangeState
trigger1 = Time > 130
trigger2 = Var(0)
trigger2 = !NumHelper(2010) || Helper(2010), StateNo = 2014
value = 0
ctrl = 1

;Ice Block
[Statedef 2012]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3
juggle = 10
anim = 7210
velset = 4, 6

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 2012, Prevent Undergound Juggles]
type= targetbind
trigger1= movehit=1
trigger1= numtarget=1 && numenemy
trigger1= (target,time<=1) && (target,ID=enemynear,ID); this is just to prevent Simul issues as usual
trigger1= !(target,hitshakeover) && (target, hitfall) && (target, pos y>0)
pos= ceil(p2dist x), ceil(-pos y); keeps P2 at the same horizontal distance, but resets his Y position
ignorehitpause= 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) = [0, 8]
trans = addalpha
alpha = 32 * AnimElemTime(1), 256 - 16 * AnimElemTime(1)
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) > 8
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2013
time = 1
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = !Time 
attr = S, HP
damage = Floor(82* parent, fvar(39)),3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,27
sparkno = -1
hitsound = -1
guardsound = 5,0
ground.type = Low
ground.velocity = 0, -3
ground.hittime = 25
air.hittime = 25
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,-3
airguard.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
air.fall = 1
fall = 1
p1sprpriority = 2
p2sprpriority = 0
fall.recover = 0
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 26
ignorehitpause = 1


[State 1021, ChangeState]
type = PlaySnd
trigger1 = Pos Y >= - Vel Y
trigger1 = Vel Y > 0
value = S7020,6
ignorehitpause = 1

;End
[State 2013, End]
type = ChangeState
trigger1 = Pos Y >= - Vel Y
trigger1 = Vel Y > 0
value = 2014
ignorehitpause = 1

;Ice Block GetHit
[Statedef 2013]
type    = S
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2013, End]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
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
stateno = 2013
time = 1
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2012
ignorehitpause = 1

;Ice Block End
[Statedef 2014]
type    = S
movetype= H
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 3

[State 2013, NormalScale]
type = EnvShake
trigger1 = !Time
time = 24
ampl = 6
freq = 120
ignorehitpause = 1

[State 2013, NormalScale]
type = ChangeAnim
trigger1 = !Time
value = 7211
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = Time
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * AnimElemTime(1), 128 + 8 * AnimElemTime(1)
ignorehitpause = 1


[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1


;---------------------------------------------------------------------------
; Glacier Spikes
[Statedef 2020]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2020
poweradd = -1000
sprpriority = 2
juggle = 14

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
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2021
ctrl = 0

;Glacier Spikes Summoning
[Statedef 2021]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2011, Glacier]
type = Helper
trigger1 = Time = 0
trigger2 = Time = 15
trigger3 = Time = 30
name = "Glacier Spike"
ID = 2020
stateno = 2022
pos = 25 * (NumHelper(2020)), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 2011, End]
type = ChangeState
trigger1 = Time > 130
trigger2 = NumHelper(2020) = 3
value = 0
ctrl = 1

; Spikes
[Statedef 2022]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3
juggle = 0
anim = 7219 + Parent, NumHelper(2020)

[State 2012, Prevent Undergound Juggles]
type= targetbind
trigger1= movehit=1
trigger1= numtarget=1 && numenemy
trigger1= (target,time<=1) && (target,ID=enemynear,ID); this is just to prevent Simul issues as usual
trigger1= !(target,hitshakeover) && (target, hitfall) && (target, pos y>0)
pos= ceil(p2dist x), ceil(-pos y); keeps P2 at the same horizontal distance, but resets his Y position
ignorehitpause= 1

[State 2013, ScaleFactor]
type = VarSet
trigger1 = !Time
V = 0
value = Parent, NumHelper(2020)
ignorehitpause = 1

[State 2013, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 * (1 + Var(0)), 0.25 * (1 + Var(0))
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 2023
ignorehitpause = 1

[State 2013, NormalScale]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.93
persistent = 0
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = !Time 
attr = S, HP
damage = Floor((24 + 20 * Var(0))* parent, fvar(39)),3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5,5
sparkno = -1
hitsound = S7020,5
guardsound = 5,0
ground.type = Low
ground.velocity = -2, -3
ground.hittime = 25
air.hittime = 25
ground.slidetime = 5
guard.velocity = -1
air.velocity = -2, -3
airguard.velocity = 0, 0
yaccel = 0.4
air.fall = 1
p1sprpriority = 2
p2sprpriority = 0
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 26
ignorehitpause = 1


[State 1021, ChangeState]
type = PlaySnd
trigger1 = !Time
value = S7020,5
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = AnimElemNo(0) < 9
trans = add
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = AnimElemNo(0) = 9
trans = addalpha
alpha = 256 - AnimElemTime(9) * 8, 256
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

; Spikes GetHit
[Statedef 2023]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
sprpriority = 2

[State 1021, Strength]
type = ChangeAnim
trigger1 = !Time
value = 7219 + Parent, NumHelper(2020)
elem = 9
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1021, ChangeState]
type = AngleDraw
trigger1 = 1
scale = 0.25 * (1 + Var(0)), 0.25 * (1 + Var(0))
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = AnimElemNo(0) = 9
trans = addalpha
alpha = 256 - AnimElemTime(9) * 8, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;---------------------------------------------------------------------------

;Freeze Completion
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

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 32
movetime = 32
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2101
p2stateno = 2102
guard.dist = 0
fall = 1
getpower = 0

[State 2020, Attack]
type = ChangeState
trigger1 = !AnimTime && !MoveHit
value = 0
ctrl = 1

;Freeze Completion Success
[Statedef 2101]
type = S
physics = S
movetype=A
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,1
channel = 0
ignorehitpause = 1

[State 2002, Bind]
type = VarSet
trigger1 = !Time
FV = 0
value = 30

[State 2002, Bind]
type = VarSet
trigger1 = !Time
FV = 1
value = 0

[State 2022, Bound]
type = ChangeAnim
trigger1 = Anim = 2100 && !AnimTime
value = 2101
persistent = 0

[State 2022, Bound]
type = PosAdd
trigger1 = !Time && FrontEdgeBodyDist < 70
X = - (70 - FrontEdgeBodyDist)

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Time = 40
ID = 2100
stateno = 2110
name = "Dancer"
pos = 37, Floor((Target, Const(size.mid.pos.y)))
postype = p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 1
supermovetime = 999999
persistent = 0

[State 2002, Hit]
type = TargetLifeAdd
trigger1 = Time = 60
value = -40

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Time = 100
ID = 2101
stateno = 2113
name = "Leene"
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
persistent = 0

[State 2002, Hit]
type = TargetLifeAdd
trigger1 = Time = 120
value = -40

[State 2002, Bind]
type = VarAdd
trigger1 = Time = [100, 120]
FV = 0
value = 0.3

[State 2002, Bind]
type = VarAdd
trigger1 = Time = [100, 120]
FV = 1
value = - 4 + (Time - 100) * 0.3

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Time = 80
ID = 2102
stateno = 2108
name = "Ice BG"
pos = 0, 0
postype = left ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
persistent = 0

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Time = 120
ID = 2103
stateno = 2109
name = "Ice"
pos = Floor(FVar(0)) , Floor(FVar(1) + 1.3 * (Target, Const(size.mid.pos.y)))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
persistent = 0

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Time = 170
ID = 2104
stateno = 2115
name = "Schala"
pos = Floor(FVar(0) - 40), Floor(FVar(1) + 0.3 * (Target, Const(size.mid.pos.y)))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
persistent = 0

[State 2002, Hit]
type = TargetLifeAdd
triggerall = NumHelper(2104)
trigger1 = Helper(2104), Time % 23 = 7
trigger2 = Helper(2104), Time % 23 = 18
value = -17

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Time > 170
trigger1 = !NumHelper(2104)
ID = 2105
stateno = 2107
name = "Flash"
pos = Floor(FVar(0) - 40), Floor(FVar(1) + 0.3 * (Target, Const(size.mid.pos.y)))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
persistent = 0

[State 2022, Bound]
type = TargetBind
trigger1 = NumTarget
pos = FVar(0), FVar(1)

[State 2022, Bound]
type = TargetState
trigger1 = NumTarget
trigger1 = NumHelper(2105)
value = 2103
persistent = 0

[State 2022, Bound]
type = TargetDrop
trigger1 = NumTarget
trigger1 = NumHelper(2105)


[State 2022, Bound]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

; Freeze Completion - Hit
[Statedef 2102]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 2102
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Freeze Completion - End
[Statedef 2103]
type = A
movetype = H
physics = N
sprpriority = 1

[State 802, Exit]
type = VelSet
trigger1 = Time > 5
trigger1 = !gethitvar(isbound)
X = - 3
Y = - 5

[State 802, Exit]
type = SelfState
trigger1 = Time > 5
trigger1 = !gethitvar(isbound)
value = 5050

; Flash BG
[Statedef 2107]
type = S
physics = N
movetype = I
anim = 7300

[State 2013, Shade]
type = PlaySnd
trigger1 = !Time
value = S7100,2

[State 7000, Pal Down]
type = BGPalFX
trigger1 = 1
time = 1
add = 256 - 8 * Time, 256 - 8 * Time, 256 - 8 * Time


[State 7000, End]
type = DestroySelf
trigger1 = Time >= 32

; Chilly BG
[Statedef 2108]
type = S
physics = N
movetype = I
anim = 7300

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 16
time = 1
add = 0, 4 * Time, 8 * Time
color = 256 - 16 * Time

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [16, 64]); && root, var(10) = 5
time = 1
add = 0, 64, 128
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 64
time = 1
add = 0, 64 - 4 * (Time - 64), 128 - 8 * (Time - 64)
color = 16 * (Time - 64)

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 80


;Ice
[Statedef 2109]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
sprpriority = 2
juggle = 14
anim = 7103

[State 2013, Shade]
type = PalFX
trigger1 = 1
time = 1
color = 0
add = 0, 0, 128
mul = 256, 256, 256

[State 2013, Shade]
type = Trans
trigger1 = AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 16 * AnimElemTime(1), 256 - 8 * AnimElemTime(1)

[State 2013, Shade]
type = Trans
trigger1 = AnimElemTime(1) > 16
trans = addalpha
alpha = 256, 128

[State 2013, End]
type = VarSet
trigger1 = !Time
V = 0
value = 0

[State 2013, End]
type = VarAdd
trigger1 = Parent, NumHelper(2105)
trigger2 = Var(0) > 0
V = 0
value = 1


[State 2013, Shade]
type = Trans
trigger1 = Var(0) > 0
trans = addalpha
alpha = 256 - 16 * Var(0) , 128 + 8 * Var(0) 

[State 2013, End]
type = DestroySelf
trigger1 = Var(0) > 16
trigger2 = Root, StateNo != 2101

;Dancer
[Statedef 2110]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
sprpriority = 2
juggle = 14
anim = 7250

[State 2013, Shade]
type = PalFX
trigger1 = 1
time = 1
color = 0
add = 0, 64, 128
mul = 256, 256, 256

[State 2013, Shade]
type = Trans
trigger1 = AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 16 * AnimElemTime(1), 256 - 16 * AnimElemTime(1)

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7040,0
channel = 0
ignorehitpause = 1

[State 2013, Shade]
type = EnvShake
trigger1 = AnimElem = 2
ampl = 4
time = 6
freq = 120

[State 2013, Shade]
type = Trans
trigger1 = AnimElemTime(1) > 16
trans = addalpha
alpha = 256, 0

[State 2013, Shade]
type = Trans
trigger1 = AnimElemTime(7) = [0, 16]
trans = addalpha
alpha = 256 - 16 * AnimElemTime(7), 16 * AnimElemTime(7)

[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime
trigger2 = Root, StateNo != 2101

;Leene
[Statedef 2113]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
sprpriority = 2
juggle = 14
anim = 7253
velset = 5, 0

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7000,1
ignorehitpause = 1

[State 2013, Shade]
type = EnvShake
trigger1 = !Time
ampl = 4
time = 6
freq = 120

[State 2013, Shade]
type = PalFX
trigger1 = 1
time = 1
color = 0
add = 0, 64, 128
mul = 256, 256, 256

[State 2013, Shade]
type = Trans
trigger1 = Time = [0, 8]
trans = addalpha
alpha = 32 * Time, 256 - 32* Time

[State 2013, Shade]
type = Trans
trigger1 = Time = [8, 24]
trans = addalpha
alpha = 256 - 16 * (Time - 8), 16 * (Time - 8)

[State 2013, End]
type = DestroySelf
trigger1 = Time > 24
trigger2 = Root, StateNo != 2101

;Schala
[Statedef 2115]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
sprpriority = 2
juggle = 14
anim = 7255

[State 200, Explod]
type = PlaySnd
trigger1 = Time % 23 = 7
trigger2 = Time % 23 = 18
value = S7040,1

[State 200, Explod]
type = Explod
trigger1 = Time % 23 = 7
trigger2 = Time % 23 = 18
anim = 7019
ID = 200
pos = 50, -10
postype = p1  ;p2,front,back,left,right
facing = 1 - 2 * (Random  % 2)
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 10,10
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 2013, Shade]
type = PalFX
trigger1 = 1
time = 1
color = 0
add = 0, 64, 128
mul = 256, 256, 256

[State 2013, Shade]
type = EnvShake
trigger1 = Time % 23 = 7
trigger2 = Time % 23 = 18
ampl = 4
time = 6
freq = 120

[State 2013, Shade]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 16 * Time

[State 2013, Shade]
type = Trans
trigger1 = Time > 16
trans = addalpha
alpha = 256, 0

[State 2013, Shade]
type = Trans
trigger1 = Time = [100, 116]
trans = addalpha
alpha = 256 - 16 * (Time - 100), 16 * (Time - 100)

[State 2013, End]
type = DestroySelf
trigger1 = Time > 116
trigger2 = Root, StateNo != 2101

;Haste Activation
[Statedef 2200]
type = S
movetype = I
physics = S
anim = 2020
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 1000, Pawnch]
type = Helper
trigger1 = Time = 10
name = "Haste Clock"
ID = 2200
stateno = 2201
pos = 0, -100
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 99999

[State 200, Explod]
type = Explod
trigger1 = Time = 10
anim = 7231
ID = 200
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = Facing
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
time = 80
movetime = 80
anim = -1
pos = 0, -20
sound = -1
p2defmul = 1
darken = 0

[State 2110, Snd]
type = PlaySnd
trigger1 = !Time
value = S7200,0
channel = 0


[State 2110, Snd]
type = PlaySnd
trigger1 = Time = 40
value = S7200,1
channel = 0

[State 2110, VarSet]
type = VarSet
trigger1 = Time > 1 && !NumHelper(7000) && !NumHelper(2200)
v = 21
value = 1

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && !NumHelper(2200) && Var(21) > 0
value = 0
ctrl = 1

;Haste Clock
[Statedef 2201]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 7230
sprpriority = 2

[State 2201, Vel]
type = PosAdd
trigger1 = 1
Y = (Parent, Pos Y - Pos Y - 60)/20.0

[State 2201, Trans]
type = Trans
trigger1 = Time =[0, 16]
trans = addalpha
alpha = 16*Time, 256 - 16 * Time

[State 2201, Trans]
type = Trans
trigger1 = Time =[70, 86]
trans = addalpha
alpha = 256 - 16*(Time - 70), 16 * (Time - 70)

[State 2201, End]
type = DestroySelf
trigger1 = Time >= 86
