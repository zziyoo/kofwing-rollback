this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.onHit)
   {
      mc.play();
      delete this.onEnterFrame;
   }
   else if(_root.role_mc.opp.onHit)
   {
      mc.play();
      delete this.onEnterFrame;
   }
};
