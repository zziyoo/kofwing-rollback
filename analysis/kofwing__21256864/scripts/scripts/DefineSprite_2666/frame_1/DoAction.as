function loadOption()
{
   _level0.loadOption();
   if(!_level0.autoPlayGame)
   {
      level = _level0.level;
      playTime = _level0.playTime;
      life = _level0.lifeBar_num;
      power = _level0.superPoint;
   }
   else
   {
      level = 5;
      playTime = 99;
      life = 3;
      power = 0;
      _level0.level = 5;
      _level0.playTime = 99;
      _level0.lifeBar_num = 3;
      _level0.superPoint = 0;
   }
}
function saveOption()
{
   bgID = stage_select.bgID;
   if(!_level0.autoPlayGame)
   {
      _level0.saveOption(level,playTime,life,power,bgID,_level0.cpu_op_mode);
   }
}
function showOption()
{
   if(_level0.cpu_op_mode == "attack")
   {
      level_mc.gotoAndStop("5_attack");
   }
   else if(_level0.cpu_op_mode == "defend")
   {
      level_mc.gotoAndStop("5_defend");
   }
   else
   {
      level_mc.gotoAndStop(level);
   }
   if(playTime == 60)
   {
      playTime_mc.gotoAndStop(1);
   }
   else if(playTime == 99)
   {
      playTime_mc.gotoAndStop(2);
   }
   else if(playTime == 180)
   {
      playTime_mc.gotoAndStop(3);
   }
   else if(playTime == 300)
   {
      playTime_mc.gotoAndStop(4);
   }
   else
   {
      playTime_mc.gotoAndStop(5);
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
