extends Node

@export var Mob: PackedScene

var score: int

func _ready() -> void:
	new_game()

func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game() -> void:
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_player_hit() -> void:
	game_over()

func _on_mob_timer_timeout() -> void:
	$MobPath/MobSpawnLocation.progress_ratio = randf()

	var mob = Mob.instantiate()
	add_child(mob)

	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	mob.position = $MobPath/MobSpawnLocation.position
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	mob.linear_velocity = Vector2(
		randf_range(mob.min_speed, mob.max_speed),
		0
	).rotated(direction)

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
