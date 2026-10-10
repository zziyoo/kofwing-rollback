this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.opp._x - _parent._x < 90 && _parent._x - _parent.opp._x < 90)
   {
      delete this.onEnterFrame;
      gotoAndStop("ace");
      play();
   }
};
