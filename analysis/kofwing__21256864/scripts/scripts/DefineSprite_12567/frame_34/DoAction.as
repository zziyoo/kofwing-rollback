delete this.onEnterFrame;
_parent.wireAttack = false;
if(_parent.opp.status_1 == "breakDefend")
{
   gotoAndStop("nohit");
   play();
}
