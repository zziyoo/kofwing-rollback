var posx = _root.role_mc.opp._x;
var posy = _root.role_mc.opp._y - 80;
_X = posx + int(Math.random() * 120 - 60);
_Y = posy + int(Math.random() * 160 - 80);
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
};
