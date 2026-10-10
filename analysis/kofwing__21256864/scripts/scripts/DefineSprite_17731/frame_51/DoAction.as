delete this.onEnterFrame;
if(role.dir == 1)
{
   role._x = _level0.stage_with - _level0.char_mc._x - 150;
}
else
{
   _level0.char_mc._x = _level0.egde_min;
   role._x = _level0.egde_min + 90;
   role.opp._x = _level0.egde_min;
}
