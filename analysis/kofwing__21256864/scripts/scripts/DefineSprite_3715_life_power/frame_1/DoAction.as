function updatePlayerType()
{
   checkChangeColor();
   _level0.showWintimes();
   playerTxt1P.text = _level0.playerType1P;
   playerTxt2P.text = _level0.playerType2P;
   var _loc9_;
   if(_level0.player_type == "1PVSCOM")
   {
      if(stageNow.text == "BOSS")
      {
         bossLifeTxt.text = int(_level0.P2_role.life);
      }
      else
      {
         bossLifeTxt.text = "";
      }
      _loc9_ = int(_level0.roundNum_win / _level0.roundNum_played * 10000) / 100;
      winRateTxt.text = Math.round(_loc9_) + "%";
   }
   winTimes_P1.gotoAndStop(P1_role.winTimes + 1);
   winTimes_P2.gotoAndStop(P2_role.winTimes + 1);
   var _loc4_ = new Date();
   var _loc8_ = _loc4_.getHours();
   var _loc1_ = _loc4_.getMinutes();
   var _loc2_ = _loc4_.getSeconds();
   var _loc3_ = false;
   if((_loc1_ == 29 || _loc1_ == 59) && (_loc2_ >= 30 && _loc2_ <= 59))
   {
      _loc3_ = true;
   }
   else if((_loc1_ == 30 || _loc1_ == 0) && (_loc2_ >= 0 && _loc2_ <= 30))
   {
      _loc3_ = true;
   }
   else
   {
      _loc3_ = false;
   }
   if(_loc3_ == true && _level0.showMoreMsg == true)
   {
      hourTxt._visible = true;
      minuteTxt._visible = true;
      secondTxt._visible = true;
   }
   else
   {
      hourTxt._visible = false;
      minuteTxt._visible = false;
      secondTxt._visible = false;
   }
   var _loc7_ = 0;
   var _loc5_ = 0;
   var _loc6_ = 0;
   _loc8_ >= 10 ? (_loc7_ = _loc8_) : (_loc7_ = "0" + _loc8_);
   _loc1_ >= 10 ? (_loc5_ = _loc1_) : (_loc5_ = "0" + _loc1_);
   _loc2_ >= 10 ? (_loc6_ = _loc2_) : (_loc6_ = "0" + _loc2_);
   hourTxt.text = _loc7_ + " : ";
   minuteTxt.text = _loc5_ + " : ";
   secondTxt.text = _loc6_;
}
function checkChangeColor()
{
   if(_level0.P1_role._roleName != undifined && _level0.P2_role._roleName != undifined)
   {
      if(_level0.P1_role._roleName == _level0.P2_role._roleName && _level0.p1colormode == _level0.p2colormode)
      {
         if(_level0.p1colormode == "normal")
         {
            if(_level0.P2_role._roleName == "KyoW" || _level0.P2_role._roleName == "Athena" || _level0.P2_role._roleName == "Ash" || _level0.P1_role._roleName == "Iori" && _level0.P1_role.roleMode == 3 && _level0.P2_role.roleMode == 3)
            {
               if(_level0.P2_role.roleMode == _level0.P1_role.roleMode)
               {
                  _level0.p2colormode = "black";
               }
               else
               {
                  _level0.p2colormode = "normal";
               }
            }
            else
            {
               _level0.p2colormode = "black";
            }
         }
         else
         {
            _level0.p2colormode = "normal";
         }
      }
      else if(_level0.P1_role._roleName != _level0.P2_role._roleName)
      {
         _level0.p2colormode = "normal";
      }
   }
   if(_level0.P2_role.normalmode != _level0.p2colormode)
   {
      _level0.P2_role.normalmode = _level0.p2colormode;
      _level0.P2_role.e_mode(_level0.P2_role,false);
   }
}
if(_level0.autoPlayGame)
{
   showAuto._visible = true;
   modeTxt._visible = false;
}
else
{
   showAuto._visible = false;
}
if(!_level0.autoPlayGame)
{
   if(_level0.player_type == "1PVSCOM")
   {
      modeTxt.text = "街机闯关/ARCADE";
   }
   else if(_level0.player_type == "vs")
   {
      modeTxt.text = "对战电脑/PVE";
   }
   else if(_level0.player_type == "1PVS2P")
   {
      modeTxt.text = "玩家对战/PVP";
   }
   else if(_level0.player_type == "COMVSCOM")
   {
      modeTxt.text = "观战模式/WATCH";
   }
   else
   {
      modeTxt.text = "练习模式/TRAINING";
   }
}
if(_level0.player_type != "1PVSCOM")
{
   stageTxt._visible = false;
   stageNow._visible = false;
   scoreNameTxt._visible = false;
   scoreTxt._visible = false;
   winRateNameTxt._visible = false;
   winRateTxt._visible = false;
}
if(_level0.player_type != "1PVSCOM" && _level0.player_type != "vs" && _level0.player_type != "COMVSCOM")
{
   levelTxt._visible = false;
   levelNow._visible = false;
}
else
{
   var txt = _level0.stageID + 1;
   if(_level0.moreVs3V3 != true)
   {
      if(txt == 4)
      {
         stageNow.text = "BOSS";
      }
      if(txt == 5)
      {
         txt = 4;
      }
      if(txt == 6)
      {
         txt = 5;
      }
      if(txt == 7)
      {
         txt = 6;
      }
      if(txt == 8)
      {
         stageNow.text = "BOSS";
      }
      if(txt == 9)
      {
         stageNow.text = "BOSS";
      }
   }
   else if(_level0.moreVs3V3 == true)
   {
      if(txt == 3)
      {
         stageNow.text = "BOSS";
      }
      if(txt == 4)
      {
         txt = 3;
      }
      if(txt == 5)
      {
         txt = 4;
      }
      if(txt == 6)
      {
         stageNow.text = "BOSS";
      }
      if(txt == 7)
      {
         stageNow.text = "BOSS";
      }
   }
   if(stageNow.text != "BOSS")
   {
      stageNow.text = txt.toString();
   }
   scoreTxt.text = _level0.score;
   if(_level0.player_type == "1PVSCOM")
   {
      loseNameTxt.text = "   LOSE:";
      loseTxt.text = _level0.loseTimes1PVSCOM >= 10 ? _level0.loseTimes1PVSCOM : "0" + _level0.loseTimes1PVSCOM;
   }
   if(stageNow.text == "BOSS")
   {
      bossLifeNameTxt.text = "BOSS_LIFE :";
      bossLifeTxt.text = "100%";
   }
   else
   {
      bossLifeNameTxt.text = "";
      bossLifeTxt.text = "";
   }
}
if(_level0.player_type != "1PVSCOM")
{
   var winShow1P;
   var winShow2P;
   if(_level0.player_type == "1PVS2P")
   {
      if(_level0.winTimes1PPVP < 10)
      {
         winShow1P = "0" + _level0.winTimes1PPVP;
      }
      else
      {
         winShow1P = _level0.winTimes1PPVP;
      }
      if(_level0.winTimes2PPVP < 10)
      {
         winShow2P = "0" + _level0.winTimes2PPVP;
      }
      else
      {
         winShow2P = _level0.winTimes2PPVP;
      }
   }
   if(_level0.player_type == "vs")
   {
      if(_level0.winTimes1PPVE < 10)
      {
         winShow1P = "0" + _level0.winTimes1PPVE;
      }
      else
      {
         winShow1P = _level0.winTimes1PPVE;
      }
      if(_level0.winTimes2PPVE < 10)
      {
         winShow2P = "0" + _level0.winTimes2PPVE;
      }
      else
      {
         winShow2P = _level0.winTimes2PPVE;
      }
   }
   if(_level0.player_type == "COMVSCOM")
   {
      if(_level0.winTimes1PEVE < 10)
      {
         winShow1P = "0" + _level0.winTimes1PEVE;
      }
      else
      {
         winShow1P = _level0.winTimes1PEVE;
      }
      if(_level0.winTimes2PEVE < 10)
      {
         winShow2P = "0" + _level0.winTimes2PEVE;
      }
      else
      {
         winShow2P = _level0.winTimes2PEVE;
      }
   }
   if(_level0.autoPlayGame)
   {
      bossLifeNameTxt.text = "P R E S S  S T A R T";
   }
   else if(_level0.winTimes2PPVP == 0 && _level0.player_type == "1PVS2P")
   {
      bossLifeNameTxt.text = "C H A L L E N G E R !";
   }
   else if(_level0.winTimes2PPVE == 0 && _level0.player_type == "vs")
   {
      bossLifeNameTxt.text = "C H A L L E N G E R !";
   }
   else if(_level0.winTimes2PEVE == 0 && _level0.player_type == "COMVSCOM")
   {
      bossLifeNameTxt.text = "C H A L L E N G E R !";
   }
   else
   {
      bossLifeNameTxt.text = "B E A T   B Y   :   " + winShow2P;
   }
   if(_level0.autoPlayGame)
   {
      loseNameTxt.text = "D E M O  M O D E";
   }
   else if(_level0.winTimes1PPVP == 0 && _level0.player_type == "1PVS2P")
   {
      loseNameTxt.text = "C H A L L E N G E R !";
   }
   else if(_level0.winTimes1PPVE == 0 && _level0.player_type == "vs")
   {
      loseNameTxt.text = "C H A L L E N G E R !";
   }
   else if(_level0.winTimes1PEVE == 0 && _level0.player_type == "COMVSCOM")
   {
      loseNameTxt.text = "C H A L L E N G E R !";
   }
   else
   {
      loseNameTxt.text = "B E A T   B Y   :   " + winShow1P;
   }
   loseTxt.text = "";
   bossLifeTxt.text = "";
}
if(_level0.player_type == "trainning")
{
   bossLifeNameTxt._visible = false;
   bossLifeTxt._visible = false;
   loseNameTxt._visible = false;
   loseTxt._visible = false;
}
if(_level0.P1_type == "cpu")
{
   _level0.playerType1P = "CPU";
}
else
{
   _level0.playerType1P = "1P";
}
if(_level0.P2_type == "cpu")
{
   _level0.playerType2P = "CPU";
}
else
{
   _level0.playerType2P = "2P";
}
hourTxt._visible = false;
minuteTxt._visible = false;
secondTxt._visible = false;
var update_timer;
clearInterval(update_timer);
update_timer = setInterval(this,"updatePlayerType",250);
onEnterFrame = function()
{
   if(_level0.raining == "" || _level0.raining == undefined)
   {
      return undefined;
   }
   if(_level0.raining == true)
   {
      tq_mc._visible = true;
   }
   else
   {
      tq_mc._visible = false;
   }
};
if(_level0.showMoreMsg != true)
{
   winRateTxt._visible = false;
   loseNameTxt._visible = false;
   scoreNameTxt._visible = false;
   scoreTxt._visible = false;
   loseTxt._visible = false;
   bossLifeNameTxt._visible = false;
   modeTxt._visible = false;
   levelTxt._visible = false;
   levelNow._visible = false;
   winRateNameTxt._visible = false;
   bossLifeTxt._visible = false;
   levelModeTxt._visible = false;
}
else
{
   winRateTxt._visible = true;
   loseNameTxt._visible = true;
   scoreNameTxt._visible = true;
   scoreTxt._visible = true;
   loseTxt._visible = true;
   bossLifeNameTxt._visible = true;
   modeTxt._visible = true;
   levelTxt._visible = true;
   levelNow._visible = true;
   winRateNameTxt._visible = true;
   bossLifeTxt._visible = true;
   if(_level0.player_type != "1PVSCOM")
   {
      stageTxt._visible = false;
      stageNow._visible = false;
      scoreNameTxt._visible = false;
      scoreTxt._visible = false;
      winRateNameTxt._visible = false;
      winRateTxt._visible = false;
   }
   levelNow.text = _level0.level;
   if(_level0.level == 5)
   {
      levelNow.text = _level0.level;
      levelModeTxt.text = _level0.cpu_op_mode.toUpperCase();
      levelModeTxt._visible = true;
   }
   else
   {
      levelModeTxt._visible = false;
   }
   if(_level0.player_type != "1PVSCOM" && _level0.player_type != "vs" && _level0.player_type != "COMVSCOM")
   {
      levelTxt._visible = false;
      levelNow._visible = false;
      levelModeTxt._visible = false;
   }
   if(_level0.player_type == "trainning")
   {
      bossLifeNameTxt._visible = false;
      bossLifeTxt._visible = false;
      loseNameTxt._visible = false;
      loseTxt._visible = false;
   }
   if(_level0.autoPlayGame)
   {
      showAuto._visible = true;
      modeTxt._visible = false;
   }
   else
   {
      showAuto._visible = false;
   }
}
