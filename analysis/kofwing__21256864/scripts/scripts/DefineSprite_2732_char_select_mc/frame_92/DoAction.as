if(_level0.player_type == "1PVSCOM" && _level0.serviceName != "reselect")
{
   gotoAndStop("option1");
   play();
}
else if(_level0.player_type == "1PVSCOM" && _level0.serviceName == "reselect")
{
   _level0.selectOK(selectData);
   selectData.targetInit = "all";
   _level0.initSelectOrder(selectData);
   _level0.gotoAndPlay("vs");
}
else if(_level0.player_type == "trainning")
{
   gotoAndStop("option2");
   play();
}
else if(_level0.player_type == "1PVS2P")
{
   gotoAndStop("option_vs_human");
   play();
}
else
{
   gotoAndStop("option_vs");
   play();
}
