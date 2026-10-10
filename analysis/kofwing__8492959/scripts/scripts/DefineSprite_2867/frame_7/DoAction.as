if(!(_parent.opp.status_1 == "getup1" && _parent.opp.mc.body && _parent.opp.status_3 == "down"))
{
   if(_parent.opp.status_1 == "getup2" && _parent.opp.mc.body && _parent.opp.status_3 == "down")
   {
      gotoAndStop("2");
      play();
   }
   else
   {
      gotoAndStop("3");
      play();
   }
}
