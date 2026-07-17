# remove mouse accel

hl.config({
    input = {
        accel_profile = "flat",
        force_no_accel = true,
    },
})

# Fuzzel keybinds
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("ssh-menu.sh"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("power-menu.sh"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("todo.sh"))