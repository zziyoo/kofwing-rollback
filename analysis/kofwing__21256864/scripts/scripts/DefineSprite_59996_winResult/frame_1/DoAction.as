function go()
{
   _level0.ok_snd.start();
   play();
}
if(_level0.serviceName == "level")
{
   _level0.level++;
}
if(serviceName == "AI")
{
   _level0.P1_type = "player";
}
_level0.serviceName = "";
_level0.char_mc.removeMovieClip();
if(_level0.player_type == "1PVSCOM" && _level0.stageID == _level0.char_list.length - 1)
{
   gotoAndStop("winAll");
   play();
}
