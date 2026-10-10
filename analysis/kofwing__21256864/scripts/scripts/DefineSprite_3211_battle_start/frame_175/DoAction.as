stop();
if(_level0.mode_role_P1 != 1)
{
   _level0.P1_role.gotoAndStop("stand" + _level0.mode_role_P1);
}
else
{
   _level0.P1_role.gotoAndStop("stand");
}
if(_level0.mode_role_P2 != 1)
{
   _level0.P2_role.gotoAndStop("stand" + _level0.mode_role_P2);
}
else
{
   _level0.P2_role.gotoAndStop("stand");
}
_level0.role_control();
setTimeout(function()
{
   _level0.transOut();
}
,150);
