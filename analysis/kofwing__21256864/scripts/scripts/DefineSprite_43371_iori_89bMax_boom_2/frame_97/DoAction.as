delete this.onEnterFrame;
status_7 = "normal";
this._x = _root.role_mc.opp._x;
this._y = _root.role_mc.opp._y;
if(hit != true)
{
   gotoAndStop("end");
   play();
}
if(opp.onHurt)
{
   gotoAndStop("end");
   play();
}
