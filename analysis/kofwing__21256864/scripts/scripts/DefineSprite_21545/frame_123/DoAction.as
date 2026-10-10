if(_parent.opp.status_7 != "kongtou" || _parent.opp.status_1 != "hurt2")
{
   catched = true;
   gotoAndStop("punch");
   play();
}
_parent.checkTouch_stop = true;
if(_parent._y > 350)
{
   _parent._y = 350;
   _parent.opp._y = 350;
}
