switch (curr_pos)
{
    case 0:
    {
        //room_goto(ExperimentalRoom);
        room_goto(StreetLevel);
        break;
    }
        
    case 1:
    {
        break;
    }
    
    case 2:
    {
        game_end();
        break;    
    }
    
    default: break;
}
