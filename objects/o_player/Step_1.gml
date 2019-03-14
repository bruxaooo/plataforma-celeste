/// @description Insert description here
// You can write your code in this editor

// checando se eu acabei de cair no chao 
var piso = place_meeting(x,y+1,o_plat);


//acabei de tocar no chao
if(piso && !chao)
{
	xscale=1.8;
	yscale=.8;
	  
	//criando poeira
	scr_poeira(0,random_range(x-sprite_xoffset,x+sprite_xoffset),y,o_poeira)

	
}