//followPlayer()
//
//Causes the AI to detect and follow the player should he come within a certain range of it

//Sight & Player Detection
if ( distance_to_object(player) < distance_to_object(obj_platform) )
{
    endPatrol = true;
}

//protocol upon player detection
if ( endPatrol )
{
    //following
    if (player.x<x) //player is LEFT of NPC
    { 
        moveRight = false;
        moveLeft = true; 
    }
    if (player.x>x) //player is RIGHT of NPC
    { 
        moveLeft = false;
        moveRight = true; 
    }
    
    //stops when adjacent to a solid object
    if ( moveLeft )
    {
        if ( !place_free(x-16,y) )
        {
            moveLeft = false;   
        }
    }
    if ( moveRight )
    {
        if ( !place_free(x+16,y) )
        {
            moveRight = false; 
        }
    }
}
