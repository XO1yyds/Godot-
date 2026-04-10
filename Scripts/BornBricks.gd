extends Node

# 拖拽你的砖块预制体到这里
@export var brick_scene: PackedScene

# 排列设置
@export var cols: int = 14    # 一行多少个
@export var rows: int = 10     # 多少行
@export var brick_width: float = 50   # 砖块宽度
@export var brick_height: float = 20   # 砖块高度
@export var top_margin: float = 10   # 起始Y坐标

func _ready():
	create_bricks()

# 自动生成并排列砖块
func create_bricks():
	var screen_center = get_viewport().get_visible_rect().size / 2

	# 2. 计算整体砖块阵列的总宽度、总高度
	var total_width = cols * brick_width
	#var total_height = rows * brick_height

	# 3. 计算起始点（让整个阵列居中）
	# 水平居中（左右对称）
	var start_x = screen_center.x - total_width / 2 + 25
	# 垂直居中（可自行调整 top_margin）
	var start_y = top_margin
	for y in range(rows):
		for x in range(cols):
			# 实例化砖块
			var brick = brick_scene.instantiate()
			add_child(brick)
			
			# 自动计算位置 → 核心排列逻辑
			brick.position.x = start_x + x * brick_width
			brick.position.y = start_y + y * brick_height
