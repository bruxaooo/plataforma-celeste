/// @description Insert description here
// You can write your code in this editor



//colisao horizontal

if(place_meeting(x+h_spd,y,o_plat))
{
	while(!place_meeting(x+sign(h_spd),y,o_plat))
	{
		x+=sign(h_spd);
	}
	h_spd=0;
}


x+=h_spd;
x=clamp(x,0+sprite_width/2,room_width-sprite_width/2);


//colisao vertical

if(place_meeting(x,y+v_spd,o_plat))
{
	while(!place_meeting(x,y+sign(v_spd),o_plat))
	{
		y+=sign(v_spd);
	}
	v_spd=0;
}


y+=v_spd;