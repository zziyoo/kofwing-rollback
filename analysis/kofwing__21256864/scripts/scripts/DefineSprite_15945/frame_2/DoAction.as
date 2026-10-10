if(_level0.inPause)
{
   return undefined;
}
if(_level0.inFreeze)
{
   return undefined;
}
opp.lifeObj.d_rate = d_rate;
opp.lifeControl(opp.lifeObj);
