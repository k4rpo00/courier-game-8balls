depth = -1000004; 

global.game_paused = true;

line_i = 0;

if (!variable_instance_exists(id, "portrait")) portrait = -1;
if (!variable_instance_exists(id, "lines")) {
    lines = ["..."];
}