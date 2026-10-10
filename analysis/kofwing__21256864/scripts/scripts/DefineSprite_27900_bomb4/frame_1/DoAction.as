if(_level0.glowMode)
{
   this.blendMode = "hardlight";
}
if(_level0.XIIIeff)
{
   this.blendMode = "add";
   gotoAndStop("XIII");
   play();
}
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
   if(_level0.inPause)
   {
      return undefined;
   }
   this.swapDepths(_parent.getNextHighestDepth());
};
