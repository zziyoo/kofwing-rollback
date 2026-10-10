allowNum = 1;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      _root.role_mc.status_8 = "jingling";
      play();
   }
};
