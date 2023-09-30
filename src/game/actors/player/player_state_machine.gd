extends "../state_machine.gd"

func _ready():
	states_map = {
		"staggering": owner.get_node("states/staggering"),
		"running": owner.get_node("states/running"),
		"jumping": owner.get_node("states/jumping"),
		"falling": owner.get_node("states/falling"),
	}

func _change_state(state_name):
	"""
	The base state_machine interface this node extends does most of the work
	"""
	if not _active:
		return
	if current_state.name == state_name:
		return

	if state_name != "previous":
		states_stack.push_front(states_map[state_name])
	if state_name in ["jumping", "falling"]:
		states_map[state_name].initialize(current_state.VELOCITY)
	._change_state(state_name)

func _input(event):
	"""
	Here we only handle input that can interrupt states, attacking in this case
	otherwise we let the state node handle it
	"""
#	if event.is_action_pressed("attack"):
#		if current_state == $Attack:
#			return
#		_change_state("attack")
#		return
	current_state.handle_input(event)
