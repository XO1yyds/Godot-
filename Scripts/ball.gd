extends CharacterBody2D


@export var BaseVelocity := Vector2(10.0, 10.0)

var PaddleSpeed
var Direction

func _ready() -> void:
	add_to_group("ball")
	randomize()
	
	PaddleSpeed = get_node_or_null("../../Paddle").PaddleVelocity
	#Direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	var angle = randf_range(deg_to_rad(-60), deg_to_rad(60))#随机发射角度
	print(angle)
	Direction = Vector2(cos(angle), sin(angle)).normalized()#发角度更改为发射向量
	print(Direction)
	Direction.y = -abs(Direction.y)#强调向上发射
	velocity = Direction * BaseVelocity#初始化速度

func _physics_process(delta: float) -> void:
	var Collision = move_and_collide(velocity*delta*60)#移动与碰撞检测
	if Collision:
		var Collider = Collision.get_collider()#获取碰撞体信息
		if Collider.name == "Paddle":
			Paddle_Collision(Collision, PaddleSpeed)
		elif Collider.is_in_group("bricks") or Collider.name == "Brick" :
			Brick_Collision(Collision)
		else:
			Normal_Collision(Collision)
	
func Normal_Collision(collision: KinematicCollision2D):#常规碰撞——法线折射
	var normal = collision.get_normal()
	velocity = velocity.bounce(normal)
	
func Paddle_Collision(collision: KinematicCollision2D, Paddle: float):#挡板碰撞逻辑
	var CollisionVelocity : Vector2
	CollisionVelocity = Vector2(Paddle* 0.8 + velocity.x, max(-velocity.y * 1.1 ,-15))
	if abs(CollisionVelocity.x) > BaseVelocity.x * 1.5:
		CollisionVelocity.x = velocity.x * 0.9
	elif abs(CollisionVelocity.x) < BaseVelocity.x * 0.7:
		CollisionVelocity.x = velocity.x * 1.1
	velocity = CollisionVelocity
	
func Brick_Collision(collision: KinematicCollision2D):#砖块碰撞逻辑
	var normal = collision.get_normal()
	velocity = velocity.bounce(normal)
	
	var exit = collision.get_collider()
	exit.die()
	
#func OnDeathArea(body: Node2D):#死亡逻辑
	#if body:
		#queue_free()
		#print(body.name + "game over")

func SplitBall():
	call_deferred("OnDoubleBallEnter")
	
func OnDoubleBallEnter():
	var new_ball = duplicate()
	get_parent().add_child(new_ball)
	
	var random_angle = randf_range(-0.3,0.3)
	new_ball.velocity = velocity.rotated(random_angle)
	#new_ball.call_deferred("set_initial_velocity", velocity, random_angle)

	return new_ball
	
