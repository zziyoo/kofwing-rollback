P1_role.roleName = P1_role._roleName;
P2_role.roleName = P2_role._roleName;
setTimeout(function()
{
   _level0.IoriStarted = 2;
}
,20000);
if(_level0.roundNum > 1)
{
   gotoAndStop("nextRound");
   play();
}
