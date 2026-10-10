stop();
if(_level0.XIIIeff)
{
   if(_level0.glowMode && _level0.glowType)
   {
      blendMode = "hardlight";
   }
   else
   {
      blendMode = "add";
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
}
else
{
   this.removeMovieClip();
}
