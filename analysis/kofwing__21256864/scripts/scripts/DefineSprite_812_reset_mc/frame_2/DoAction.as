stopAllSounds();
_level0.bgmControl_mc.stageSound.setVolume(_root.BgmVolume);
_level0.bgmControl_mc.playSound();
_level0.P1_role.reset();
_level0.P2_role.reset();
_level0.P1_role.control = true;
_level0.P2_role.control = true;
_level0.P1_role.bloodPower = false;
_level0.P2_role.bloodPower = false;
_level0.P1_role.ashPower = false;
_level0.P2_role.ashPower = false;
_level0.P1_role.nonSkill = false;
_level0.P2_role.nonSkill = false;
_level0.P1_role.stopCC = false;
_level0.P2_rolev.stopCC = false;
_level0.menu_bottom_mc.mc.trigger_setting._visible = false;
if(_level0.player_type == "trainning")
{
   _level0.restoreLifePower();
   _level0.life_power_mc.time_mc.init_time();
}
if(_level0.inPause)
{
   _level0.game_pause();
}
_level0.stageControl_mc.resetPosY();
_level0.inPause = false;
_level0.inFreeze = false;
_root.P1_role.colorChange("normal");
_root.P2_role.colorChange("normal");
_level0.zoomControl_mc.zoomBack(0.5);
_level0.P1_role.reload();
_level0.P2_role.reload();
_level0.P1_role._visible = true;
_level0.P2_role._visible = true;
_level0.P1_role.colorNormal();
_level0.P2_role.colorNormal();
_level0.P1_role.inFreeze = false;
_level0.P2_role.inFreeze = false;
_root.P1_role.inBurst = false;
_root.P1_role.burst_mode = "";
_root.P2_role.inBurst = false;
_root.P2_role.burst_mode = "";
_level0.stageControl_mc.stopControl();
_level0.stageControl_mc.startControl();
