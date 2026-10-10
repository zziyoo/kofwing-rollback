continueHit = true;
this.onEnterFrame = function()
{
   if(_parent.opp.status_3 == "hurt" && _parent.opp.status_7 == "dfo")
   {
      gotoAndStop("hit");
      play();
      delete this.onEnterFrame;
   }
};
