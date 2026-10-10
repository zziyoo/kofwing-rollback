_parent.opp.gotoAndStop("getup2");
_parent.opp.mc.gotoAndStop(15);
var oppX = 0;
var oppY = 125;
this.onEnterFrame = function()
{
   _parent.opp._x = _parent._x + oppX * _parent.dir;
   _parent.opp._y = _parent._y - oppY;
};
