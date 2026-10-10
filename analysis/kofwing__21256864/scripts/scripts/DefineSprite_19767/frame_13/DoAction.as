this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(opp.status_1 == "getup1" || opp.status_1 == "getup2")
   {
      gotoAndStop("hit");
      play();
      delete this.onEnterFrame;
   }
};
