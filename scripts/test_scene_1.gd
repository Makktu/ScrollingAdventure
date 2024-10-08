extends Control

@onready var cam_position_x = $Camera2D.position.x
@onready var cam_position_y = $Camera2D.position.y
#@onready var this_area = $Area
@onready var move_timer = $MoveTimer
@onready var test_scene_2 = $test_scene2
@onready var area_1 = $Area1
@onready var this_area = test_scene_2
@onready var battle_ui = $battle_ui
@onready var main_ui = $main_ui
@onready var show_battle_ui_timer = $ShowBattleUITimer

var area = 2
var current_location = 1 # starting square

var battle_ui_showing = false

var level_size = 4 # signifying a 4x4 grid of locations
# ==========================================================================
#var no_entry_1 = [11,13,15,16,18,20,23,28,42,47,61,63,65,66,68,70,73,78,92,97]
var no_entry_1 = [4,6]

var allowed_moves = [
	[0,1,0,0,0,0],
	[0,1,1,1],
	[0,1,0,1],
	[0,0,1,1],
	[0,0,1,0],
	[1,1,1,0],
	[0,0,0,1],
	[1,0,0,0],
	[1,1,0,0],
	[1,1,1,1],
	[0,1,0,1],
	[0,0,0,1],
	[0,1,0,0],
	[1,1,0,1],
	[0,1,0,1],
	[0,0,0,1],
		]

# where the player cannot go================================================

var input_given = false

var x_pos = 0
var y_pos = 0


func _ready():
	if area == 2:
		area_1.visible = false
		test_scene_2.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if current_location == 6 and not battle_ui_showing:
		battle_ui_showing = true
		show_battle_ui_timer.start()
	
	if battle_ui_showing and current_location != 6:
		battle_ui.visible = false
		battle_ui_showing = false
	
	if Input.is_action_just_pressed("ui_right") and !input_given and !battle_ui_showing:
		if allowed_moves[current_location - 1][1] == 0:
				print("can't go that way!")
				return
		current_location += 1
		print(current_location)
		input_given = true
		move_timer.start()
		movement(1)

	if Input.is_action_just_pressed("ui_left") and !input_given and !battle_ui_showing:
		if allowed_moves[current_location - 1][3] == 0:
				print("can't go that way!")
				return
		current_location -= 1
		print(current_location)
		input_given = true
		move_timer.start()
		movement(3)

	if Input.is_action_just_pressed("ui_up") and !input_given and !battle_ui_showing:
		if allowed_moves[current_location - 1][2] == 0:
				print("can't go that way!")
				return
		current_location += level_size
		print(current_location)
		input_given = true
		move_timer.start()
		movement(0)

	if Input.is_action_just_pressed("ui_down") and !input_given and !battle_ui_showing:
		if allowed_moves[current_location - 1][0] == 0:
				print("can't go that way!")
				return
		current_location += -level_size
		print(current_location)
		input_given = true
		move_timer.start()
		movement(2)

		
func movement(direction = 99):
	move_camera(direction)
		
func move_camera(direction):
	if direction == 99:
		print("no direction")
	var x_dir = 0
	var y_dir = 0
	if direction == 0:
		y_dir = -1280
	if direction == 1:
		x_dir = -720
	if direction == 2:
		y_dir = 1280
	if direction == 3:
		x_dir = 720
	x_pos += x_dir
	y_pos += y_dir
		
	# move the world
	var tween = create_tween()
	tween.tween_property(this_area, "position", Vector2(x_pos, y_pos), 0.45)
	#x_dir = 0
	#y_dir = 0
	#if direction == 0:
		#y_dir = -10
	#if direction == 1:
		#x_dir = 10
	#if direction == 2:
		#y_dir = 10
	#if direction == 3:
		#x_dir = -10
	#tween.tween_property(this_area, "position", Vector2(x_pos + x_dir, y_pos + y_dir), 0.075)
	#tween.tween_property(this_area, "position", Vector2(x_pos + -x_dir, y_pos + -y_dir), 0.025)


func _on_move_timer_timeout():
	input_given = false


func _on_show_battle_ui_timer_timeout():
	battle_ui.visible = true
