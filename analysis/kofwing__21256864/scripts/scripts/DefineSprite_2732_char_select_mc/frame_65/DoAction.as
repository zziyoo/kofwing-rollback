function checkEnd()
{
   if(mode2_p1 != undefined && mode2_p2 != undefined)
   {
      play();
   }
}
stop();
mode2_mc1.init(keyP1);
if(_level0.player_type == "1PVS2P")
{
   mode2_mc2.init(keyP2);
}
if(_root.setting.data.mode_key_P1 == "easy")
{
   mode2_mc1.modeMC.mc.gotoAndStop(2);
}
if(_root.setting.data.mode_key_P2 == "easy")
{
   mode2_mc2.modeMC.mc.gotoAndStop(2);
}
var mode_p1;
var mode_p2;
var mode2_p1;
var mode2_p2;
var selectNum2 = 0;
var oppSelected2;
mode2_mc1.callBack_selectEnd = function()
{
   owner.mode2_p1 = this.selectMode;
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
         owner.checkEnd();
      }
   }
   else if(_level0.player_type == "trainning")
   {
      owner.mode2_mc2.init(keyP1);
   }
};
mode2_mc2.callBack_selectEnd = function()
{
   owner.mode2_p2 = this.selectMode;
   if(_level0.player_type == "1PVS2P")
   {
      owner.checkEnd();
   }
   else if(_level0.player_type == "trainning")
   {
      owner.checkEnd();
   }
};
