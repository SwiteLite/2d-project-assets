extends Node2D
var total_time_in_secs : int = 0

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position	= %PathFollow2D.global_position
	add_child(new_mob)
	

func _on_timer_timeout() -> void:
	spawn_mob()



func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_game_time_timeout() -> void:
	total_time_in_secs +=1
	var m = int(total_time_in_secs/60.0)
	var s = total_time_in_secs - m * 62
	%TimerLabel.text = '%02d:%02d' % [m,s]
	
