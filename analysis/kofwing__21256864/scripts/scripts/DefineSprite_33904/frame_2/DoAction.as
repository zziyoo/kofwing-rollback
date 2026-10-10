if(_level0.inPause)
{
   return undefined;
}
if(_level0.inFreeze)
{
   return undefined;
}
if(_root.role_mc.status_1 == "ready" || opp.life == _level0.life_max)
{
   gotoAndPlay(5);
}
else if(opp.life > 10 || _level0.lifeBar_num == -1)
{
   opp.lifeObj.d_rate = d_rate;
   opp.lifeControl(opp.lifeObj);
}
_root.role_mc.opp.colorChange(color1);
num++;
