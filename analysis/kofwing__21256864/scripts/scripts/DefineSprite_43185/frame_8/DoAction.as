this.onEnterFrame = function()
{
   if(_parent.opp.status_1 == "hurt1" || _parent.opp.status_1 == "hurt3")
   {
      delete this.onEnterFrame;
      gotoAndStop("hit1");
      play();
   }
};
