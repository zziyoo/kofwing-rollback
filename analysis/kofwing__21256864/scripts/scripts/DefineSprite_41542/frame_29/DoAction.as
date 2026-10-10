if(_root.role_mc.Vwalk == 17 && _level0.roundNum == 1 && _level0.player_type == "1PVSCOM" && _root.role_mc == _level0.P2_role)
{
   _root.role_mc.Vwalk = 18;
   stopAllSounds();
   _level0.bgmControl_mc.loadSound("Iori3","Iori");
   _level0.bgmControl_mc.playSound();
}
