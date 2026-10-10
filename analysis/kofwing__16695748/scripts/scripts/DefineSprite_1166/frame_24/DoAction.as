var pos = _root.role_mc.opp._x + 100 * _root.role_mc.dir + _level0.char_mc._x;
if(pos > _level0.egde_max)
{
   pos = _level0.egde_max;
}
else if(pos < _level0.egde_min)
{
   pos = _level0.egde_min;
}
_root.role_mc._x = pos - _level0.char_mc._x;
_parent.checkSide_abs();
_parent.checkTouch_stop = false;
_parent.checkTouch(0);
