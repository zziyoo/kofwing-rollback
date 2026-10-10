this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   this.swapDepths(_parent.getNextHighestDepth());
};
