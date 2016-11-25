var chunk = 6;

for(i = 0; i < sprite_width; i += chunk){
    for(j = 0; j < sprite_height; j += chunk){
        particle = instance_create(x + i, y + j,
            choose(splitObj1, splitObj2, splitObj3, splitObj4, splitObj5));
        
    }
}
instance_destroy();
