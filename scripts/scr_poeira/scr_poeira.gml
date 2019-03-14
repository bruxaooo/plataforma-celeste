///@desc scr_poeira(chance,xx,yy,obj)
///@param chance
///@param xx
///@param yy
///@param obj

var porcentagem=argument0;
var xx = argument1;
var yy = argument2;
var obj = argument3; 

var chance = random(100);
if(chance>porcentagem)
{
	for(var i=0;i<irandom_range(4,10);i++)
	{
		instance_create_layer(xx,yy,"player_rastro",obj);
	}
}