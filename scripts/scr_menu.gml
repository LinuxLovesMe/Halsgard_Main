switch (curr_pos)
{
    case 0:
    {
        room_goto(level_street);
        break;
    }
        
    case 1:
    {
        room_goto(level_street);
        break;
    }
    
    case 2:
    {
        game_end();
        break;    
    }
    
    default: break;
}
