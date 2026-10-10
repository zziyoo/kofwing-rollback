if(_parent.opp.status_1 == "hurt2")
{
   _parent.opp._x = _parent._x - 40 * _parent.dir;
   this.onEnterFrame = function()
   {
      if(_level0.inPause || _level0.inFreeze)
      {
         return undefined;
      }
      _parent.opp.mc.stop();
   };
}
