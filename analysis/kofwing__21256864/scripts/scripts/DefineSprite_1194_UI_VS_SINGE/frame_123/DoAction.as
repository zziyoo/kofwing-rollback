if(_level0.serviceName == "AI" && _level0.player_type == "1PVSCOM")
{
   _level0.P1_type = "cpu";
}
else if(_level0.player_type == "1PVSCOM")
{
   _level0.P1_type = "player";
}
_level0.transIn();
