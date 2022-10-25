extends "res://scripts/gamemode.gd"

export (PackedScene) var Coin
export (int) var PlayTime

func _ready():
	randomize()
	$Player.ScreenSize=get_viewport().get_visible_rect().size
	$Player.hide()
	

func NewGame():
	Playing=true
	Level=1
	Score=0
	LeftTime=PlayTime
	$Player.start($PlayerStart.position)
	$Player.show()
	$GameTimer.start()
	SpawnCoins()

func SpawnCoins():
	pass


	
