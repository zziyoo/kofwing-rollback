var v = -24;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   mc1._x += v;
   mc1._y += v;
   mc2._x -= v;
   mc2._y += v;
   if(_parent.player_type == "cpu")
   {
      _parent.shuijingbo_check();
   }
};
