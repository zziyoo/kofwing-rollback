onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_parent.onHit && _parent.opp.status_3 == "hurt" || _parent.onHit && _parent.opp.status_1 == "hurt2")
   {
      gotoAndStop("hit");
      play();
      delete this.onEnterFrame;
   }
   else if(_parent.onHit && _parent.opp.status_3 != "hurt")
   {
      gotoAndStop("nohit");
      play();
      delete this.onEnterFrame;
   }
};
