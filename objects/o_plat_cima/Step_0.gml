/// @description Insert description here
// You can write your code in this editor
if(instance_exists(o_player))
{
	if(o_player.y>y)//estou mais alto que o player
	{
		mask_index=s_not_colision;
	}
	else
	{
		mask_index=s_plat_cima;
	}
}
