var role = _root.role_mc;
var opp = role.opp;
if(Math.abs(role._x - opp._x) < 200)
{
   if(opp.life > 10 || _level0.lifeBar_num == -1)
   {
      t++;
      opp.lifeObj.d_rate = 0.05 + 0.01 * (t / 10);
      opp.lifeControl(opp.lifeObj);
   }
}
