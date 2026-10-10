function getAvg(array)
{
   var _loc2_ = 0;
   for(var _loc3_ in array)
   {
      if(!array[_loc3_])
      {
         array[_loc3_] = 0;
      }
      _loc2_ += array[_loc3_];
   }
   var _loc4_ = _loc2_ / array.length;
   return _loc4_;
}
var lifeArray = _level0.life_rate_array;
var timeArray = _level0.time_lifeBar_array;
var hitsArray = _level0.hits_array;
var lifeRate = int(getAvg(lifeArray) * 10000) / 100;
var timeRate = int(getAvg(timeArray) * 10000) / 100;
var hits = int(getAvg(hitsArray) * 100) / 100;
var winRate = int(_level0.roundNum_win / _level0.roundNum_played * 10000) / 100;
lifeRate_txt.text = lifeRate + "%";
timeRate_txt.text = timeRate + "%";
hitsRate_txt.text = hits;
winRate_txt.text = winRate + "%";
var bonus = 0;
if(_level0.moreVs3V3 == true)
{
   bonus = int(winRate * 200 * _level0.level * 0.2);
}
else if(_level0.moreVs == true)
{
   bonus = int(winRate * 100 * _level0.level * 0.2);
}
else
{
   bonus = int(winRate * 50 * _level0.level * 0.2);
}
score_stage_txt.text = bonus;
_level0.score += bonus;
score_txt.text = _level0.score;
_level0.scoreObj = {life:lifeRate,time:timeRate,win:winRate,combo:hits,role:_level0.charSelect_P1,level:_level0.level};
