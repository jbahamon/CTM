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

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, ComboReset]
type = VarSet
trigger1 = !Time
var(21) = 0

[State 190, 0]
type = ChangeState
trigger1 = Time
value = 191 ;+ (Random % 2)
ctrl = 0

;===========================================================================
; Intros
;===========================================================================

;Prophet Intro
[Statedef 191]
type = S
ctrl = 0
anim = 1901
velset = 0,0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 1901

[State 194, helper]
type = Helper
trigger1 = !Time
name = "Alfador"
ID = 191
stateno = 1910
postype = p1
pos = -30, 0
ownpal = 1
persistent = 0

[State 192, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;Alfador
[Statedef 1910]
type = S
ctrl = 0
anim = 7150
velset = 0,0

[State 192, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 7150

[State 192, 1] ;Freeze animation until PreIntro is over
type = Turn
trigger1 = AnimElemTime(4) = 1
persistent = 0

[State 192, 1] ;Freeze animation until PreIntro is over
type = VelSet
trigger1 = AnimElemNo(0) >= 4
X = 2.2

[State 192, 3] ;End
type = DestroySelf
trigger1 = FrontEdgeBodyDist < -20

;---------------------------------------------------------------------------
; Taunt - Magic Toggle
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 1

[State 200, Explod]
type = RemoveExplod
trigger1 = !Time
ID = 200
ignorehitpause = 1

[State 195, Switch Element]
type = VarSet
trigger1 = !Time
trigger1 = !Var(21)
V = 59
value = (Var(59) + 1) % 3

[State 200, Explod]
type = Explod
trigger1 = !Time
trigger1 = !Var(21)
anim = 7020 + Var(59)
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

[State 195, Snd]
trigger1 = !Time
type = PlaySNd
channel = 0
value = S7100,3

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; WinPoses
;===========================================================================


;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------