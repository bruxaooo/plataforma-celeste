/// @description Insert description here
// You can write your code in this editor

//rodando
image_angle+=rot;


switch(estado)
{
	case"avanca":
	
		//descobrindo a direcao do limite
		var limite_x = lengthdir_x(limite,dir);
		var limite_y = lengthdir_y(limite,dir);
	
		//movendo
		x+=lengthdir_x(vel,dir);
		y+=lengthdir_y(vel,dir);
		
		//trocando de estado
		if(limite_x>0)//tenho que ir para direita
		{
			if(x>=xstart+limite_x)estado="recua";
		}
		else if(limite_x<0)//tenho que ir para esquerda
		{
			if(x<=xstart+limite_x)estado="recua";
		}
		
		
		if(limite_y>0)//tenho que ir para para cima
		{
			if(y>=ystart+limite_y)estado="recua";
		}
		else if(limite_y<0)//tenho que ir para baixo
		{
			if(y<=ystart+limite_y)estado="recua";
		}
		
	
		break;
	case"recua":
		//movendo
		x-=lengthdir_x(vel,dir);
		y-=lengthdir_y(vel,dir);
		
		//mudando estado
		if(x==xstart && y==ystart)estado="avanca";
		
		
		
		break;
	case"parado":
	
		break;
	default:
		show_message("estado errado!!");
		break;
}

if(pai!= noone)
{
	//alguem me criou
	var col = instance_place(x,y,o_plat);
	if(col)
	{	// checando se esta havendo colisao 
		//checar se 'e com meu pai 		
		if(col!=pai)instance_destroy(); 
	}
}

