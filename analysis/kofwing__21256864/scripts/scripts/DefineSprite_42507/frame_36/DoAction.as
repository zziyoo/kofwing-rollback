if(_parent.opp.status_3 != "hurt")
{
   gotoAndStop("s4");
   play();
}
if(_parent.opp.status_3 == "hurt" && _parent.opp.status_2 == "land" && _parent.opp.status_1 == "hurt2")
{
   _parent.opp.mc.stop();
}
