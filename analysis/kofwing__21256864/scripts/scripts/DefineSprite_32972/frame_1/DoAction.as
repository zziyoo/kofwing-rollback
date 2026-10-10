stop();
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else if(_level0.XIIIeff)
   {
      play();
   }
};
