if(_level0.glowMode)
{
   if(_level0.glowType && !_level0.XIIIeff)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
}
else if(_level0.XIIIeff)
{
   this.blendMode = "screen";
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
if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
