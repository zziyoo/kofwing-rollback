if((_root.role_mc.opp.status_1 == "hold_u" || _root.role_mc.opp.status_1 == "hold_d") && _root.role_mc.opp.status_5 == "hitBack")
{
   gotoAndStop("nohit");
   play();
}
if(_root.role_mc.opp.status_7 != "sys")
{
   gotoAndStop("nohit");
   play();
}
