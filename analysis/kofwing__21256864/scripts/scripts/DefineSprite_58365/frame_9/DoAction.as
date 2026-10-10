if(_parent.opp.status_7 != "tou" || _parent.opp.status_1 != "hurt2")
{
   gotoAndStop("nohit");
   play();
}
else
{
   _parent.checkTouch_stop = true;
   _parent.opp.checkSide_abs();
}
