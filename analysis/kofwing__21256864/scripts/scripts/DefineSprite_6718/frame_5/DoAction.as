this.onEnterFrame = function()
{
   if(_level0.inFreeze || _level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
};
