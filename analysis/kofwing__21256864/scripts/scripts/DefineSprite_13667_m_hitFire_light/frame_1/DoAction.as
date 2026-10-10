var dx = int(Math.random() * 40 - 80);
var dy = int(Math.random() * 100);
_rotation = int(Math.random() * 360);
onEnterFrame = function()
{
   _X = _root.role.opp._x + dx;
   _Y = _root.role.opp._y - dy;
};
