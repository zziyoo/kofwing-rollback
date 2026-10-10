continueHit = true;
_level0.charToCenter();
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   delete _parent.opp.onEnterFrame;
};
