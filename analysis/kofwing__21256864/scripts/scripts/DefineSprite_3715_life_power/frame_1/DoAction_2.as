if(_root.skillhit == false)
{
   skillhit._visible = false;
   LP_P1.lifeBar_mc._visible = true;
   LP_P2.lifeBar_mc._visible = true;
   LP_P1.name_mc._visible = true;
   LP_P2.name_mc._visible = true;
   LP_P1.powerBar_mc._visible = true;
   LP_P2.powerBar_mc._visible = true;
   LP_P1.life_num._visible = true;
   LP_P2.life_num._visible = true;
   time_mc._visible = true;
   time._visible = true;
}
if(_root.skillhit == true)
{
   LP_P1.lifeBar_mc._visible = false;
   LP_P2.lifeBar_mc._visible = false;
   LP_P1.name_mc._visible = false;
   LP_P2.name_mc._visible = false;
   LP_P1.powerBar_mc._visible = false;
   LP_P2.powerBar_mc._visible = false;
   LP_P1.life_num._visible = false;
   LP_P2.life_num._visible = false;
   time_mc._visible = false;
   time._visible = false;
}
