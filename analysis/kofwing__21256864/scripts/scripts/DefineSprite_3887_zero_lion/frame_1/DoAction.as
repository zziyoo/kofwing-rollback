this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze || _root.role_mc.opp.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
dirs = this.dir;
allowNum = 1;
