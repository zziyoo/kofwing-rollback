function checkEnd3()
{
   if(mode3_p1 == "ultimate" && mode3_p2 != "ultimate" && ult_p1 != undefined || mode3_p1 != "ultimate" && mode3_p2 == "ultimate" && ult_p2 != undefined || ult_p1 != undefined && ult_p2 != undefined)
   {
      play();
   }
}
stop();
if(mode3_p1 != "ultimate")
{
   ult_mc1._visible = false;
}
else
{
   ult_mc1.init(keyP1);
}
if(mode3_p2 != "ultimate")
{
   ult_mc2._visible = false;
}
if(_level0.player_type == "1PVS2P")
{
   ult_mc2.init(keyP2);
}
var ult_p1;
var ult_p2;
ult_mc1.callBack_selectEnd = function()
{
   _root.dash_ex_enabled_P1 = this.selectMode0;
   _root.roll_ex_enabled_P1 = this.selectMode1;
   _root.charge_enabled_P1 = this.selectMode2;
   ult_p1 = true;
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
         owner.checkEnd3();
      }
   }
   else if(_level0.player_type == "trainning")
   {
      if(mode3_p2 == "ultimate")
      {
         owner.ult_mc2.init(keyP1);
      }
      else
      {
         owner.play();
      }
   }
};
ult_mc2.callBack_selectEnd = function()
{
   _root.dash_ex_enabled_P2 = this.selectMode0;
   _root.roll_ex_enabled_P2 = this.selectMode1;
   _root.charge_enabled_P2 = this.selectMode2;
   ult_p2 = true;
   if(_level0.player_type == "1PVS2P")
   {
      owner.checkEnd3();
   }
   else if(_level0.player_type == "trainning")
   {
      owner.checkEnd3();
   }
};
