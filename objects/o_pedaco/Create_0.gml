/// @description Insert description here
// You can write your code in this editor

voltar=false;
timer=room_speed*.5;

dest_x=0;
dest_y=0;

spd=random_range(7,10);
voltei=false;


max_quant=10;
if(instance_exists(o_player))instance_destroy(o_player);