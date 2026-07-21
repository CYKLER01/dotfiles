hl.config({
	input = {
		accel_profile = "flat",
		force_no_accel = true,
	},
})

hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty --directory ~"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("bash /home/cykler/.local/bin/ssh-menu.sh"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("bash /home/cykler/.local/bin/power-menu.sh"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("bash /home/cykler/.local/bin/todo-list.sh"))
