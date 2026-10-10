onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
      return undefined;
   }
   if(_level0.inFreeze)
   {
      stop();
      return undefined;
   }
   play();
};
_X = _root.role_mc.opp._x;
_Y = land._y;
