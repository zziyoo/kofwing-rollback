_parent._y = 445;
_parent.status_2 = "land";
if(_parent.opp.skillCount == true && _parent.opp.countObj == false)
{
   _parent.opp.countEnd();
}
else if(_parent.opp.status_1 == "hold_u" || _parent.opp.status_1 == "hold_d" || _parent.opp.skillCount == true)
{
   gotoAndStop("END");
   play();
}
else if(_parent.opp.status_3 == "down" || _parent.opp.status_3 == "roll")
{
   gotoAndStop("END");
   play();
}
