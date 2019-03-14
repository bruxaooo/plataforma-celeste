/// @description Insert description here
// You can write your code in this editor

if(timer>0)timer--;
else voltar=true;

//indo para meu destino
if(voltar && !voltei)
{
	speed=0;
	image_angle=point_direction(x,y,dest_x,dest_y);
	
	x+=lengthdir_x(spd,image_angle);
	y+=lengthdir_y(spd,image_angle);
	
	if(abs(x-dest_x)< 5 && abs(y-dest_y)<5)
	{
		voltei=true;
		global.quant++;
	}
	
}

if(global.quant>=max_quant)
{
	room_restart();
	global.quant=0;
}


