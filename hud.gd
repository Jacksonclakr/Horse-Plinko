extends CanvasLayer 
signal new_round
var score = 0
var rotating = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$restart.hide()
	$star.hide()
	$star2.hide()
	$Label.text = ("Score: "+ str(Liam.score))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (rotating):
		$star.rotate(3*delta)
		$star2.rotate(3*delta)

func _on_restart_pressed():
	rotating = false
	$restart.hide()
	$star.hide()
	$star2.hide()
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
	$star2.show()
	rotating = true
