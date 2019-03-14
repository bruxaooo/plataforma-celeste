/// @description Insert description here
// You can write your code in this editor

var serra =instance_create_layer(x,y,"camera",o_serra);

serra.dir=dir;
serra.estado="avanca";
serra.limite=3000;
serra.vel=vel;
serra.rot=rot
serra.image_xscale=.2;
serra.image_yscale=serra.image_xscale;
serra.pai = self;


alarm[0]=room_speed*alarme;