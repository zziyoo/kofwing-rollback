var opp = _root.role_mc.opp;
if(opp.status_1 == "getup2")
{
   gotoAndStop("att2");
   play();
}
else if(opp.status_3 != "down")
{
   _parent.status_1 = "punch4";
   gotoAndStop("attack_stand");
   play();
}
