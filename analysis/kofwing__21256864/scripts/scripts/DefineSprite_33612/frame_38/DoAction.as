delete this.onEnterFrame;
var opp = _root.role_mc.opp;
_parent.opp.checkTouch_stop = true;
_parent.checkTouch_stop = true;
_parent.opp.stop_hurtBack();
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   _parent.opp.mc.stop();
   if(_root.role_mc.dir == 1)
   {
      opp.chageSide1();
   }
   else
   {
      opp.chageSide2();
   }
};
_root.role_mc._y = 290;
opp._y = 445;
opp._x = _root.role_mc._x;
