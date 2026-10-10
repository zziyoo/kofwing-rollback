this.onEnterFrame = function()
{
   if(_parent.onHit && _parent.opp.status_3 == "hurt")
   {
      gotoAndStop("hit");
      play();
      delete this.onEnterFrame;
   }
   else if(_parent.opp.status_3 != "hurt")
   {
   }
};
