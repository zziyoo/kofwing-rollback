if(_root.role_mc.opp.isKO == true)
{
   gotoAndStop("end");
   play();
}
else if(_parent.opp.status_1 == "hurt1")
{
   gotoAndStop("hit");
   play();
}
else
{
   gotoAndStop("end");
   play();
}
