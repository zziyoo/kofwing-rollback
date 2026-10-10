stop();
if(_level0.XIIIeff)
{
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
   play();
}
this.onEnterFrame = function()
{
   if(_level0.inPause || !_level0.XIIIeff)
   {
      stop();
   }
   else
   {
      play();
   }
};
