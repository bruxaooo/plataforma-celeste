/// @description Insert description here
// You can write your code in this editor

//gerando os pedacos
for(var i=0;i<irandom_range(20,50);i++)
{
	var ped = instance_create_layer(x,y,"particulas",o_part);
	ped.sprite_index=sprite_index;
}




instance_destroy();