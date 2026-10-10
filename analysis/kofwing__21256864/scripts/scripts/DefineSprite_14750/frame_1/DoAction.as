stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var role = _root.role_mc;
var opp = role.opp;
if(defendSuper == false)
{
   if(opp.superSkill || opp.inBurstSkill)
   {
      return undefined;
   }
}
