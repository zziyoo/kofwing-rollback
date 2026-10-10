var role = _root.role_mc;
if(role.life > 10 || _level0.lifeBar_num == -1)
{
   role.lifeObj.d_rate = d_rate;
   role.lifeControl(role.lifeObj);
}
if(role.mc.powerLevel == 1)
{
   role.colorChange("white1");
}
if(role.mc.powerLevel == 2)
{
   role.colorChange("golden1");
}
if(role.mc.powerLevel >= 3)
{
   role.colorChange("red1");
}
num++;
