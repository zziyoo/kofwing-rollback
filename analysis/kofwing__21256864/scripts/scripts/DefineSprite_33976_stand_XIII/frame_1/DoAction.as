stop();
if(_level0.XIIIeff)
{
   this.blendMode = "add";
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
}
