//followPlayer()
//
//Causes the AI to detect and follow the player should he come within a certain range of it

//Sight & Player Detection
if ( distance_to_object(o_player) < distance_to_object(par_wall) )
{
    endPatrol = true;
}

//protocol upon player detection
if ( endPatrol )
{
    //following
    if (o_player.x<x) //player is LEFT of NPC
    { 
        moveRight = false;
        moveLeft = true; 
    }
    if (o_player.x>x) //player is RIGHT of NPC
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
