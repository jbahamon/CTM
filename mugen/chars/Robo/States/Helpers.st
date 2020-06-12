;===========================================================================
; Global Helper States
;===========================================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7200

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
;add = 256 -ceil(20.6 * time), 256 -ceil(20.6 * time), 256 -ceil(20.6 * time)
mul = 256 -floor(20.6 * time), 256 -floor(20.6 * time),256 -floor(10.3 * time)
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = !var(0)
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 50,50,100;128, 128, 128
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
trigger1 = !var(0)
time = 1
mul = 50 + ceil(41.2 * (time - 40)), 50 + ceil(41.2 * (time - 40)), 100 +ceil(20.6 * (time - 40))
color = floor(51.2 * (time - 40))


[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

;Electrocute Spark
[Statedef 7100]
type = S
physics = N
movetype = A
anim = 7203
sprpriority = 6

[State 7100, face]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 7100, face]
type = Turn
trigger1 = (Facing = Parent, Facing)
ignorehitpause = 1

[State 7100, Pos]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y - 10
ignorehitpause = 1

[State 7100, End]
type = DestroySelf
trigger1 = !Parent, Var(22) 


;Fuel Meter
[Statedef 7200]
type = S
physics = N
movetype = I
anim = 7201
sprpriority = 4

[State 7200, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 7200, Amount]
type = Helper
trigger1 = !NumHelper(7201)
name = "Fuel Amount"
ID = 7201
stateno = 7201
pos = -16,0
postype = left    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 999999
;
;[State 7200, TransVar]
;type = VarSet
;trigger1 = !Time
;var(0) = 0
;
;[State 7200, FromTrans]
;type = VarAdd
;trigger1 = Root, StateType = A
;trigger1 = Var(0) < 16
;var(0) = 1
;
;[State 7200, FromTrans]
;type = VarAdd
;trigger1 = Root, StateType != A
;trigger1 = Var(0) > 0
;var(0) = -1
;
;[State 7200, Trans]
;type = Trans
;trigger1 = 1
;trans = addalpha
;alpha = var(0) * 16, 256 - var(0) * 16
;ignorehitpause = 1

[State 7200, scale]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 7200, Pos]
type = PosSet
trigger1 = 1
X = Parent, Pos X 
Y = Parent, Pos Y + 5
ignorehitpause = 1

; Fuel Measurement
[Statedef 7201]
type = S
physics = N
movetype = I
anim = 7202
sprpriority = 5

[State 7201, Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 7201, Pos]
type = PosSet
trigger1 = 1
X = Parent, Pos X - 8
Y = Parent, Pos Y
ignorehitpause = 1

[State 7201, scale]
type = AngleDraw
trigger1 = 1
scale = (Root, Var(21) / 100.0)*0.5, 0.5
ignorehitpause = 1

