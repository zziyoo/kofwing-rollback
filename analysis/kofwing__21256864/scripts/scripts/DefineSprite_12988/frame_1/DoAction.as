this.blendMode = "screen";
if(_level0.glowMode)
{
   this.blendMode = "add";
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
};
