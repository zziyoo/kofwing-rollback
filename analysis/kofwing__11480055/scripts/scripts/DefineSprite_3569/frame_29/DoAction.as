onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_parent.onHit && _parent.opp.status_3 == "hurt" || _parent.onHit && _parent.opp.status_1 == "hurt2")
   {
      delete this.onEnterFrame;
      play();
   }
   else if(_parent.onHit && _parent.opp.status_3 != "hurt")
   {
      gotoAndStop("s3");
      play();
      delete this.onEnterFrame;
   }
};
