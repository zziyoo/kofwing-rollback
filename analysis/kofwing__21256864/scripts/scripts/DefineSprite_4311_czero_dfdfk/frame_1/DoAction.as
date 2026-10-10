var counter = 0;
this._visible = false;
_X = _root.role_mc.opp._x;
_Y = _root.role_mc.opp._y;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
   if(_root.role_mc.opp.status_3 == "hurt")
   {
      _root.role_mc.opp.mc.stop();
   }
};
