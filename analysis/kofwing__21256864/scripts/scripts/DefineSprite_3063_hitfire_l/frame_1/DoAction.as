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
else
{
   var a = Math.random();
   if(a < 0.3)
   {
      gotoAndStop("hit2");
      play();
   }
   if(a > 0.3 && a < 0.6)
   {
      gotoAndStop("hit3");
      play();
   }
   if(a > 0.6 && a < 1)
   {
      gotoAndStop("hit4");
      play();
   }
}
