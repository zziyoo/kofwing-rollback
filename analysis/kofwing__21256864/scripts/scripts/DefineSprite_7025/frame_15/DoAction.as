_root.role_mc.control = true;
if(_root.role_mc._y == _root.role_mc.opp._y)
{
   _root.role_mc._y -= 485;
}
else if(_root.role_mc.opp._y >= 510)
{
   _root.role_mc._y -= 200;
}
else
{
   _root.role_mc._y = _root.role_mc.opp._y - 400;
}
if(Key.isDown(_parent.f))
{
   _root.role_mc._x = _root.role_mc.opp._x + 30;
}
else if(Key.isDown(_parent.b))
{
   _root.role_mc._x = _root.role_mc.opp._x - 30;
}
else
{
   _root.role_mc._x = _root.role_mc.opp._x;
}
_parent.countStart(99,"all");
_parent.checkTouch_stop = false;
