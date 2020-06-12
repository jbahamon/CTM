; Lose by Time Over
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
[Statedef 180]
type = S

[State 180, winquote]
type = VictoryQuote
trigger1 = !Time
value = (Random % 5) + 1

[State 181, Lavos]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Inner Lavos")
trigger2 = (Enemy, Name = "Lavos Core")
trigger3 = (Enemy, Name = "Lavos")
value = 6

[State 180, Frog]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Frog")
value = 7

[State 180, Lucca]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Lucca")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 8

[State 180, Crono]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Crono")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 9

[State 180, Marle]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Marle 2")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 10

[State 181, Ayla]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Ayla")
trigger1 = (Enemy, AuthorName = "Silent Protagonist")
value = 11

[State 181, Ayla]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Robo")
trigger1 = (Enemy, AuthorName = "Silent Protagonist")
value = 12 + Random % 2

[State 180, 1]
type = ChangeState
trigger1 = prevstateno = 300
value = 300

[State 180, 1]
type = ChangeState
trigger1 = !Time
value = 181

;---------------------------------------------------------------------------
; Win pose 1 
; CNS difficulty: basic
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------

;Preintro
[Statedef 190]
type=S
ctrl=0
velset=0,0

[State 190, ComboReset]
type = VarSet
trigger1 = !Time
var(21) = 0

[State 190, 0]
type = ChangeState
trigger1 = Time
value = 191 + (Random % 2)
ctrl = 0

;===========================================================================
; Intros
;===========================================================================

; Dactyl Intro
[Statedef 191]
type = A
physics = N
ctrl = 0
anim = 191
velset = 0,0
sprpriority = 1

[State 191, 0]
type = VarSet
trigger1 = !Time
fvar(0) = Pos X 

[State 191, 1] 
type = ScreenBound
trigger1 = 1
value = 0

[State 191, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 191

[State 191, Start Pos]
type = PosSet
trigger1 = !Time
Y = -180
X = -110 * Facing

[State 191, 1] ;Freeze animation until PreIntro is over
type = Helper
trigger1 = !Time
helpertype = normal ;player
name = "Dactyl"
ID = 1910
stateno = 1910
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 191, Go down]
type = PosSet
triggerall = NumHelper(1910)
trigger1 = Anim = 191
X = Helper(1910), Pos X
Y = (Helper(1910), Pos Y) - 25

[State 191, Jump!]
type = ChangeAnim
triggerall = NumHelper(1910)
trigger1 = Helper(1910), Anim = 7112
trigger1 = Helper(1910), AnimElemTime(3) = 20
value = 42
persistent = 0

[State 191, Jump!]
type = VelSet
trigger1 = Anim = 42
X = ((fvar(0) - Pos X)/20.0)*Facing
Y = -4
persistent = 0

[State 192, Snd]
type = PlaySnd
trigger1 = anim = 42
value = S7000,2
persistent = 0

[State 191, Jump!]
type = VelAdd
trigger1 = Anim = 42
Y = 0.54

[State 191, Land]
type = VelSet
trigger1 = Anim = 42 && Pos Y >= 0
Y = 0
X = 0

[State 191, Land]
type = StateTypeSet
trigger1 = Anim = 42 && Pos Y >= 0
statetype = S
persistent = 0

[State 191, Land]
type = PosSet
trigger1 = Anim = 42 && Pos Y >= 0
Y = 0
X = fvar(0)
persistent = 0

[State 191, Land]
type = ChangeAnim
trigger1 = Anim = 42 && Pos Y >= 0
value = 47
persistent = 0

[State 191, Land]
type = ChangeAnim
trigger1 = Anim = 47 && !AnimTime
value = 0
persistent = 0

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 3] ;Change to stand state when done
type = ChangeState
trigger1 = Anim = 0 && !NumHelper(1910)
value = 0

;Dactyl Landing and Leaving
[Statedef 1910]
type = S
ctrl = 0
anim = 7111
sprpriority = 2

