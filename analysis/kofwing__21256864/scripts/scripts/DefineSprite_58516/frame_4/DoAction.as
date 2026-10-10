if(_parent.opp.status_7 != "zhua")
{
   gotoAndStop("nohit");
   play();
}
if(_parent.onHit != true || _parent.opp.status_1 != "hurt2")
{
   gotoAndStop("nohit");
   play();
}
_parent.checkTouch_stop = true;
