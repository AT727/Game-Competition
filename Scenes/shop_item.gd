extends PanelContainer

# 1. Get a reference to the AnimationPlayer node 
# The '$' is shorthand for get_node("AnimationPlayer")
@export var anim_player: AnimationPlayer 



# Called when the node enters the scene tree for the first time.
func _ready():
	# We don't need anything here yet, but we keep the function.
	scale = Vector2(1.0, 1.0)  

# Called when the mouse cursor enters the area of the PanelContainer
func _on_mouse_entered():
	# 2. Tell the AnimationPlayer to play the "hover_in" animation (growing)
	anim_player.play("hover_in")


# Called when the mouse cursor leaves the area of the PanelContainer
func _on_mouse_exited():
	# 3. Tell the AnimationPlayer to play the "hover_out" animation (shrinking)
	anim_player.play("hover_out")
