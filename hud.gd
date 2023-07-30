extends CanvasLayer 
signal new_round
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$restart.hide()
	$star.hide()
	$Label.text = ("Score: "+ str(Liam.score))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_pressed():
	$restart.hide()
	$star.hide()
	await get_tree().create_timer(0.2).timeout
	new_round.emit()
	get_tree().reload_current_scene()


func _on_horse_game_end(sc):
	Liam.score += sc
	$Label.text = ("Score: "+ str(Liam.score))
	$tada.play()
	await get_tree().create_timer(2.0).timeout
	$restart.show()
	$star.show()
