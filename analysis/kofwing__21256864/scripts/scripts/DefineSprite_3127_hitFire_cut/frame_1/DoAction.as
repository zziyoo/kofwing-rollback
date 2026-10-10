_rotation = int(Math.random() * 360);
this.blendMode = "screen";
if(_level0.glowMode)
{
   this.blendMode = "add";
}
if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
