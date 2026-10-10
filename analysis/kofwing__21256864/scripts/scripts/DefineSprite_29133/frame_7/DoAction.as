continueHit = true;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.flyingObj._currentframe > 1)
   {
      gotoAndStop("att");
      play();
      delete this.onEnterFrame;
   }
};
