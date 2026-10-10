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
stop();
if(_level0.lan == "en")
{
   nextFrame();
}
else if(_level0.lan == "cn2")
{
   gotoAndStop(3);
}
if(_level0.player_type != "1PVSCOM" && _level0.player_type != "vs")
{
   this._visible = false;
}
if(_level0.player_type == "vs" && _root.wface == 2)
{
   this._visible = false;
}
var lifeArray = _level0.life_rate_array_battle;
var timeArray = _level0.time_lifeBar_array_battle;
var hitsArray = _level0.hits_array;
var lifeRate = int(getAvg(lifeArray) * 10000) / 100;
if(lifeRate > 100)
{
   lifeRate = 100;
}
var timeRate = int(getAvg(timeArray) * 10000) / 100;
var hits = int(hitsArray[hitsArray.length - 1] * 100) / 100;
var winRate = int(_level0.roundNum_win / _level0.roundNum_played * 10000) / 100;
var isStraight = false;
if(_level0.roundNum_win_currentBattle / _level0.roundNum_played_currentBattle == 1)
{
   isStraight = true;
}
lifeRate_txt.text = lifeRate + "%";
timeRate_txt.text = timeRate + "%";
hits_txt.text = hits;
straight_txt.text = 0;
var score_rate;
var life_rate;
if(_level0.moreVs3V3 == true)
{
   score_rate = 1.1;
}
else
{
   score_rate = 1;
}
if(_level0.ranCharSelect || _level0.ranCharSelectN)
{
   score_rate += 0.05;
}
if(_level0.ranCharSelectNum2 || _level0.ranCharSelectNNum2)
{
   score_rate += 0.05;
}
if(_level0.ranCharSelectNum3 || _level0.ranCharSelectNNum3)
{
   score_rate += 0.05;
}
var currentRole = _level0.charSelect_P1_origin + mode_role_P1_origin;
var currentRole2 = _level0.charSelect_P12_origin + mode_role_P12_origin;
var currentRole3 = _level0.charSelect_P13_origin + mode_role_P13_origin;
if(_level0.arcade_Bosslist.join().indexof(currentRole) > -1)
{
   score_rate += -0.1;
}
if(_level0.arcade_Bosslist.join().indexof(currentRole2) > -1)
{
   score_rate += -0.1;
}
if(_level0.arcade_Bosslist.join().indexof(currentRole3) > -1)
{
   score_rate += -0.1;
}
var score = (lifeRate * 70 + timeRate * 70 + hits * 50) * (_level0.level / 5);
if(isStraight == true)
{
   score += 400 * _level0.level;
   straight_txt.text = 400 * _level0.level;
}
score += _level0.perfect_currentBattle.length * 1000 * 0.2 * _level0.level;
perfect_txt.text = _level0.perfect_currentBattle.length * 1000 * 0.2 * _level0.level;
score *= score_rate;
score = int(score);
if(_level0.player_type == "1PVSCOM")
{
   _level0.score += score;
}
score_stage_txt.text = score;
if(_level0.player_type == "1PVSCOM")
{
   score_txt.text = _level0.score;
}
if(_level0.player_type == "vs")
{
   score_txt.text = score;
}
