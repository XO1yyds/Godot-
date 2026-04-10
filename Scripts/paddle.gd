extends AnimatableBody2D

@export var Velocity := 40
var PaddleVelocity : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	if direction:
			if position.x >= 0 and position.x <= 720:
				PaddleVelocity = direction * Velocity 
				var pos = position.x + PaddleVelocity * delta * 60
				position.x = max(0, min(720, pos))
