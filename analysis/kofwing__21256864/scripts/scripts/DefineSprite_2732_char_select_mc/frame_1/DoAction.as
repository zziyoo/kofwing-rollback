var mc_list = _root.mc_list;
if(_level0.autoPlayGame)
{
   showAuto._visible = true;
}
else
{
   showAuto._visible = false;
}
_root.tq = "";
if(_level0.player_type == "1PVSCOM" && _level0.stageID > 0 && _level0.serviceName != "reselect")
{
   gotoAndStop("com");
   play();
}
else
{
   _level0.ranCharSelect = false;
   _level0.ranCharSelectNum2 = false;
   _level0.ranCharSelectNum3 = false;
   _level0.ranCharSelectN = false;
   _level0.ranCharSelectNNum2 = false;
   _level0.ranCharSelectNNum3 = false;
}
