this.onEnterFrame = function()
{
   if(_level0.inPause || _root.role_mc.opp.inCount == true)
   {
      stop();
   }
   else
   {
      play();
   }
};
