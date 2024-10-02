extends Control

@onready var cam_position_x = $Camera2D.position.x
@onready var cam_position_y = $Camera2D.position.y
@onready var animation_player = $AnimationPlayer
#@onready var this_area = $Area
@onready var move_timer = $MoveTimer
@onready var test_scene_2 = $test_scene2
@onready var area_1 = $Area1
@onready var this_area = test_scene_2
@onready var battle_ui = $battle_ui

var area = 2
var current_location = 1 # starting square

var battle_ui_showing = false

var level_size = 3 # signifying a 4x4 grid of locations
# ==========================================================================
#var no_entry_1 = [11,13,15,16,18,20,23,28,42,47,61,63,65,66,68,70,73,78,92,97]
var no_entry_1 = [4,6]

# where the player cannot go================================================

var input_given = false

var x_pos = 0
var y_pos = 0


func _ready():
	if area == 2:
		area_1.visible = false
		test_scene_2.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if current_location == 5 and not battle_ui_showing:
		battle_ui.visible = true
		battle_ui_showing = true
	
	if battle_ui_showing and current_location != 5:
		battle_ui.visible = false
		battle_ui_showing = false
	
	if Input.is_action_just_pressed("ui_right") and !input_given:
		# check not on edge of map
		var right_check = level_size
		for n in level_size:
			if current_location == right_check:
				print("there is nothing outside the walls")
				return
			right_check += level_size
		# check that right is a legal move
		for n in no_entry_1:
			if current_location + 1 == n:
				print("can't go that way!")
				return
		current_location += 1
		print(current_location)
		input_given = true
		move_timer.start()
		movement(1)

	if Input.is_action_just_pressed("ui_left") and !input_given:
		# check not on edge of map
		var left_check = 1
		for n in level_size:
			if current_location == left_check:
				print("there is nothing outside the walls")
				return
			left_check += level_size
		# check that left is a legal move (no black square)
		for n in no_entry_1:
			if current_location - 1 == n:
				print("can't go that way!")
				return
		current_location -= 1
		print(current_location)
		input_given = true
		move_timer.start()
		movement(3)

	if Input.is_action_just_pressed("ui_up") and !input_given:
		# check not on edge of map
		if current_location + level_size > (level_size * level_size):
			print("there is nothing outside the walls")
			return
		# check that up is a legal move
		for n in no_entry_1:
			if (current_location + level_size) == n:
				print("can't go that way!")
				return
		current_location += level_size
		print(current_location)

		input_given = true
		move_timer.start()
		movement(0)

	if Input.is_action_just_pressed("ui_down") and !input_given:
		# check not on edge of map
		if current_location - level_size <= 0:
			print("there is nothing outside the walls")
			return
		# check that down is a legal move
		for n in no_entry_1:
			if (current_location - level_size) == n:
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


func _on_move_timer_timeout():
	input_given = false
