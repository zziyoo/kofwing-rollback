if(_level0.mode_role_P1 != 1)
{
   _level0.P1_role.gotoAndStop("ready" + _level0.mode_role_P1);
}
else
{
   _level0.P1_role.gotoAndStop("ready");
}
if(_level0.mode_role_P2 != 1)
{
   _level0.P2_role.gotoAndStop("ready" + _level0.mode_role_P2);
}
else
{
   _level0.P2_role.gotoAndStop("ready");
}
_level0.P1_role._x = _level0.P1_role.startX;
_level0.P2_role._x = _level0.P2_role.startX;
_level0.P1_role._y = _level0.P1_role.startY;
_level0.P2_role._y = _level0.P2_role.startY;
