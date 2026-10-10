function goNext()
{
   if(_level0.selectCount1P >= _level0.selectMax)
   {
      play();
   }
}
var hasRandom = false;
hasRandom = _level0.ranCharSelect || _level0.ranCharSelectNum2 || _level0.ranCharSelectNum3;
var hasRandomNormal = false;
hasRandomNormal = _level0.ranCharSelectN || _level0.ranCharSelectNNum2 || _level0.ranCharSelectNNum3;
if(_level0.moreVs == true && !(_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true)
{
   stop();
   setTimeout(function()
   {
      if(hasRandom || hasRandomNormal)
      {
         select_mc.player.selectOK_random();
      }
   }
   ,4000);
}
else if(_level0.moreVs == true && !(_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true)
{
   stop();
   setTimeout(function()
   {
      if(hasRandom || hasRandomNormal)
      {
         select_mc.player.selectOK_random();
      }
   }
   ,5000);
}
else if(_level0.moreVs3V3 == true)
{
   stop();
   setTimeout(function()
   {
      if(hasRandom || hasRandomNormal)
      {
         select_mc.player.selectOK_random();
      }
   }
   ,4000);
}
else if(_level0.moreVs == true)
{
   stop();
   setTimeout(function()
   {
      if(hasRandom || hasRandomNormal)
      {
         select_mc.player.selectOK_random();
      }
   }
   ,3500);
}
else
{
   stop();
   setTimeout(function()
   {
      if(hasRandom || hasRandomNormal)
      {
         select_mc.player.selectOK_random();
      }
   }
   ,3000);
}
var checkTime;
clearInterval(checkTime);
checkTime = setInterval(this,"goNext",500);