[State 1911, Vel]
type = VelSet
trigger1 = !Time
trigger1 = !(var(0) := 0)
Y = 0.7

[State 1911, Snd]
type = PlaySnd
trigger1 = Anim = 7112 && (AnimElemTime(2) = 1)
value = S7050,2

[State 1911, Snd]
type = PlaySnd
trigger1 = Anim = 7111 && (AnimElemTime(1) = 0 || !AnimTime)
trigger2 = Anim = 7112 && (AnimElemTime(1) = 1)
trigger3 = Anim = 7113 && (AnimElemTime(1) = 0 || !AnimTime)
value = S7000,0

[State 1911, Vel]
type = ChangeAnim
trigger1 = Pos Y >= -30
value = 7112
persistent = 0

[State 1911, Vel]
type = VelSet
trigger1 = Pos Y >= -30
y = 0.4
persistent = 0

[State 1911, Vel]
type = VelSet
trigger1 = Pos Y >= 0
Y = 0

[State 1911, Vel]
type = PosSet
trigger1 = Pos Y >= 0
Y = 0

[State 1911, Takeoff]
type = ChangeAnim
trigger1 = parent, Anim = 0
value = 7113
persistent = 0

[State 1911, Takeoff]
type = ChangeAnim
trigger1 = Anim = 7113 && !AnimTime
trigger1 = (var(0) := 1)
value = 7111
persistent = 0

[State 1911, Takeoff]
type = VelSet
trigger1 = parent, Anim = 0
Y = -0.7
persistent = 0

[State 1911, Takeoff]
type = VelAdd
trigger1 = parent, Anim = 0
Y = -0.04

[State 1911, Takeoff]
type = DestroySelf
trigger1 = ScreenPos Y < -30
trigger1 = var(0) > 0
trigger2 = RoundState > 1

;---------------------------------------------------------------------------
; Reptites Intro
[Statedef 192]
type = A
physics = N
movetype = I
ctrl = 0
anim = 190
sprpriority = 1

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, StartPos]
type = VarSet
trigger1 = !Time
fvar(0) = Pos X

[State 192, Spawn Reptites]
type = Helper
trigger1 = Anim = 190
trigger1 = (NumHelper(1920) < 5)
helpertype = normal ;player
name = "Reptite"
ID = 1920
stateno = 1920
postype = p1
pos = - (NumHelper(1920)*10 - (Random % 3)), IfElse((NumHelper(1920)% 2), -2,2)
facing = 1
keyctrl = 0
ownpal = 1

[State 192, StartPos]
type = PosAdd
trigger1 = NumHelper(1920) = 5
X = Facing * (IfElse(Facing = 1, -20, 340) - ScreenPos X)
persistent = 0

[State 192, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 192, StartPos]
type = AssertSpecial
trigger1 = Anim = 190
flag = Invisible

[State 192, StartPos]
type = PlaySnd
trigger1 = Time = 20 
value = 7050,2

[State 192, StartPos]
type = PlaySnd
trigger1 = Time = 90
value = 7050,0

[State 192, StartPos]
type = PlaySnd
trigger1 = AnimElem = 4 && Anim = 192 
value = 7030,0

[State 192, StartPos]
type = ChangeAnim
trigger1 = Time = 100
value = 42

[State 192, StartPos]
type = VelSet
trigger1 = Time = 100
X = 4.7

[State 192, Land]
type = ChangeAnim
trigger1 = Anim = 42 && Abs(Pos X - FVar(0)) < 50
value = 192
persistent = 0

[State 192, Land]
type = PosSet
trigger1 = Anim = 192 && AnimElem = 2
Y = 0
persistent = 0

[State 192, StartPos]
type = VelAdd
triggerall = Time > 100 && (Vel X - 0.07) > 0
trigger1 = Facing = 1 && Pos X < FVar(0)
trigger2 = Facing = -1 && Pos X > FVar(0)
X = -0.081

