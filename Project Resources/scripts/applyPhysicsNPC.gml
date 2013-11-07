//applyPhysicsNPC(sp,spring)
//
//This script applies the game's laws of physics to non-player objects. This is meant to be called in the "Step".

//Matching arguments to variables
sp = argument0;
spring = argument1;

//Move left and right
if (moveLeft)
{
    hsp = sp * -1;
    image_xscale = -1;
}

if (moveRight)
{
    hsp = sp;
    image_xscale = 1;
}

//Neutral input = 0 movement
if ((moveRight && moveLeft) or (!moveRight && !moveLeft))
{
    hsp = 0;
}

//Jumping
if (moveJump && check == true)
{
    time++;
    if (time <= 10)
    {
        vsp = spring * -1;
        vsp -= .1;
    }
    if (grounded == 1)
    {
        time = 0;
    }
}

if (!moveJump)
{
    check = false;
}

if (grounded == 1)
{
    check = true;
}

vsp++;

//Vertical Collision
if place_meeting(x,y+vsp,par_floor) 
{
    while (!place_meeting(x,y+1,par_floor)) 
    { y+=1; }
    vsp = 0;
    grounded = true;
}
else
{
    grounded = 0;
}


//Horizontal Collision
if place_meeting(x+hsp,y,par_wall)
{
    while (!place_meeting(x+sign(hsp),y,par_wall)) x+=sign(hsp);
    hsp = 0;
}

//Commit to movement
x += hsp;
y += vsp;

// Optional, make a reset and quit key.
