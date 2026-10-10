if(_parent.onHit == false)
{
   gotoAndStop("nohit2");
   play();
}
else if(_parent.opp.status_1 != "hurt2")
{
   gotoAndStop("nohit");
   play();
}
else
{
   gotoAndStop("hit");
   play();
}
