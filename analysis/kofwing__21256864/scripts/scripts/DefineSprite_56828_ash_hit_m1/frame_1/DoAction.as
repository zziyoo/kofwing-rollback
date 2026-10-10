this.onEnterFrame = function()
{
   this._x = _root.role_mc.opp._x;
   this._y = _root.role_mc.opp._y - 100;
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
