extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_key_pressed(Key.KEY_SPACE):
		#print("space")
	#if Input.is_action_just_pressed("jump"):
		#print("jump")
	#elif Input.is_action_just_released("jump"):
		#print("nojump")
	#elif Input.is_action_pressed("jump"):
		#print("onlyjump")
	print(Input.get_action_strength("jump"))
	print(Input.get_axis("right", "left"))
#func _input(event: InputEvent) -> void:
	#if event is InputEventKey:
		#if event.keycode == KEY_SPACE:
			#if event.is_pressed()&&!event.is_echo():
				#print("down")
			#elif event.is_released():
				#print("up")
	#
	#if event is InputEventMouseButton:
		#if event.is_pressed(): 
			#print(event.position)
			#print(event.button_index )
			#print(event.button_mask)
			#print("按下")
			#
	
