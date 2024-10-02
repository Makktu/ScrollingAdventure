extends Sprite2D

func appearance_of_menace():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.4,1.4), 1)

func _on_visible_on_screen_notifier_2d_screen_entered():
	appearance_of_menace()

func _on_visible_on_screen_notifier_2d_screen_exited():
	scale.x = 0.01
	scale.y = 0.01
