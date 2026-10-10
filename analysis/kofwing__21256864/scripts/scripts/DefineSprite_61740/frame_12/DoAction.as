stop();
_level0.transOut();
if(type == "credits")
{
   gotoAndStop(type);
}
else if(type == "setting")
{
   gotoAndStop(type);
}
else if(type == "intro")
{
   gotoAndStop(type);
}
else if(type == "rank")
{
   gotoAndStop(type);
}
else if(_level0.player_type == "1PVS2P" && _root.netPlay)
{
   gotoAndStop("pvp_-_netplay");
}
else
{
   stopAllSounds();
   _level0.gotoAndStop("charSelect");
}
