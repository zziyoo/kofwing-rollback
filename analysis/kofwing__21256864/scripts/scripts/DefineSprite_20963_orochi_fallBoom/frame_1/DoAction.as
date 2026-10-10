_xscale = _xscale * _root.role_mc.dir;
var w = 431;
_X = - _level0.char_mc._x - _root._x + w;
_Y = - _level0.char_mc._y - _root._y;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   _root.role_mc.opp.topLayer();
   _X = - _level0.char_mc._x - _root._x + w;
   if(_root.role_mc.opp.isKO)
   {
      this.removeMovieClip();
   }
};
