this.blendMode = "screen";
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
if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
