if(!(_parent.opp.status_2 == "air" && Math.abs(_parent.opp._y - _parent._y) < 100 && Math.abs(_parent.opp._x - _parent._x) < 150))
{
   catched = true;
   gotoAndStop("punch");
   play();
}
