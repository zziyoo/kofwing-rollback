this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
   if(_root.role_mc.status_3 == "hurt")
   {
      this.removeMovieClip();
   }
};
