function hit()
{
   gotoAndStop("hit");
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
};
this.blendMode = "screen";
if(_level0.glowMode)
{
   this.blendMode = "add";
}
