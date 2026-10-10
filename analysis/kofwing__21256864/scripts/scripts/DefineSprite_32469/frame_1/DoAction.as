stop();
if(_level0.XIIIeff)
{
   play();
}
this.onEnterFrame = function()
{
   if(_level0.inPause || !_level0.XIIIeff)
   {
      stop();
   }
   else
   {
      play();
   }
};
