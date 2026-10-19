extends RigidBody2D

@export var min_speed = 150
@export var max_speed = 250

func _ready() -> void:
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	pass 

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _process(delta):
	
	pass
