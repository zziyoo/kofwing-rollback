if(_parent.opp.status_2 == "air" && _parent.opp.status_3 == "hurt" && _parent.opp.status_1 != "hurt6")
{
   gotoAndStop("combo");
   play();
}
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
