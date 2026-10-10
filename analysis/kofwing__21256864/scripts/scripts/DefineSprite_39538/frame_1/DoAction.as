if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
if(effName == "bgEff_bloodiori_start")
{
   if(_level0.player_type == "1PVSCOM" && _root.role_mc == _level0.P2_role)
   {
      _level0.effect_mc.bgEff_start(effName,_root.role_mc.mc);
   }
}
else
{
   _level0.effect_mc.bgEff_start(effName,_root.role_mc.mc);
}
