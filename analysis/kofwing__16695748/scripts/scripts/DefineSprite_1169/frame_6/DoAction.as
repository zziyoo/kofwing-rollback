_parent.checkTouch_stop = false;
var dir = _root.role_mc.dir;
if(dir > 0)
{
   _root.role_mc._x = 50 - _level0.char_mc._x;
}
else
{
   _root.role_mc._x = _level0.stage_with - 50 - _level0.char_mc._x;
}
