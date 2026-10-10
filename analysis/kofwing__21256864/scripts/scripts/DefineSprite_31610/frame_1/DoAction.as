if(_level0.glowMode)
{
   if(_level0.glowType)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
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
