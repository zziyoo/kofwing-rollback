delete this.onEnterFrame;
_parent.nobody = false;
if(!(_parent.opp.status_1 == "getup1" || _parent.opp.status_1 == "getup2"))
{
   if(_parent.opp.status_7 == "dfo" && _parent.opp.status_3 == "hurt")
   {
      gotoAndStop("hit");
      play();
   }
   else if(_parent.opp.status_3 != "hurt")
   {
   }
}
