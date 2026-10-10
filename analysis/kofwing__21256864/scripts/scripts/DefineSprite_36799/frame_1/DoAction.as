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
else if(_level0.XIIIeff)
{
   this.blendMode = "screen";
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
if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
