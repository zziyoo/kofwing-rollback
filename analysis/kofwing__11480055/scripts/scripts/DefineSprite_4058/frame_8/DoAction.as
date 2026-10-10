if(_parent.opp.status_3 == "down" || _parent.opp.status_3 == "roll")
{
   gotoAndStop("s4");
   play();
}
else if(_parent.opp.status_1 == "hold_u" || _parent.opp.status_1 == "hold_d" || _parent.opp.inCount == true)
{
   gotoAndStop("s3");
   play();
}
else if(_root.role_mc.opp.status_2 == "land")
{
   gotoAndStop("s2_2");
   play();
}
