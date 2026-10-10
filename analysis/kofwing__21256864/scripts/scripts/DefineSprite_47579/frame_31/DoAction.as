_parent.newKeyControl.dir = - _parent.dir;
var _opp = _parent.opp;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_level0.inFreeze)
   {
      return undefined;
   }
   var _loc3_ = _parent._x + _parent.opp._x * dir;
   var _loc4_ = _parent._y + _parent.opp._y;
   if(_level0.char_mc._x + _loc3_ > egde_max)
   {
      _loc3_ = egde_max - _level0.char_mc._x;
   }
   else if(_level0.char_mc._x + _loc3_ < egde_min)
   {
      _loc3_ = egde_min - _level0.char_mc._x;
   }
   opp._x = _loc3_;
   if(changeDir && dir == opp.dir)
   {
      if(dir == 1)
      {
         opp.chageSide2();
      }
      else
      {
         opp.chageSide1();
      }
   }
   _opp._x += 0;
   delete this.onEnterFrame;
};
_parent.checkSide_abs();
_parent.opp._y = 445;
_parent.opp._xscale *= -1;
_parent.opp.dir *= -1;
_parent.opp.newKeyControl.dir *= -1;
