#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprUpPlatform && image_yscale!=1 && image_angle==0) {
    draw_sprite_part(sprite_index,0,0,0,16,10,x,y)
    for (i=y+10;i<bbox_bottom-9-12;i+=12) {
        draw_sprite_part(sprite_index,0,0,10,16,12,x,i)
    }
    draw_sprite_part(sprite_index,0,0,10,16,bbox_bottom-9-i,x,i)
    draw_sprite_part(sprite_index,0,0,22,16,10,x,bbox_bottom-9)
} else draw_self()
