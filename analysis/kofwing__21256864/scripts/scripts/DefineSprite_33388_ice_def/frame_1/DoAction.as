this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
};
if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
