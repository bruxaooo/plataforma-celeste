/// @description Insert description here
// You can write your code in this editor

// checando se a proxima room
if(qtd<=0)
{
	if(room_next(room)!=-1)
	{
		room_goto_next();
	}
	else
	{
		room_restart();
	}
}


