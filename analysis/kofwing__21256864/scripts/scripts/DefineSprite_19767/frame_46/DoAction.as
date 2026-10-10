if(!_parent.opp.isKO)
{
   if(_parent.opp.status_3 == "hurt" || _parent.opp.status_3 == "down")
   {
      gotoAndStop("hit");
      play();
   }
   else if(_parent.opp.status_3 != "hurt")
   {
   }
}
