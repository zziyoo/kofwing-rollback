if(_root.role_mc.opp.status_7 != "s" || _parent.opp.status_3 != "hurt" || _parent.opp.isKO)
{
   gotoAndStop("nohit");
   play();
}
else
{
   _parent.opp._y = _parent.land_Y + 10;
   _parent.opp.status_2 = "land";
}
