var nowhits = hit;
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
   if(_root.role_mc.opp.status_3 == "hurt")
   {
      _root.role_mc.opp.mc.stop();
   }
};
