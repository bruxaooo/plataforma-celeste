/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(o_camera))
{
	instance_create_layer(x,y,"camera",o_camera);
}


//========= aceleracao
acel_chao =.1;
acel_ar =.07;
acel=acel_chao;
deslize=2;

//========= velocidades
grav=.3;

v_spd=0;
h_spd=0;

max_v_spd=8;
max_h_spd=6;
len = 10;

	//PAREDE
	limite_parede=6;
	timer_parede=0;
	ultima=0;

	
	//PULO
	limite_pulo = 6;
	timer_pulo=0;
	
	limite_buffer=6;
	timer_queda=limite_buffer;
	buffer_pulo=false;

//========= variaveis de verificacao - controle
chao=false;
parede_dir=false;
parede_esq=false;
estado=state.movendo;
yscale=1;
xscale=1;
dura = room_speed/4;
dir = 0;
carga=1;
ver=1;

global.vivo=true;


//controle da cor 
sat=255;



//state machine
enum state
{
	morte,movendo,pulo,dash,voltar
}
