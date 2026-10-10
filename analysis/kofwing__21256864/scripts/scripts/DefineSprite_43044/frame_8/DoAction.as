if(_parent.opp.countObj == false)
{
   _parent.opp.countEnd();
}
if(_parent.opp.status_1 == "hold_u" || _parent.opp.status_1 == "hold_d")
{
   gotoAndStop("s3");
   play();
}
else if(_parent.opp.status_3 == "down")
{
   gotoAndStop("s4");
   play();
}
