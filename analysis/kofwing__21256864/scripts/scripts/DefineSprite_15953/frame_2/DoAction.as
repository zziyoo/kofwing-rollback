if(_level0.inPause)
{
   return undefined;
}
if(_level0.inFreeze)
{
   return undefined;
}
var rate = - d_rate;
role.lifeObj.d_rate = rate;
role.lifeControl(role.lifeObj,true);
