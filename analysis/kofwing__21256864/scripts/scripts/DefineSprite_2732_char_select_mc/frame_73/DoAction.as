function checkEnd2()
{
   if(mode3_p1 != undefined && mode3_p2 != undefined)
   {
      play();
   }
}
stop();
mode3_mc1.init(keyP1);
if(_level0.player_type == "1PVS2P")
{
   mode3_mc2.init(keyP2);
}
if(_root.setting.data.mode_power_P1 == "extra")
{
   mode3_mc1.modeMC.mc.gotoAndStop(2);
}
else if(_root.setting.data.mode_power_P1 == "ultimate")
{
   mode3_mc1.modeMC.mc.gotoAndStop(3);
}
if(_root.setting.data.mode_power_P2 == "extra")
{
   mode3_mc2.modeMC.mc.gotoAndStop(2);
}
else if(_root.setting.data.mode_power_P2 == "ultimate")
{
   mode3_mc2.modeMC.mc.gotoAndStop(3);
}
var mode3_p1;
var mode3_p2;
var selectNum3 = 0;
var oppSelected3;
mode3_mc1.callBack_selectEnd = function()
{
   owner.mode3_p1 = this.selectMode;
   if(_level0.player_type == "1PVSCOM")
   {
      owner.play();
   }
   else if(_level0.player_type == "COMVSCOM" || _level0.player_type == "vs")
   {
      owner.play();
   }
   else if(_level0.player_type == "1PVS2P")
   {
      if(_root.netPlay)
      {
         owner.play();
      }
      else
      {
         owner.checkEnd2();
      }
   }
   else if(_level0.player_type == "trainning")
   {
      owner.mode3_mc2.init(keyP1);
   }
};
mode3_mc2.callBack_selectEnd = function()
{
   owner.mode3_p2 = this.selectMode;
   if(_level0.player_type == "1PVS2P")
   {
      owner.checkEnd2();
   }
   else if(_level0.player_type == "trainning")
   {
      owner.checkEnd2();
   }
};
