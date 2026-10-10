if(_parent.opp.status_7 == "sys")
{
   gotoAndStop("hit");
   play();
}
this.onEnterFrame = function()
{
   if(_parent.opp.status_7 == "sys")
   {
      delete this.onEnterFrame;
      gotoAndStop("hit");
      play();
   }
};
