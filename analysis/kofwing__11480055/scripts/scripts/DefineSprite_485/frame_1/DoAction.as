this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   this.swapDepths(_parent.getNextHighestDepth());
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
if(_level0.glowMode)
{
   this.blendMode = "add";
}
