var hits = 0;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
   this._x = _root.role_mc.opp._x;
   this._y = _root.role_mc.opp._y - 200;
};
