if(place_free(x, y + 1)){
    gravity_direction = 270;
    gravity = 1;
}else{
    gravity = 0;
}

if(vspeed > 8)
    vspeed = 8;
