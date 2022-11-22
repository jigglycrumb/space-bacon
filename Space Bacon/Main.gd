extends Node

export var GAME_TIME = 60

export (PackedScene) var star_scene
export (PackedScene) var bacon_scene
export (PackedScene) var vacuum_scene

var screen_size
var score
var time_left

func _ready():
	randomize()
	time_left = GAME_TIME
	screen_size = get_viewport().size
	score = 0
	for _i in range(50):
		spawn_star(randi() % int(screen_size.x), randi() % int(screen_size.y))
		$BackgroundMusicPlayer.play()
	
func _process(_delta):
	if(time_left) <= 0:
		end_game()
	
func _on_StarTimer_timeout():
	spawn_star(screen_size.x + 50, randi() % int(screen_size.y))

func _on_BaconTimer_timeout():
	var bacon = bacon_scene.instance()
	bacon.position.x = screen_size.x + 50
	bacon.position.y =  randi() % int(screen_size.y)
	add_child(bacon)

func _on_Player_eat():
	score += 1
	$HUD.update_score(score)

func _on_StartScreen_new_game():
	score = 0
	time_left = GAME_TIME
	$Player.position.x = 500
	$Player.position.y = screen_size.y / 2
	$Player.visible = true
	$HUD.update_score(score)
	$HUD.update_time_left(time_left)
	$HUD.visible = true
	$StartScreen.visible = false
	$BaconTimer.start()
	$GameTimer.start()
	set_vacuum_timer()
	$VacuumTimer.start()
	
func _on_GameTimer_timeout():
	time_left -= 1	
	$HUD.update_time_left(time_left)

# -------------------------------------------------

func spawn_star(x, y):
	var star = star_scene.instance()
	var scale = float((randi() % 150) + 50 ) / 100
	star.scale.x = scale
	star.scale.y = scale
	star.position.x = x
	star.position.y = y
	add_child(star)
	
func end_game():
	$BaconTimer.stop()
	$VacuumTimer.stop()
	$StartScreen.update_final_score(score)
	$StartScreen/FinalScoreLabel.visible = true
	$StartScreen.visible = true
	$HUD.visible = false
	$Player.visible = false
	
	get_tree().call_group("bacon", "queue_free")
	get_tree().call_group("vacuum", "queue_free")

func _on_VacuumTimer_timeout():
	var vacuum = vacuum_scene.instance()
	vacuum.position.x = screen_size.x + 50
	vacuum.position.y =  randi() % int(screen_size.y)
	add_child(vacuum)
	set_vacuum_timer()
	

func set_vacuum_timer():
	$VacuumTimer.wait_time = (randi() % 3) + 2
