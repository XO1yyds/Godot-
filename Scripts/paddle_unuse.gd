extends StaticBody2D

@export var move_speed := 10.0
var motion : Vector2
var positiony 
var ball
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positiony = position.y
	ball = get_node("../Ball")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	if direction:
		motion.x = direction * move_speed
	else:
		motion.x = 0
	var collision = move_and_collide(motion)
	if collision:
		var object = collision.get_collider()
		if object.name == "Ball":
			print(position.y)
			motion.y = 0
			position.y = positiony
			print(ball.linear_velocity)
	
