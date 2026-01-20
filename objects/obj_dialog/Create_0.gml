global.game_paused = true;
depth = -1000006;

if (!variable_instance_exists(id, "portrait")) portrait = -1;
if (!variable_instance_exists(id, "name_str")) name_str = "";
if (!variable_instance_exists(id, "lines"))    lines = ["..."];
if (!variable_instance_exists(id, "line_i"))   line_i = 0;