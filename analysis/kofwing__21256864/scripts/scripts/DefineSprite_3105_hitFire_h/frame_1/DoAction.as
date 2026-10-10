_rotation = int(Math.random() * 360);
this.blendMode = "screen";
if(_level0.glowMode)
{
   this.blendMode = "add";
}
if(_level0.XIIIeff)
{
   var ran = Math.floor(Math.random() * 3);
   if(ran > 1)
   {
      gotoAndStop("XIII");
      play();
   }
   else
   {
      gotoAndStop("XIII2");
      play();
   }
}
