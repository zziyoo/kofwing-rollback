this._visible = true;
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
   this._x = _root.role_mc.opp._x;
   this._y = _root.role_mc.opp._y - 60;
};
