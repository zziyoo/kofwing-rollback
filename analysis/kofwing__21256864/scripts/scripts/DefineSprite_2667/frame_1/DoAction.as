function loadOption()
{
   _level0.loadOption();
   level = _level0.level;
   playTime = _level0.playTime;
   life = _level0.lifeBar_num;
   power = _level0.superPoint;
}
function saveOption()
{
   bgID = stage_select.bgID;
   _level0.saveOption(level,playTime,life,power,bgID);
}
function showOption()
{
   level_mc.gotoAndStop(level);
   if(playTime == 60)
   {
      playTime_mc.gotoAndStop(1);
   }
   else if(playTime == 99)
   {
      playTime_mc.gotoAndStop(2);
   }
   else
   {
      playTime_mc.gotoAndStop(3);
   }
   life_mc.gotoAndStop(life);
   power_mc.gotoAndStop(power + 1);
}
stop();
var level;
var playTime;
var life;
var power;
var bgID;
if(dd == undefined)
{
   loadOption();
   showOption();
   dd = 1;
}
