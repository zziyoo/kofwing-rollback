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
if(role.life > 10 || _level0.lifeBar_num == -1)
{
   role.lifeObj.d_rate = d_rate;
   role.lifeControl(role.lifeObj);
}
