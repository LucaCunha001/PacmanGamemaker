function get_level_fruit(level)
{
    if (level <= 1)
        return { sprite: 0, score: 100 };   // Cherry

    if (level == 2)
        return { sprite: 1, score: 300 };   // Strawberry

    if (level <= 4)
        return { sprite: 2, score: 500 };   // Orange

    if (level <= 6)
        return { sprite: 3, score: 700 };   // Apple

    if (level <= 8)
        return { sprite: 4, score: 1000 };  // Melon

    if (level <= 10)
        return { sprite: 5, score: 2000 };  // Galaxian

    if (level <= 12)
        return { sprite: 6, score: 3000 };  // Bell

    return { sprite: 7, score: 5000 };      // Key
}