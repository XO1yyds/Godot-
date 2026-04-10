extends Area2D

@export var VerticalSpeed := 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += VerticalSpeed * delta * 60

		
func OnDoubleBallEnter(body: Node2D):
	if body and body.name == "Paddle":
		get_tree().call_group("ball", "SplitBall") 
		queue_free()
