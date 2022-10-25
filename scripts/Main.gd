extends "res://scripts/gamemode.gd"

export (PackedScene) var Coin
export (int) var PlayTime
export (float) var Difficulty
var ScreenSize:Vector2

func _ready():
	randomize()
	ScreenSize=get_viewport().get_visible_rect().size
	$Player.ScreenSize=ScreenSize
	$Player.hide()
	NewGame()

	
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
	for i in range(Difficulty*Level):
		var c= Coin.instance()
		$CoinContainer.add_child(c)
		c.position=Vector2(rand_range(0,ScreenSize.x),rand_range(0,ScreenSize.y))



	
