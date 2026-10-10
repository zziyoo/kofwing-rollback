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
if(_level0.glowMode && !_level0.XIIIeff)
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
if(_level0.XIIIeff)
{
   this.blendMode = "screen";
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
   gotoAndStop("XIII");
   play();
}
