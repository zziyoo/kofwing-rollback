_parent.opp.topLayer();
_parent.opp._visible = true;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   var _loc2_ = _parent.opp;
   var _loc3_ = _parent.dir;
   _loc2_._x += 8 * _loc3_;
};
