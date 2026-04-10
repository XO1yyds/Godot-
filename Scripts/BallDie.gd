extends Area2D


# Called when the node enters the scene tree for the first time.
func OnDeathArea(body: Node2D):#死亡逻辑
	if body:
		print(body.name + "game over")
		body.free()

func OnDeathArea2(area: Area2D):#死亡逻辑
	if area:
		print(area.name + "game over")
		area.free()
