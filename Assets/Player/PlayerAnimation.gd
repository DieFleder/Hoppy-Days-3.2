extends AnimatedSprite



func _on_Player_animate(motion):
	if motion.y < 0:
		jump()
	elif motion.x > 0:
		move_right()
	elif motion.x < 0:
		move_left()
	else:
		idle()


func jump():
		play("jump")
	

func move_right():
		flip_h = false
		play("walk")
	

func move_left():
		flip_h = true
		play("walk")
	

func idle():
	play("idle")
