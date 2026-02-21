extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func flash_damage():
	var flash = $CanvasLayer/TextureProgressBar/ColorRect
	flash.color.a = 0.6
	
	var tween = create_tween()
	tween.tween_property(flash, "color:a", 0.0, 0.3)
