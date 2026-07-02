extends Panel
@onready var time_survived_label: Label = $TimeSurvivedLabel

func _process(_delta: float) -> void:
	time_survived_label.text = str(SurvivalTimer._get_survival_seconds())
