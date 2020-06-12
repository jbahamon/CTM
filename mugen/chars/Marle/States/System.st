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
trigger2 = (Enemy, Name = "Lucca")
trigger2 = (Enemy, AuthorName = "Silent Protagonist")
value = 8

[State 180, Crono]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Crono")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
trigger2 = (Enemy, Name = "Crono")
trigger2 = (Enemy, AuthorName = "Silent Protagonist")
value = 9

[State 180, Marle]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Marle 2")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
trigger2 = (Enemy, Name = "Marle")
trigger2 = (Enemy, AuthorName = "Silent Protagonist")
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
trigger1 = (Enemy, Name = "Magus")
trigger1 = (Enemy, AuthorName = "Silent Protagonist")
value = 12

[State 181, Ayla]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Robo")
trigger1 = (Enemy, AuthorName = "Silent Protagonist")
value = 13

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
value = 191 + (Random % 2)
ctrl = 0

;===========================================================================
; Intros
;===========================================================================

;Weapon Intro
[Statedef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 191

[State 192, 3]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1

[State 192, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;Dress Intro
[Statedef 192]
type = S
ctrl = 0
anim = 192
velset = 0,0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 192

[State 192, 3]
type = PlaySnd
trigger1 = AnimElem = 4
value = S7010,1

[State 192, 3]
type = PlaySnd
trigger1 = AnimElem = 6
value = S7000,1


[State 192, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Taunt 
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 1

[State 192, 3]
type = PlaySnd
trigger1 = !Time
value = S7010,1

[State 195, 2]
type = ChangeState
trigger1 = Time > 42
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------