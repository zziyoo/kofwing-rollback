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
};
if(_level0.XIIIeff)
{
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
   else
   {
      this.blendMode = "screen";
   }
   gotoAndStop("XIII");
   play();
}
