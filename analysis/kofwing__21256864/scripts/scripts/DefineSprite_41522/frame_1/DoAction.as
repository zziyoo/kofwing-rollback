_level0.IoriStarted = 0;
if(_level0.player_type == "1PVSCOM" && _root.role_mc == _level0.P2_role)
{
   if(!(_parent.opp._roleName == "Iori" && _root.role_mc.opp.roleMode == 3))
   {
      _parent.opp.mc.stop();
   }
   stopAllSounds();
}
else
{
   gotoAndStop("do_begin");
   play();
}
