var role = _root.role_mc;
if(role.life > 10 || _level0.lifeBar_num == -1)
{
   role.lifeObj.d_rate = d_rate;
   role.lifeControl(role.lifeObj);
}
_root.role_mc.colorChange(color1);
num++;
