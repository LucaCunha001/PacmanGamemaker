function get_high_score_index(score)
{
    for (var i = 0; i < array_length(global.high_scores); i++)
    {
        if (score > global.high_scores[i].score)
        {
            return i;
        }
    }

    return -1;
}