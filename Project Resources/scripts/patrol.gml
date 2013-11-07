//patrol()
//
/*checks if a "boundary" is in front of the object by 16 pixels
and if the object is moving to the right*/
if ( !endPatrol )
{
    if ( !place_free(x+16,y) and moveRight )
    {
        moveRight = false;
        moveLeft = true;
    }
    
    if ( !place_free(x-16,y) and moveLeft )
    {
        moveLeft = false;
        moveRight = true;
    }
}
