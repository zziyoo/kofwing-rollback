this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze || _root.role_mc.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
