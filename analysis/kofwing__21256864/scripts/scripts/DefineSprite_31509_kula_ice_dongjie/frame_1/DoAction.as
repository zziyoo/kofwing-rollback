function doCheck()
{
   opp.status_3 = "hurt";
   opp.toStatus(status_c);
   opp.mc.gotoAndStop(flag);
   opp.skillCount = false;
   opp.inCount = false;
   opp.status_2 = "land";
   delete opp.onEnterFrame;
   var _loc2_ = Func.lToG(this);
   var _loc4_ = _loc2_.x;
   var _loc3_ = _loc2_.y;
   if(_loc2_.x > role.egde_max)
   {
      _loc2_.x = role.egde_max;
   }
   else if(_loc2_.x < role.egde_min)
   {
      _loc2_.x = role.egde_min;
   }
   opp._x = _loc4_ - _level0.char_mc._x;
   opp._y = _loc3_ - _level0.char_mc._y;
   if(role.dir == opp.dir)
   {
      if(role.dir == 1)
      {
         opp.chageSide2();
      }
      else
      {
         opp.chageSide1();
      }
   }
}
stop();
var role = _root.role_mc;
var opp = role.opp;
var status_c = "hurt2";
var flag = "s_catch";
doCheck();
role.onHit = false;
onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(opp.status_3 != "hurt")
   {
      doCheck();
   }
   if(role.onHit)
   {
      delete this.onEnterFrame;
      play();
      return undefined;
   }
   var _loc2_ = Func.lToG(opp);
   var _loc4_ = _loc2_.x;
   var _loc3_ = _loc2_.y;
   _X = opp._x;
};
