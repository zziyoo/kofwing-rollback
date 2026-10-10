this.onEnterFrame = function()
{
   _root.role_mc.status_8 = "jingling";
   if(_root.role_mc.status_8 == "normal")
   {
      _root.role_mc.status_8 = "jingling";
   }
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
