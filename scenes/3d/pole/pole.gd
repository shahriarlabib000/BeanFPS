extends StaticBody3D

signal pressed

func btnHit():
	emit_signal("pressed")