[State 192, StartPos]
type = VelSet
triggerall = Anim = 192
trigger1 = Facing = 1 && (Pos X) >= FVar(0)
trigger2 = Facing = -1 && (Pos X) <= FVar(0)
X = 0

[State 192, StartPos]
type = PosSet
triggerall = Anim = 192
trigger1 = Facing = 1 && (Pos X) >= FVar(0)
trigger2 = Facing = -1 && (Pos X) <= FVar(0)
X = FVar(0)

[State 192, Land]
type = StateTypeSet
trigger1 = Anim = 192 && !AnimTime
statetype = S
persistent = 0

[State 192, Land]
type = ChangeState
trigger1 = Anim = 192 && !AnimTime
value = 0
persistent = 0

; Reptite
[Statedef 1920]
type = S
physics = N
ctrl = 0
anim = 7121
velset = 0,0
sprpriority = 1

[State 1920, Random Start]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 1920, Random Start]
type = ChangeAnim
trigger1 = !Time
value = 7121
elem = (random % 20) + 1

[State 1920, SprPriority]
type = SprPriority
trigger1 = !Time
value = IfElse(Pos Y < 0, 0, 2)

[State 1920, SprPriority]
type = ChangeAnim
triggerall = (Parent, Anim = 42 || Parent, Anim = 192) && Anim = 7121 
trigger1 = Facing = 1 && (Parent, Pos X) >= Pos X
trigger2 = Facing = -1 && (Parent, Pos X) <= Pos X
value = 7122
persistent = 0

[State 1920, SprPriority]
type = VelSet
trigger1 = AnimElem = 1 && Anim = 7122
X = (Random/1000.0) * 4 + 2
Y = - (Random/1000.0) * 4 - 2

[State 1920, Shake]
type = PalFx
trigger1 = AnimElem = 1 && Anim = 7122
add = 200, 200, 200
mul = 256, 256, 256
time = 4

[State 1920, Shake]
type = EnvShake
trigger1 = AnimElem = 1 && Anim = 7122
time = 3
freq = 120
ampl = 2

[State 1920, Shake]
type = PlaySnd
trigger1 = AnimElem = 1 && Anim = 7122
value = 7020,1

[State 1920, Rotate]
type = PosAdd
trigger1 = Anim = 7122
Y = -15
persistent = 0

[State 1920, Var]
type = VarSet
trigger1 = !Time
var(0) = IfElse(random % 2 = 0, -1, 1)

[State 1920, Angle]
type = AngleSet
trigger1 = !Time
value = 0

[State 1920, Rotate]
type = AngleAdd
trigger1 = Anim = 7122
value = (12 + (random % 3))* var(0)

[State 1920, Rotate]
type = AngleDraw
trigger1 = Anim = 7122

[State 1920, Trans]
type = Trans
trigger1 = Anim = 7122 && AnimElemTime(1) > 10
trans = addalpha
alpha = 256 - (AnimElemTime(1)-10)*8, (AnimElemTime(1)-10)*8

[State 1920, End]
type = DestroySelf
trigger1 = Anim = 7122
trigger1 = AnimElemTime(1) >= 42
trigger2 = RoundState > 1


;---------------------------------------------------------------------------
; Taunt
; CNS difficulty: easy
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 1

[State 195, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7030,0

[State 195, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = S7010,1

[State 195, 1]
type = CtrlSet
trigger1 = Time = 40
value = 1

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; WinPoses
;===========================================================================

;SGS
[Statedef 300]
type = S
sprpriority = -1

[State 362, Anim]
type = ChangeAnim
trigger1 = PrevStateNo = 2102 && !AnimTime
value = 2104

[State 362, Kanji]
type = helper
trigger1 = !time && PrevStateNo = 2102 && !numhelper(2103)
helpertype = normal
stateno = 2103
ID = 2103
postype = left
ownpal = 1
persistent = 0

[State 362, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1

;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------