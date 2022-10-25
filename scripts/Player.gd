extends Area2D
signal pickup
signal hurt

export (int) var speed
var velocity:Vector2=Vector2.ZERO
var ScreenSize:Vector2

	
#this function executes every frame
func _process(delta):
	get_input()
	position+=velocity*delta
	position.x=clamp(position.x,0,ScreenSize.x)
	position.y=clamp(position.y,0,ScreenSize.y)
	

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

func start(pos):
	set_process(true)
	position=pos	


func _on_Player_area_entered(area):
	if area.is_in_group("coins"):
		area.pickup()
		emit_signal("pickup")
		print("coin picked up")
	if area.is_in_group("obs"):
		emit_signal("hurt")
		die()
		print("died!")
		
		
	#pass # Replace with function body.
