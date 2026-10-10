if(_root.role_mc.opp.status_1 != "hurt6" && _root.role_mc.opp.status_2 == "air" && _root.role_mc.opp.status_3 == "hurt")
{
   gotoAndStop("incombo");
   play();
}
if((_root.role_mc.opp.status_1 == "hold_u" || _root.role_mc.opp.status_1 == "hold_d") && _root.role_mc.opp.status_5 == "hitBack")
{
   gotoAndStop("nohit");
   play();
}
