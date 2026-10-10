this.onEnterFrame = function()
{
   if(level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   _parent.checkSide_abs();
};
