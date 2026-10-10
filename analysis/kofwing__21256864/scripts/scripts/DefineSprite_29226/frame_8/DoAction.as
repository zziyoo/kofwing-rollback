if(_parent.opp.skillCount == true && _parent.opp.countObj == false)
{
   _parent.opp.countEnd();
}
else if(_parent.opp.status_1 == "hold_u" || _parent.opp.status_1 == "hold_d" || _parent.opp.skillCount == true)
{
   gotoAndStop("s3");
   play();
}
else if(_parent.opp.status_3 == "down" || _parent.opp.status_3 == "roll")
{
   gotoAndStop("s4");
   play();
}
