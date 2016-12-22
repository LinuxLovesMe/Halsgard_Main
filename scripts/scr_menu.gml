switch (curr_pos)
{
    case 0:
    {
        room_goto(StreetLevel);
        break;
    }
        
    case 1:
    {
        room_goto(StreetLevel);
        break;
    }
    
    case 2:
    {
        game_end();
        break;    
    }
    
    default: break;
}
