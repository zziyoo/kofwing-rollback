var pos = _root.role_mc.opp._x + 200 * _root.role_mc.dir;
if(pos + _level0.char_mc._x > _level0.egde_max)
{
   pos = _level0.egde_max - _level0.char_mc._x;
}
else if(pos + _level0.char_mc._x < _level0.egde_min)
{
   pos = _level0.egde_min - _level0.char_mc._x;
}
_root.role_mc._x = pos;
