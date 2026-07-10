function check_tunnel()
{
    if (x < -sprite_width)
    {
        x = room_width;
    }

    if (x > room_width)
    {
        x = -sprite_width;
    }
}