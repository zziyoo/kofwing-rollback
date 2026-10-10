stop();
allowNum = 1;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.opp.status_3 != "down" || _root.role_mc.opp.status_7 == "zd")
   {
      delete this.onEnterFrame;
      gotoAndStop(1);
   }
};
