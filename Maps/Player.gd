extends Area2D
export (int) var speed
var velocity:Vector2=Vector2.ZERO

func _ready():
	start()
	
#this function executes every frame
func _process(delta):
	get_input()
	position+=velocity*delta
	position.x=clamp(position.x,0,get_viewport().get_visible_rect().size.x)
	position.y=clamp(position.y,0,get_viewport().get_visible_rect().size.y)
	

#get_input() handles all the input stuff from player [mouse, keyboard, touch]
func get_input():
	velocity=Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x-=1
	if Input.is_action_pressed("ui_right"):
		velocity.x+=1
	if Input.is_action_pressed("ui_up"):
		velocity.y-=1
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
	
	if velocity.length()>0:
		velocity=velocity.normalized()*speed
		

func die():
	set_process(false)

func start():
	set_process(true)
	
