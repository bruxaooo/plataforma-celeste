/// @description Insert description here
// You can write your code in this editor

//verificacao

chao=place_meeting(x,y+1,o_plat);
//paredes
parede_dir=place_meeting(x+1,y,o_plat);
parede_esq=place_meeting(x-1,y,o_plat);

// verifico qual foi a ultima parede a ser tocada
	if(parede_dir||parede_esq)
	{
	 if(parede_dir)ultima=-1;
	 else ultima=1;
	}



//definindo timer do pulo
if(chao)timer_pulo=limite_pulo;

else if(timer_pulo>0)timer_pulo--;

// se toquei em uma parede meu timer 'e 6
if(parede_dir||parede_esq)timer_parede=limite_parede;
else if(timer_parede>0)timer_parede--;





//controles
var left,right,up,down,jump,jump_s,avanco_h,dash;


left=keyboard_check(ord("A"))||keyboard_check(vk_left);
right=keyboard_check(ord("D"))||keyboard_check(vk_right);
up=keyboard_check(ord("W"))||keyboard_check(vk_up);
down=keyboard_check(ord("S"))||keyboard_check(vk_down);
jump=keyboard_check_pressed(vk_space);
jump_s=keyboard_check_released(vk_space);
dash=keyboard_check_pressed(vk_shift);


//configurando infos de movimentacao
avanco_h = (right-left)*max_h_spd;
if(chao) acel=acel_chao;
else acel=acel_ar;

//buffer do pulo 
if(jump)timer_queda=limite_buffer;
if(timer_queda>0)buffer_pulo=true;
else buffer_pulo=false;
if(buffer_pulo)timer_queda--;


//carga do dash
if(chao)carga=1;


//--------------state machine-----------------
switch(estado)
{
//=====================================  morte  ===================================================		

	case state.morte:
		//explodindo o player
		for(var i=0;i<10;i++)
		{
			var p = instance_create_layer(x,y,"player",o_pedaco);
			p.speed=random_range(2,4);
			p.direction=random(360);
			p.image_angle=p.direction;
			p.image_yscale=random_range(.2,.6);
			p.image_xscale=p.image_yscale;
			p.dest_x = xstart;
			p.dest_y = ystart;
			p.image_blend=make_color_hsv(20,sat,255);
		}
		
		break;
//=========================================  movendo  =========================================		
	
	case state.movendo:
		
		//aplicando movimentacao
		h_spd=lerp(h_spd,avanco_h,acel);
		
		
		//criando poeira ao andar
		if(abs(h_spd)>max_h_spd-.5 && chao)
		{
			//criando poeira
			scr_poeira(85,random_range(x-sprite_xoffset,x+sprite_xoffset),y,o_poeira);
		}
		
		
	
		//dash
		if(dash && carga>0)
		{
			carga--;
			//definindo direcao do dash
			if(up||down||right||left)dir= point_direction(0,0,(right-left),(down-up));
				//indo na direcao que estou olhando se nao estiver precionando uma direcao
			else dir = point_direction(0,0,ver,0);
			
			
			estado=state.dash;
		}
		
		
		// pulo 
		if(jump && timer_pulo)
		{
			estado=state.pulo;
		}
		
		//gravidade && salto da parede
		if(jump_s && v_spd<0)grav = .5;
		else if(chao)grav=.3;
		
		
		/* 
		nao precisso adicionar as condicoes ||parede_dir||parede_esq 
		pois apos tocar em uma parede meu timer_parede vai ser >0	
		*/
		if(!chao &&(timer_parede>0))
		{
			//nao eestou no chao , mas estou na parede
			//se estiver caindo  - alterando gravidade
			if(v_spd>0)
			{
				v_spd=lerp(v_spd,deslize,acel);
				//criando poeira ao deslizar na parede	
				//criando poeira
				scr_poeira(85,x+(parede_dir-parede_esq)*sprite_xoffset,y-sprite_height/2,o_poeira)
				
			}
			else
			{
				v_spd+=grav;
			}
			
			//pulando pelas paredes 
			if(jump)
			{
			  // meu   ultima  guarda qual direcao vou ir 1 ou -1
				h_spd=(ultima)*max_h_spd ;
				v_spd=-max_v_spd;
				xscale=.5;
				yscale=1.5;
			
				
				
				//criando poeira ao deslizar na parede
				//criando poeira
				scr_poeira(85,x+(ultima)*sprite_xoffset,y-sprite_height/2,o_poeira);

			}
			
		}
		else if(!chao)v_spd+=grav;
	
		break;
//=====================================   pulo    ==================================		
	case state.pulo:
			if(buffer_pulo)//posso pular
			{
				if(timer_pulo)
				{
					v_spd=-max_v_spd;
			
					//mudando a escala do player
					xscale=.5;
					yscale=1.5;
		
		
					timer_pulo=0;
					timer_queda=0;
				}
			}
			
			//dash
			if(dash)
			{
				estado=state.dash;
			}
			
			estado=state.movendo;
		break;
//=====================================   dash    ==================================		

	case state.dash:
		
		dura--;
		
		if(chao)carga=0;
		
		h_spd=lengthdir_x(len,dir);
		v_spd=lengthdir_y(len,dir);
		
		
		//criando o rastro
		var rastro = instance_create_layer(x,y,"player_rastro",o_player_rastro);
		rastro.xscale=xscale;
		rastro.yscale=yscale;
		
		
		//saindo do estado
		if(dura <=0)
		{	
			estado = state.movendo;
			dura=room_speed/4;
			
			
			//diminuindo velocidade
			h_spd=(max_h_spd*sign(h_spd)*.5);
			v_spd=(max_v_spd*sign(v_spd)*.5);			
		}
		//deformando o player 
		if(dir ==90 || dir ==270)
		{
			yscale=1.5;
			xscale=.5;
		}
		else
		{
			yscale=.8;
			xscale=1.4;
		}
		
		
		break;

//=====================================  fim state machine    ==================================				
}

//resetando a escala do player
xscale=lerp(xscale,1,.2);
yscale=lerp(yscale,1,.2);



//definindo a cor com base no numero de carga
switch(carga)
{
	case 0:
		sat=lerp(sat,50,.05);
		break;
	case 1:
		sat=lerp(sat,255,.05);
		break;
}
image_blend=make_color_hsv(20,sat,255);



//limitando velocidades
if(estado != state.dash)
{
	v_spd = clamp(v_spd,-max_v_spd,max_v_spd);
}
