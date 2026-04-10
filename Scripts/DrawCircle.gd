extends Sprite2D

@export var Radius  := 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func  _draw() -> void:
	draw_circle(Vector2(0, 0), Radius, Color.WHITE)
