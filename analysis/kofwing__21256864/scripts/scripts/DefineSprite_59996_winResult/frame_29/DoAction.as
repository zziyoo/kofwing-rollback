if(_level0.stageID == 7 && _level0.moreVs3V3 != true || _level0.stageID == 5 && _level0.moreVs3V3 == true)
{
   _level0.bossStageFinal_snd.start();
}
else if(_level0.SE_old)
{
   _level0.bossStage97_snd.start();
}
else
{
   _level0.bossStage02um_snd.start();
}
