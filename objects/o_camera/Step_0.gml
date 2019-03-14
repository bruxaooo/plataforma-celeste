/// @description Insert description here
// You can write your code in this editor
if(instance_exists(o_player))
{	
	x=lerp(o_player.x,x,.1);
	y=lerp(o_player.y,y,.1);
		
}
else if(instance_exists(o_pedaco))
{
	x=lerp(x,o_pedaco.dest_x,.03);
	y=lerp(y,o_pedaco.dest_y,.03);
}

//configurando o audio listener
audio_listener_position(x,y,0);

if(instance_exists(o_player))
{
	audio_listener_velocity(abs(o_player.h_spd),abs(o_player.v_spd),0);
}

