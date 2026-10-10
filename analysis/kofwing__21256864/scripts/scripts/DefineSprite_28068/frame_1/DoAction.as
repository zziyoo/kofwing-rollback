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
