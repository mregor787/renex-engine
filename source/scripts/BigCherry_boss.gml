if (event_type==ev_create) {
    name="Big Cherry"
    subtitle="Celebrate100"

    hp=150

    lock_controls()
    sound_stop_music()

    state="starting"

    image_speed=0
    image_xscale=4
    image_yscale=4
    exit
}

if (event_type==ev_draw) {
    draw_cherry(x,y,4,4,0,$f3)
    exit
}

if (event_type==ev_destroy) {
    sound_stop_music()
    exit
}

if (event_type==ev_step) {
    //do damage
    with (instance_place(x,y,Player)) kill_player()

    //check victory condition
    if (Player.dead) state="won"
    if (state=="won") {
        path_speed=0
        exit
    }

    //take damage
    with (instance_place(x,y,Bullet)) with (other) {
        if (!flash) {
            flash=10
            flashtime=6
            sound_play("sndBossHit")
            hp-=10
            if (hp<=50) {
                state="pinch"
            }
            if (hp<=0) {
                //defeated
                sound_play("sndDeath")
                instance_destroy()
            }
        }
        instance_destroy_other()
    }

    //flash
    if (flash) {
        flashtime-=dt
        if (flashtime<=0) {
            flashtime=6
            if (visible) {
                visible=false
            } else {
                visible=true
                flash-=1
            }
        }
    }

    //main boss state machine
    {
        //introduction
        if (state=="starting") {
            if (wait_frames(60)) {
                unlock_controls()
                play_bg_music("ddplastboss",1)
                path_start(pBoss10F,2*dt,path_action_restart,true)
                state="active"
            }
        }

        //attack!
        if (state=="active") {
            if (wait_frames(90)) {
                instance_create_moving(x,y,Cherry,5*dt,point_direction(x,y,Player.x,Player.y))
            }
        }

        //pinch mode
        if (state=="pinch") {
            if (wait_frames(90)) {
                instance_create_moving(x,y,Cherry,5*dt,point_direction(x,y,Player.x,Player.y))
                instance_create_moving(x,y,BigCherryBlueProjectile,1*dt,random(360))
            }
        }
    }
}
