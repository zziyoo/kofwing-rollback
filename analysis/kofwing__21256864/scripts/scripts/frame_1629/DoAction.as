function setKey()
{
   u = key_P1[0].u;
   d = key_P1[0].d;
   f = key_P1[0].f;
   b = key_P1[0].b;
   p = key_P1[0].p;
   p_l = key_P1[0].p_l;
   k_l = key_P1[0].k_l;
   u2 = key_P2[0].u;
   d2 = key_P2[0].d;
   f2 = key_P2[0].f;
   b2 = key_P2[0].b;
   p2 = key_P2[0].p;
   p_l2 = key_P2[0].p_l;
   k_l2 = key_P2[0].k_l;
}
function resetData()
{
   inFreeze = false;
   inPause = false;
   KO = false;
   roundNum = 1;
   loseTimes_P1 = 0;
   loseTimes_P2 = 0;
   orderNum_p1 = 0;
   orderNum_p2 = 0;
   firstNum1P = 0;
   firstNum2P = 0;
   stageID = 0;
   isKO = "";
   timeOver = false;
   roundNum_played = 0;
   roundNum_win = 0;
   roundNum_played_currentBattle = 0;
   roundNum_win_currentBattle = 0;
   perfect_currentBattle = [];
   loseTimes1PVSCOM = 0;
   first_attack = true;
}
function restScoreData()
{
   score = 0;
   roundNum_played = 0;
   roundNum_win = 0;
   loseTimes1PVSCOM = 0;
   time_lifeBar_array = [];
   life_rate_array = [];
   hits_array = [];
   life_rate_array_battle = [];
   time_lifeBar_array_battle = [];
   roundNum_played_currentBattle = 0;
   roundNum_win_currentBattle = 0;
   perfect_currentBattle = [];
   first_attack = true;
}
function setSound(obj)
{
   if(soundOn == false)
   {
      soundControl.setVolume(volume);
      soundOn = true;
      obj.gotoAndStop(1);
   }
   else if(soundOn)
   {
      soundControl.setVolume(0);
      soundOn = false;
      obj.gotoAndStop(2);
   }
}
function musicStart()
{
   bgMusic_snd.stop();
   bgMusic_snd.start(0,100);
   bgMusic_snd.onSoundComplete = function()
   {
   };
}
function soundStart(obj)
{
   if(soundOn)
   {
      var sound;
      var fromMC;
      fromMC = obj.fromMC;
      if(fromMC instanceof MovieClip)
      {
         sound = new Sound();
         sound.attachSound(obj.sound);
         sound.start(obj.startPos,obj.loop);
         fromMC.onUnload = function()
         {
            sound.stop();
         };
      }
      else
      {
         sound = this[obj.sound];
         sound.start(obj.startPos,obj.loop);
      }
   }
}
function fullScreen()
{
   if(inFullScreen)
   {
      fscommand("exec","changedisplay2.exe");
      fscommand("fullscreen",false);
      inFullScreen = false;
      return undefined;
   }
   inFullScreen = true;
   fscommand("exec","changedisplay1.exe");
   fscommand("fullscreen",true);
}
function exitFullScreen()
{
   fscommand("exec","changedisplay2.exe");
   fscommand("fullscreen",false);
}
function game_setQuality(num)
{
   game_quality = num;
   menu_quality.mc_1.gotoAndStop(1);
   menu_quality.mc_2.gotoAndStop(1);
   menu_quality.mc_3.gotoAndStop(1);
   menu_quality["mc_" + game_quality].gotoAndStop(2);
   if(num == 1)
   {
      _quality = "LOW";
   }
   else if(num == 2)
   {
      _quality = "MEDIUM";
   }
   else
   {
      _quality = "HIGH";
   }
}
function game_getQuality(obj)
{
   if(_quality == "LOW")
   {
      game_quality = 1;
   }
   else if(_quality == "MEDIUM")
   {
      game_quality = 2;
   }
   else
   {
      game_quality = 3;
   }
   obj.mc1.gotoAndStop(1);
   obj.mc2.gotoAndStop(1);
   obj.mc3.gotoAndStop(1);
   obj["mc_" + game_quality].gotoAndStop(2);
   menu_quality = obj;
}
function transIn()
{
   trans = attachMovie("trans","trans",_level0.depth_trans);
   return trans;
}
function transOut()
{
   trans.gotoAndPlay("out");
}
function saveFunc(name, value)
{
   setting.data[name] = value;
   setting.flush();
}
function saveOption(lv, tm, lf, pw, _bgID, lvStyle)
{
   level = lv;
   playTime = tm;
   lifeBar_num = lf;
   superPoint = pw;
   setting.data.level = lv;
   setting.data.cpu_op_mode = lvStyle;
   setting.data.playTime = tm;
   setting.data.lifeBar_num = lf;
   setting.data.superPoint = pw;
   setting.data.passTimes = passTimes;
   setting.data.passCharArray = passCharArray;
   setting.data.hiddenCharArray = hiddenCharArray;
   setting.flush();
}
function saveKey()
{
   setting.data.key_P1 = key_P1;
   setting.data.key_P2 = key_P2;
}
function saveCombo()
{
   setting.data["comboRecord_array_" + charSelect_P1] = comboRecord_array;
}
function saveGlow(bool)
{
   setting.data.glowMode = bool;
   setting.flush();
   glowMode = bool;
}
function getGlowData()
{
   return glowMode;
}
function saveXIIIeff(bool)
{
   setting.data.XIIIeff = bool;
   setting.flush();
   XIIIeff = bool;
}
function getXIIIEffData()
{
   return XIIIeff;
}
function saveEffType(bool)
{
   setting.data.glowType = bool;
   setting.flush();
   glowType = bool;
}
function getEffTypeData()
{
   return glowType;
}
function saveXIIIeffOpen(bool)
{
   setting.data.XIIIeffOpen = bool;
   setting.flush();
   XIIIeffOpen = bool;
}
function getEffOpenData()
{
   return XIIIeffOpen;
}
function saveCounter(bool)
{
   setting.data.counterMode = bool;
   setting.flush();
   counterMode = bool;
}
function getCounter()
{
   return counterMode;
}
function saveloading(bool)
{
   setting.data.loading = bool;
   setting.flush();
   loading = bool;
}
function getloading()
{
   return loading;
}
function saveBGM(bool)
{
   setting.data.BGM = bool;
   setting.flush();
   BgmVolume = bool;
}
function getBGM()
{
   return BGM;
}
function saveBgmVolume(bool)
{
   setting.data.BgmVolume = bool;
   setting.flush();
   BgmVolume = bool;
}
function saveEffectVolume(bool)
{
   setting.data.volume = bool;
   setting.flush();
   volume = bool;
}
function savedefend(bool)
{
   setting.data.defend = bool;
   setting.flush();
   defend = bool;
}
function getdefend()
{
   return defend;
}
function savemoreVs(bool)
{
   setting.data.moreVs = bool;
   setting.flush();
   moreVs = bool;
   if(bool == false)
   {
      moreVs3V3 = bool;
      savemoreVs3V3(moreVs3V3);
   }
}
function getmoreVs()
{
   return moreVs;
}
function savemoreVs3V3(bool)
{
   setting.data.moreVs3V3 = bool;
   setting.data.moreVs = bool;
   setting.flush();
   moreVs3V3 = bool;
   if(bool == true)
   {
      moreVs = bool;
      savemoreVs(moreVs);
   }
}
function getmoreVs3V3()
{
   return moreVs3V3;
}
function saveShowMoreMsg(bool)
{
   setting.data.showMoreMsg = bool;
   showMoreMsg = bool;
   setting.flush();
}
function getShowMoreMsg()
{
   return showMoreMsg;
}
function saveSE_OLD(bool)
{
   setting.data.SE_old = bool;
   SE_old = bool;
   setting.flush();
}
function getSE_OLD()
{
   return SE_old;
}
function saveFlashing(bool)
{
   setting.data.flashing = bool;
   setting.flush();
   flashing = bool;
}
function savePassKusanagi()
{
   setting.data.passKusanagi = true;
   setting.flush();
   passKusanagi = true;
}
function getFlashing()
{
   return flashing;
}
function saveGlow2P(bool)
{
   setting.data.glow2P = false;
   setting.flush();
}
function getGlow2P()
{
   return false;
}
function saveGlow2Ptype(bool)
{
   bool = false;
   glow2Ptype = bool;
   saveGlow2P(glow2P);
}
function getGlow2Ptype()
{
   return glow2Ptype;
}
function char_kwUnlock()
{
   setting.data.kwUnlock = true;
   setting.flush();
}
function saveAshShadow(bool)
{
   setting.data.ashShadow = bool;
   setting.flush();
   ashShadow = bool;
   if(charSelect_P1 == "Ash" && mode_role_P1 == 2)
   {
      P1_role.e_mode(P1_role,ashShadow);
   }
   if(charSelect_P2 == "Ash" && mode_role_P2 == 2)
   {
      P2_role.e_mode(P2_role,ashShadow);
   }
}
function getAshShadow()
{
   return ashShadow;
}
function loadOption()
{
   if(setting.data.level == undefined)
   {
      return undefined;
   }
   level = setting.data.level;
   cpu_op_mode = setting.data.cpu_op_mode;
   playTime = setting.data.playTime;
   lifeBar_num = setting.data.lifeBar_num;
   superPoint = setting.data.superPoint;
   if(!isNaN(setting.data.passTimes))
   {
      passTimes = setting.data.passTimes;
   }
   if(setting.data.passCharArray)
   {
      passCharArray = setting.data.passCharArray;
   }
   if(setting.data.hiddenCharArray)
   {
      hiddenCharArray = setting.data.hiddenCharArray;
   }
   if(setting.data.charGetObj)
   {
      charGetObj = setting.data.charGetObj;
   }
   if(setting.data.charPassObj)
   {
      charPassObj = setting.data.charPassObj;
   }
   _level0.out("setting.data.charGetObj:" + setting.data.charGetObj);
   _level0.out("setting.data.charPassObj:" + setting.data.charPassObj);
   if(setting.data.passChar)
   {
      passChar = setting.data.passChar;
   }
   if(setting.data.passIori3)
   {
      passIori3 = setting.data.passIori3;
   }
   if(setting.data.passOrochi)
   {
      passOrochi = setting.data.passOrochi;
   }
   if(setting.data.passIgniz)
   {
      passIgniz = setting.data.passIgniz;
   }
   if(setting.data.passRugal)
   {
      passRugal = setting.data.passRugal;
   }
}
function get_playedTimes()
{
   if(!setting.data.playedTimes)
   {
      setting.data.playedTimes = 1;
      playedTimes = 1;
   }
   else
   {
      setting.data.playedTimes++;
      playedTimes = setting.data.playedTimes;
   }
   return playedTimes;
}
function loadDefault()
{
   level = 5;
   playTime = 99;
   lifeBar_num = 5;
   superPoint = 0;
   passTimes = 0;
   passCharArray = [];
   hiddenCharArray = [];
   charGetObj = {};
   charPassObj = {};
   passChar = [];
   passIori3 = false;
   passOrochi = false;
   passIgniz = false;
   passRugal = false;
   hideHint = false;
}
function loadKey()
{
   if(setting.data.key_P1 == undefined)
   {
      return undefined;
   }
   key_P1 = setting.data.key_P1;
   key_P2 = setting.data.key_P2;
   if(key_P1_proto.f == 0)
   {
      key_P1_proto.f = 68;
   }
   setKey();
}
function loadCombo()
{
   if(setting.data["comboRecord_array_" + charSelect_P1] != undefined)
   {
      comboRecord_array = setting.data["comboRecord_array_" + charSelect_P1];
   }
}
function combo_new(combo)
{
   comboRecord_current = combo;
}
function getCPUList()
{
   cpuBoss_list = new Array();
   var _loc2_ = new Array();
   var _loc1_ = 0;
   var _loc13_;
   var _loc9_;
   var _loc4_;
   var _loc7_;
   while(_loc1_ < cpuNormal_list.length)
   {
      _loc13_ = Math.random();
      _loc9_ = Math.random();
      _loc4_ = _loc9_ >= 0.5 ? 2 : 1;
      if(cpuNormal_list[_loc1_] == "Kyo")
      {
         _loc7_ = Math.random();
         if(_loc7_ < 0.2)
         {
            _loc2_.push({char:"Kusanagi_1",order:_loc13_});
         }
         else if(_loc7_ < 0.6)
         {
            _loc2_.push({char:"Kyo_" + _loc4_.toString(),order:_loc13_});
         }
         else
         {
            _loc2_.push({char:"KyoW_" + _loc4_.toString(),order:_loc13_});
         }
      }
      else if(cpuNormal_list[_loc1_] == "Ash")
      {
         _loc2_.push({char:"Ash_1",order:_loc13_});
      }
      else if(cpuNormal_list[_loc1_] == "Nameless")
      {
         _loc2_.push({char:"Nameless_1",order:_loc13_});
      }
      else if(cpuNormal_list[_loc1_] == "Andy")
      {
         _loc2_.push({char:"Andy_1",order:_loc13_});
      }
      else if(cpuNormal_list[_loc1_] == "Oswald")
      {
         _loc2_.push({char:"Oswald_1",order:_loc13_});
      }
      else
      {
         _loc2_.push({char:cpuNormal_list[_loc1_] + "_" + _loc4_.toString(),order:_loc13_});
      }
      _loc1_ = _loc1_ + 1;
   }
   _loc2_.sortOn("order",Array.NUMERIC);
   var _loc3_ = new Array();
   var _loc6_ = new Array();
   var _loc11_ = new Array();
   var _loc5_ = 0;
   while(_loc5_ < 14)
   {
      _loc3_.push(_loc2_[_loc5_].char);
      _loc5_ = _loc5_ + 1;
   }
   var _loc10_ = 0;
   var _loc15_ = Math.random();
   var _loc18_ = Math.random();
   var _loc8_;
   _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      if(_loc3_[_loc1_] == "Iori_1" || _loc3_[_loc1_] == "Iori_2")
      {
         _loc10_ = 1;
      }
      if(_loc3_[_loc1_] == "Ash_1")
      {
         _loc10_ = 2;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(_loc10_ == 1)
   {
      if(_loc15_ <= 0.5)
      {
         _loc8_ = "Ash_2";
      }
      else
      {
         _loc8_ = "Goenitz_1";
      }
   }
   else if(_loc10_ == 2)
   {
      if(_loc15_ <= 0.5)
      {
         _loc8_ = "Iori_3";
      }
      else
      {
         _loc8_ = "Goenitz_1";
      }
   }
   else if(_loc18_ <= 0.33)
   {
      _loc8_ = "Goenitz_1";
   }
   else if(_loc18_ <= 0.66)
   {
      _loc8_ = "Iori_3";
   }
   else
   {
      _loc8_ = "Ash_2";
   }
   _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      if(_level0.moreVs3V3 != true && _loc1_ == 3)
      {
         _loc6_.push(_loc8_);
      }
      else if(_level0.moreVs3V3 != true && _loc1_ == 10)
      {
         _loc11_.push("");
      }
      else if(_level0.moreVs3V3 == true && _loc1_ == 6)
      {
         _loc6_.push(_loc8_);
      }
      else if(_loc1_ < 7)
      {
         _loc6_.push(_loc3_[_loc1_]);
      }
      else
      {
         _loc11_.push(_loc3_[_loc1_]);
      }
      _loc1_ = _loc1_ + 1;
   }
   if(!_loc6_)
   {
      _loc6_ = [];
   }
   var _loc17_;
   var _loc14_;
   if(!onLine)
   {
      _loc17_ = Math.random();
      _loc14_ = Math.random();
      if(_loc17_ <= 0.33)
      {
         if(_loc14_ <= 0.5)
         {
            cpuBoss_list.push("Krizalid_1");
         }
         else
         {
            cpuBoss_list.push("Krizalid_2");
         }
      }
      else if(_loc17_ <= 0.66)
      {
         if(_loc14_ <= 0.5)
         {
            cpuBoss_list.push("Rugal_1");
         }
         else
         {
            cpuBoss_list.push("Rugal_2");
         }
      }
      else if(_loc14_ <= 0.5)
      {
         cpuBoss_list.push("Zero_1");
      }
      else
      {
         cpuBoss_list.push("Zero_2");
      }
   }
   var _loc19_ = Math.random();
   var _loc16_ = Math.random();
   if(_loc19_ <= 0.5)
   {
      if(_loc16_ <= 0.5)
      {
         cpuBoss_list.push("Orochi_1");
      }
      else
      {
         cpuBoss_list.push("Orochi_2");
      }
   }
   else if(_loc16_ < 0.5)
   {
      cpuBoss_list.push("Igniz_1");
   }
   else
   {
      cpuBoss_list.push("Igniz_2");
   }
   _loc6_ = _loc6_.concat(cpuBoss_list);
   if(_level0.moreVs == true)
   {
      _loc6_ = _loc6_.concat(_loc11_);
   }
   return _loc6_;
}
function out(str)
{
}
function rerole()
{
   P1_mc.addPlayer(P1_type,mode_role_P1);
   P2_mc.addPlayer(P2_type,mode_role_P2);
}
function checkOutRole()
{
   var _loc3_ = ["Kim","Nameless","Moriya","Andy"];
   roleNameP1 = charSelect_P1;
   roleNameP2 = charSelect_P2;
   roleModeP1 = mode_role_P1;
   roleModeP2 = mode_role_P2;
   if(moreVs == true)
   {
      if(loseTimes_P1 == 1)
      {
         roleNameP1 = charSelect_P12;
         roleModeP1 = mode_role_P12;
      }
      else if(loseTimes_P1 == 2)
      {
         roleNameP1 = charSelect_P13;
         roleModeP1 = mode_role_P13;
      }
      if(loseTimes_P2 == 1)
      {
         roleNameP2 = charSelect_P22;
         roleModeP2 = mode_role_P22;
      }
      else if(loseTimes_P2 == 2)
      {
         roleNameP2 = charSelect_P23;
         roleModeP2 = mode_role_P23;
      }
   }
   var _loc1_ = 0;
   var _loc2_;
   while(_loc1_ < _loc3_.length)
   {
      _loc2_ = _loc3_[_loc1_];
      if(roleNameP1 == _loc2_)
      {
         loadP1();
      }
      if(roleNameP2 == _loc2_)
      {
         loadP2();
      }
      _loc1_ = _loc1_ + 1;
   }
}
function loadP1()
{
   var _loc1_ = charSelect_P1;
   if(moreVs == true)
   {
      if(loseTimes_P1 == 1)
      {
         _loc1_ = charSelect_P12;
      }
      else if(loseTimes_P1 == 2)
      {
         _loc1_ = charSelect_P13;
      }
   }
   var _loc2_ = new MovieClipLoader();
   var _loc3_ = new Object();
   P1_mc = char_mc.createEmptyMovieClip("P1_mc",depth_P1);
   P1_mc._lockroot = true;
   _loc2_.loadClip("char/" + _loc1_ + ".swf",P1_mc);
}
function loadP2()
{
   var _loc1_ = charSelect_P2;
   if(moreVs == true)
   {
      if(loseTimes_P2 == 1)
      {
         _loc1_ = charSelect_P22;
      }
      else if(loseTimes_P2 == 2)
      {
         _loc1_ = charSelect_P23;
      }
   }
   var _loc2_ = new MovieClipLoader();
   var _loc3_ = new Object();
   P2_mc = char_mc.createEmptyMovieClip("P2_mc",depth_P2);
   P2_mc._lockroot = true;
   _loc2_.loadClip("char/" + _loc1_ + ".swf",P2_mc);
}
function role_mode(role, modes, roleX, toStatus, roleName, isCon)
{
   roleNameP1 = charSelect_P1;
   roleNameP2 = charSelect_P2;
   roleModeP1 = mode_role_P1;
   roleModeP2 = mode_role_P2;
   if(moreVs == true)
   {
      if(loseTimes_P1 == 1)
      {
         roleNameP1 = charSelect_P12;
         roleModeP1 = mode_role_P12;
      }
      else if(loseTimes_P1 == 2)
      {
         roleNameP1 = charSelect_P13;
         roleModeP1 = mode_role_P13;
      }
      if(loseTimes_P2 == 1)
      {
         roleNameP2 = charSelect_P22;
         roleModeP2 = mode_role_P22;
      }
      else if(loseTimes_P2 == 2)
      {
         roleNameP2 = charSelect_P23;
         roleModeP2 = mode_role_P23;
      }
   }
   var pp1 = _level0.LP_P1.powerPoint_num;
   var pp2 = _level0.LP_P2.powerPoint_num;
   var pp = role.player_order;
   if(pp == 1)
   {
      pp = 1;
   }
   if(pp == 2)
   {
      pp = 2;
   }
   if(pp == "" || pp == undefined)
   {
      return undefined;
   }
   var _loc4_ = winTimesP1;
   var _loc3_ = winTimesP2;
   P1_role.winTimes = winTimesP1;
   P2_role.winTimes = winTimesP2;
   var _loc2_;
   if(roleName != undefined)
   {
      var showRole;
      if(!loading)
      {
         P1_mc = char_mc.attachMovie("role_" + roleNameP1,"P1_mc",depth_P1);
         P2_mc = char_mc.attachMovie("role_" + roleNameP2,"P2_mc",depth_P2);
         P1_mc._lockroot = true;
         P2_mc._lockroot = true;
         checkOutRole();
         setTimeout(function()
         {
            showRole = setInterval(function()
            {
               moreVsRole_mode(roleNameP1,roleModeP1,roleNameP2,roleModeP2,pp,pp1,pp2);
               power_initMoreVs(roleNameP1,roleModeP1,roleNameP2,roleModeP2);
               P1_role.winTimes = winTimesP1;
               P2_role.winTimes = winTimesP2;
               P1_role.life = _level0.currentLifeP1;
               P2_role.life = _level0.currentLifeP2;
               P1_role.life_max = _level0.lifeMaxP1;
               P2_role.life_max = _level0.lifeMaxP2;
               if(P1_role.life < P1_role.life_max / 4)
               {
                  P1_role.redBlood = true;
               }
               else
               {
                  P1_role.redBlood = false;
               }
               if(P2_role.life < P2_role.life_max / 4)
               {
                  P2_role.redBlood = true;
               }
               else
               {
                  P2_role.redBlood = false;
               }
               if(P2_mc.role_mc.status_1 == "stand" && P1_mc.role_mc.status_1 == "stand")
               {
                  transOut();
                  clearInterval(showRole);
               }
            }
            ,250);
         }
         ,250);
      }
      else
      {
         if(pp == 1)
         {
            P1_mc.loadMovie("char/" + roleName + ".swf");
         }
         if(pp == 2)
         {
            P2_mc.loadMovie("char/" + roleName + ".swf");
         }
      }
   }
   else
   {
      if(pp == "")
      {
         return undefined;
      }
      if(isNoEnemyMode)
      {
         superPoint = 3;
      }
      P1_role.normalmode = p1colormode;
      P2_role.normalmode = p2colormode;
      P1_role.e_mode(P1_role,ashShadow);
      P2_role.e_mode(P2_role,ashShadow);
      P1_role.player_type = P1_type;
      P2_role.player_type = P2_type;
      P1_role.init(key_P1,mode_key_P1);
      P2_role.init(key_P2,mode_key_P2);
      _loc2_ = life_max * lifeBar_num;
      if(pp == 1)
      {
         P1_role.stageVar(_loc2_,pp1,powerPoint_max,P2_role,mode_P1,P1_role.life);
         P1_role.stageInf(stage_with,egde_max,egde_min,200,land_Y);
      }
      if(pp == 2)
      {
         P2_role.stageVar(_loc2_,pp2,powerPoint_max,P1_role,mode_P2,P2_role.life);
         P2_role.stageInf(stage_with,egde_max,egde_min,663,land_Y);
      }
      loadCombo();
      if(isCon)
      {
         role_control(true);
      }
      if(pp == 1)
      {
         P1_role;
         roleMode = modes;
         P1_role[toStatus]();
         P1_role.roleMode = modes;
         life_power_mc.LP_P1.burst_end();
      }
      if(pp == 2)
      {
         P2_role.roleMode = modes;
         P2_role[toStatus]();
         P2_role;
         roleMode = modes;
         life_power_mc.LP_P2.burst_end();
      }
      P1_role.player_order = 1;
      P2_role.player_order = 2;
      P1_role.winTimes = _loc4_;
      P2_role.winTimes = _loc3_;
   }
   P1_role.reload();
   P2_role.reload();
}
function role_init()
{
   _level0.out("初始化角色1111:" + P2_mc + "   " + P2_mc.role_mc + "   " + charSelect_P2 + "  " + mode_role_P2);
   if(isNoEnemyMode)
   {
      superPoint = 3;
   }
   P1_mc.addPlayer(P1_type,mode_role_P1);
   P2_mc.addPlayer(P2_type,mode_role_P2);
   P1_role = P1_mc.role_mc;
   P2_role = P2_mc.role_mc;
   P1_role.player_order = 1;
   P2_role.player_order = 2;
   P1_role.normalmode = p1colormode;
   P2_role.normalmode = p2colormode;
   P1_role.roleMode = mode_role_P1;
   P2_role.roleMode = mode_role_P2;
   P1_role.e_mode(P1_role,ashShadow);
   P2_role.e_mode(P2_role,ashShadow);
   if(glow2P && charSelect_P1 == charSelect_P2)
   {
      if(P1_role.normalmode == P2_role.normalmode)
      {
         if(charSelect_P1 == "Zero" || charSelect_P1 == "KyoW" || charSelect_P1 == "Ash")
         {
            if(mode_role_P1 == mode_role_P2)
            {
               P2_role.changeColor2P();
            }
         }
         else
         {
            P2_role.changeColor2P();
         }
      }
   }
   P1_role.player_type = P1_type;
   P2_role.player_type = P2_type;
   P1_role.player_order = 1;
   P2_role.player_order = 2;
   P1_role.init(key_P1,mode_key_P1);
   P2_role.init(key_P2,mode_key_P2);
   P1_role.roleName = charSelect_P1;
   P2_role.roleName = charSelect_P2;
   if(mode_power_P1 == "extra")
   {
      P1_role.dash_ex_enabled = true;
      P1_role.roll_ex_enabled = true;
      P1_role.charge_enabled = true;
   }
   else if(mode_power_P1 == "ultimate")
   {
      P1_role.dash_ex_enabled = dash_ex_enabled_P1;
      P1_role.roll_ex_enabled = roll_ex_enabled_P1;
      P1_role.charge_enabled = charge_enabled_P1;
   }
   if(mode_power_P2 == "extra")
   {
      P2_role.dash_ex_enabled = true;
      P2_role.roll_ex_enabled = true;
      P2_role.charge_enabled = true;
   }
   else if(mode_power_P2 == "ultimate")
   {
      P2_role.dash_ex_enabled = dash_ex_enabled_P2;
      P2_role.roll_ex_enabled = roll_ex_enabled_P2;
      P2_role.charge_enabled = charge_enabled_P2;
   }
   var _loc1_ = life_max * lifeBar_num;
   P1_role.stageVar(_loc1_,superPoint,powerPoint_max,P2_role,mode_P1);
   P2_role.stageVar(_loc1_,superPoint,powerPoint_max,P1_role,mode_P2);
   currentLifeP1 = _loc1_;
   currentLifeP2 = _loc1_;
   winTimesP1 = 0;
   winTimesP2 = 0;
   P1_role.winTimes = 0;
   P2_role.winTimes = 0;
   var _loc3_ = 200;
   var _loc2_ = 663;
   P1_role.stageInf(stage_with,egde_max,egde_min,_loc3_,land_Y,char);
   P2_role.stageInf(stage_with,egde_max,egde_min,_loc2_,land_Y,char);
   power_init();
   loadCombo();
   _level0.out("初始化角色2222:" + P2_role + "   " + P2_role._x);
}
function demo_init()
{
   P1_mc.addPlayer("demo");
   P2_mc.addPlayer("demo");
   P1_role = P1_mc.role_mc;
   P2_role = P2_mc.role_mc;
   var _loc1_ = life_max * lifeBar_num;
   P1_role.stageVar(_loc1_,superPoint,powerPoint_max,P2_role,mode_P1);
   P2_role.stageVar(_loc1_,superPoint,powerPoint_max,P1_role,mode_P2);
   P1_role.stageInf(stage_with,egde_max,egde_min,-100,370,char);
   P2_role.stageInf(stage_with,egde_max,egde_min,760,370,char);
   effect_mc = char_mc.attachMovie("effect","effect_mc",depth_effect);
}
function power_init(role)
{
   LP_P1 = life_power_mc.LP_P1;
   LP_P2 = life_power_mc.LP_P2;
   LP_P1.role = P1_role;
   LP_P2.role = P2_role;
   winTimes_P1 = life_power_mc.winTimes_P1;
   winTimes_P2 = life_power_mc.winTimes_P2;
   if(role == 1 || role == undefined)
   {
      LP_P1.lifeBar_mc.face_mc.gotoAndStop(charSelect_P1);
      if(mode_role_P1 == 3)
      {
         LP_P1.lifeBar_mc.face_mc.gotoAndStop(charSelect_P1 + mode_role_P1);
      }
      else if((charSelect_P1 == "Ash" || charSelect_P1 == "KyoW" || charSelect_P1 == "Zero" || charSelect_P1 == "Orochi" || charSelect_P1 == "Athena") && mode_role_P1 == 2)
      {
         LP_P1.lifeBar_mc.face_mc.gotoAndStop(charSelect_P1 + mode_role_P1);
      }
      LP_P1.name_mc.gotoAndStop(charSelect_P1);
      if(mode_role_P1 == 3)
      {
         LP_P1.name_mc.gotoAndStop(charSelect_P1 + mode_role_P1);
      }
      else if(charSelect_P1 == "Zero" || charSelect_P1 == "Orochi")
      {
         LP_P1.name_mc.gotoAndStop(charSelect_P1 + mode_role_P1);
      }
   }
   if(role == 2 || role == undefined)
   {
      LP_P2.lifeBar_mc.face_mc.gotoAndStop(charSelect_P2);
      if(mode_role_P2 == 3)
      {
         LP_P2.lifeBar_mc.face_mc.gotoAndStop(charSelect_P2 + mode_role_P2);
      }
      else if((charSelect_P2 == "Ash" || charSelect_P2 == "KyoW" || charSelect_P2 == "Zero" || charSelect_P2 == "Orochi" || charSelect_P2 == "Athena") && mode_role_P2 == 2)
      {
         LP_P2.lifeBar_mc.face_mc.gotoAndStop(charSelect_P2 + mode_role_P2);
      }
      LP_P2.name_mc.gotoAndStop(charSelect_P2);
      if(mode_role_P2 == 3)
      {
         LP_P2.name_mc.gotoAndStop(charSelect_P2 + mode_role_P2);
      }
      else if(charSelect_P2 == "Zero" || charSelect_P2 == "Orochi")
      {
         LP_P2.name_mc.gotoAndStop(charSelect_P2 + mode_role_P2);
      }
   }
}
function power_initMoreVs(roleNameP1, roleModeP1, roleNameP2, roleModeP2)
{
   LP_P1 = life_power_mc.LP_P1;
   LP_P2 = life_power_mc.LP_P2;
   LP_P1.role = P1_role;
   LP_P2.role = P2_role;
   winTimes_P1 = life_power_mc.winTimes_P1;
   winTimes_P2 = life_power_mc.winTimes_P2;
   LP_P1.lifeBar_mc.face_mc.gotoAndStop(roleNameP1);
   if(roleModeP1 == 3)
   {
      LP_P1.lifeBar_mc.face_mc.gotoAndStop(roleNameP1 + roleModeP1);
   }
   else if((roleNameP1 == "Ash" || roleNameP1 == "KyoW" || roleNameP1 == "Zero" || roleNameP1 == "Orochi" || roleNameP1 == "Athena") && roleModeP1 == 2)
   {
      LP_P1.lifeBar_mc.face_mc.gotoAndStop(roleNameP1 + roleModeP1);
   }
   LP_P1.name_mc.gotoAndStop(roleNameP1);
   if(roleModeP1 == 3)
   {
      LP_P1.name_mc.gotoAndStop(roleNameP1 + roleModeP1);
   }
   else if(roleNameP1 == "Zero" || roleNameP1 == "Orochi")
   {
      LP_P1.name_mc.gotoAndStop(roleNameP1 + roleModeP1);
   }
   LP_P2.lifeBar_mc.face_mc.gotoAndStop(roleNameP2);
   if(roleModeP2 == 3)
   {
      LP_P2.lifeBar_mc.face_mc.gotoAndStop(roleNameP2 + roleModeP2);
   }
   else if((roleNameP2 == "Ash" || roleNameP2 == "KyoW" || roleNameP2 == "Zero" || roleNameP2 == "Orochi" || roleNameP2 == "Athena") && roleModeP2 == 2)
   {
      LP_P2.lifeBar_mc.face_mc.gotoAndStop(roleNameP2 + roleModeP2);
   }
   LP_P2.name_mc.gotoAndStop(roleNameP2);
   if(roleModeP2 == 3)
   {
      LP_P2.name_mc.gotoAndStop(roleNameP2 + roleModeP2);
   }
   else if(roleNameP2 == "Zero" || roleNameP2 == "Orochi")
   {
      LP_P2.name_mc.gotoAndStop(roleNameP2 + roleModeP2);
   }
}
function lifeControl(obj, hpadd)
{
   if(obj.target == P1_role)
   {
      return life_power_mc.LP_P1.lifeControl(obj,hpadd);
   }
   if(obj.target == P2_role)
   {
      return life_power_mc.LP_P2.lifeControl(obj,hpadd);
   }
}
function powerControl(obj)
{
   if(obj.target == P1_role)
   {
      life_power_mc.LP_P1.powerControl(obj);
   }
   else if(obj.target == P2_role)
   {
      life_power_mc.LP_P2.powerControl(obj);
   }
}
function showHits(obj)
{
   if(obj.target == P1_role)
   {
      hitCounter1.showHits(obj);
   }
   else if(obj.target == P2_role)
   {
      hitCounter2.showHits(obj);
   }
}
function showHits_end(obj)
{
   if(obj.target == P1_role)
   {
      hitCounter2.showHits_end();
   }
   else if(obj.target == P2_role)
   {
      hitCounter1.showHits_end();
   }
}
function burst_end(src)
{
   if(src == P1_role)
   {
      life_power_mc.LP_P1.burst_end();
   }
   else if(src == P2_role)
   {
      life_power_mc.LP_P1.burst_end();
   }
}
function showMsg(type, x, y)
{
   var _loc1_ = element_mc.attachMovie("showMsg","showMsg",element_mc.getNextHighestDepth());
   _loc1_._x = x;
   if(y == undefined)
   {
      _loc1_._y = 0;
   }
   else
   {
      _loc1_._y = y;
   }
   _loc1_.gotoAndPlay(type);
}
function nextRound()
{
   IoriStarted = 0;
   first_attack = true;
   if(P1_role.isKO == true)
   {
      isKO = 1;
      loseTimes_P1++;
   }
   else
   {
      isKO = 2;
      loseTimes_P2++;
   }
   if(_level0.moreVs3V3 == true)
   {
      roundMax = 3;
   }
   else
   {
      roundMax = 2;
   }
   var _loc3_ = {ra:75,rb:153,ga:75,gb:153,ba:75,bb:153,aa:60,ab:0};
   var _loc4_ = {ra:25,rb:255,ga:75,gb:102,ba:0,bb:0,aa:100,ab:0};
   var _loc26_ = new Color(_level0.LP_P1.name_mc0);
   var _loc9_ = new Color(_level0.LP_P1.name_mc);
   var _loc8_ = new Color(_level0.LP_P2.name_mc);
   var _loc2_ = _loc26_.getTransform();
   var _loc5_ = _level0.charSelect_P1;
   var _loc10_ = _level0.charSelect_P12;
   var _loc13_ = _level0.charSelect_P13;
   if(_level0.mode_role_P1 > 1 && (_level0.charSelect_P1 == "Zero" || _level0.charSelect_P1 == "Orochi"))
   {
      _loc5_ += _level0.mode_role_P1;
   }
   if(_level0.mode_role_P12 > 1 && (_level0.charSelect_P12 == "Zero" || _level0.charSelect_P12 == "Orochi"))
   {
      _loc10_ += _level0.mode_role_P12;
   }
   if(_level0.mode_role_P13 > 1 && (_level0.charSelect_P13 == "Zero" || _level0.charSelect_P13 == "Orochi"))
   {
      _loc13_ += _level0.mode_role_P13;
   }
   if(_level0.charSelect_P1 == "Iori" && _level0.mode_role_P1 == 3)
   {
      _loc5_ += _level0.mode_role_P1;
   }
   if(_level0.charSelect_P12 == "Iori" && _level0.mode_role_P12 == 3)
   {
      _loc10_ += _level0.mode_role_P12;
   }
   if(_level0.charSelect_P13 == "Iori" && _level0.mode_role_P13 == 3)
   {
      _loc13_ += _level0.mode_role_P13;
   }
   var _loc18_ = new Color(_level0.LP_P1.name_mc12);
   var _loc23_ = new Color(_level0.LP_P1.name_mc13);
   var _loc16_ = new Color(_level0.LP_P2.name_mc22);
   var _loc22_ = new Color(_level0.LP_P2.name_mc23);
   var _loc6_ = _level0.charSelect_P2;
   var _loc11_ = _level0.charSelect_P22;
   var _loc12_ = _level0.charSelect_P23;
   if(_level0.mode_role_P2 > 1 && (_level0.charSelect_P2 == "Zero" || _level0.charSelect_P2 == "Orochi"))
   {
      _loc6_ += _level0.mode_role_P2;
   }
   if(_level0.mode_role_P22 > 1 && (_level0.charSelect_P22 == "Zero" || _level0.charSelect_P22 == "Orochi"))
   {
      _loc11_ += _level0.mode_role_P22;
   }
   if(_level0.mode_role_P23 > 1 && (_level0.charSelect_P23 == "Zero" || _level0.charSelect_P23 == "Orochi"))
   {
      _loc12_ += _level0.mode_role_P23;
   }
   if(_level0.charSelect_P2 == "Iori" && _level0.mode_role_P2 == 3)
   {
      _loc6_ += _level0.mode_role_P2;
   }
   if(_level0.charSelect_P22 == "Iori" && _level0.mode_role_P22 == 3)
   {
      _loc11_ += _level0.mode_role_P22;
   }
   if(_level0.charSelect_P23 == "Iori" && _level0.mode_role_P23 == 3)
   {
      _loc12_ += _level0.mode_role_P23;
   }
   if(_level0.moreVs == true && _level0.moreVs3V3 == true)
   {
      if(loseTimes_P1 == 1)
      {
         _level0.LP_P1.name_mc12.gotoAndStop(_loc13_);
         _level0.LP_P1.name_mc13.gotoAndStop(_loc5_);
         _loc23_.setTransform(_loc3_);
         if(_level0.mode_role_P13 == 2 && _level0.charSelect_P13 != "Zero" && _level0.charSelect_P13 != "Orochi")
         {
            _loc18_.setTransform(_loc4_);
         }
         else
         {
            _loc18_.setTransform(_loc2_);
         }
         if(_level0.mode_role_P12 == 2 && _level0.charSelect_P12 != "Zero" && _level0.charSelect_P12 != "Orochi")
         {
            _loc9_.setTransform(_loc4_);
         }
         else
         {
            _loc9_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P1 == 2)
      {
         _level0.LP_P1.name_mc12.gotoAndStop(_loc5_);
         _level0.LP_P1.name_mc13.gotoAndStop(_loc10_);
         _loc18_.setTransform(_loc3_);
         _loc23_.setTransform(_loc3_);
         if(_level0.mode_role_P13 == 2 && _level0.charSelect_P13 != "Zero" && _level0.charSelect_P13 != "Orochi")
         {
            _loc9_.setTransform(_loc4_);
         }
         else
         {
            _loc9_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P2 == 1)
      {
         _level0.LP_P2.name_mc22.gotoAndStop(_loc12_);
         _level0.LP_P2.name_mc23.gotoAndStop(_loc6_);
         _loc22_.setTransform(_loc3_);
         if(_level0.mode_role_P23 == 2 && _level0.charSelect_P23 != "Zero" && _level0.charSelect_P23 != "Orochi")
         {
            _loc16_.setTransform(_loc4_);
         }
         else
         {
            _loc16_.setTransform(_loc2_);
         }
         if(_level0.mode_role_P22 == 2 && _level0.charSelect_P22 != "Zero" && _level0.charSelect_P22 != "Orochi")
         {
            _loc8_.setTransform(_loc4_);
         }
         else
         {
            _loc8_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P2 == 2)
      {
         _level0.LP_P2.name_mc22.gotoAndStop(_loc6_);
         _level0.LP_P2.name_mc23.gotoAndStop(_loc11_);
         _loc16_.setTransform(_loc3_);
         _loc22_.setTransform(_loc3_);
         if(_level0.mode_role_P23 == 2 && _level0.charSelect_P23 != "Zero" && _level0.charSelect_P23 != "Orochi")
         {
            _loc8_.setTransform(_loc4_);
         }
         else
         {
            _loc8_.setTransform(_loc2_);
         }
      }
   }
   else if(_level0.moreVs == true && _level0.moreVs3V3 != true)
   {
      if(loseTimes_P1 == 1)
      {
         _level0.LP_P1.name_mc12.gotoAndStop(_loc5_);
         _loc18_.setTransform(_loc3_);
         if(_level0.mode_role_P12 == 2 && _level0.charSelect_P12 != "Zero" && _level0.charSelect_P12 != "Orochi")
         {
            _loc9_.setTransform(_loc4_);
         }
         else
         {
            _loc9_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P2 == 1)
      {
         _level0.LP_P2.name_mc22.gotoAndStop(_loc6_);
         _loc16_.setTransform(_loc3_);
         if(_level0.mode_role_P22 == 2 && _level0.charSelect_P22 != "Zero" && _level0.charSelect_P22 != "Orochi")
         {
            _loc8_.setTransform(_loc4_);
         }
         else
         {
            _loc8_.setTransform(_loc2_);
         }
      }
   }
   var _loc15_;
   var _loc14_;
   if(player_type != "1PVSCOM")
   {
      _loc15_ = "";
      _loc14_ = "";
      if(loseTimes_P2 == 1 && isKO == 2 && _level0.moreVs == true)
      {
         stopAllSounds();
         _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
         _loc15_ = _level0.charSelect_P22 + _level0.mode_role_P22;
         _loc14_ = _level0.charSelect_P22;
         _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
         _level0.bgmControl_mc.playSound();
      }
      if(loseTimes_P2 == 2 & isKO == 2 && _level0.moreVs == true)
      {
         stopAllSounds();
         _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
         _loc15_ = _level0.charSelect_P23 + _level0.mode_role_P23;
         _loc14_ = _level0.charSelect_P23;
         _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
         _level0.bgmControl_mc.playSound();
      }
      if(loseTimes_P1 == 1 && isKO == 1 && _level0.moreVs == true)
      {
         stopAllSounds();
         _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
         _loc15_ = _level0.charSelect_P12 + _level0.mode_role_P12;
         _loc14_ = _level0.charSelect_P12;
         _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
         _level0.bgmControl_mc.playSound();
      }
      if(loseTimes_P1 == 2 & isKO == 1 && _level0.moreVs == true)
      {
         stopAllSounds();
         _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
         _loc15_ = _level0.charSelect_P13 + _level0.mode_role_P13;
         _loc14_ = _level0.charSelect_P13;
         _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
         _level0.bgmControl_mc.playSound();
      }
   }
   var _loc7_;
   var _loc1_;
   var _loc20_;
   var _loc25_;
   var _loc21_;
   var _loc19_;
   var _loc24_;
   if(player_type == "1PVSCOM" || player_type == "vs")
   {
      _loc15_ = "";
      _loc14_ = "";
      if(player_type == "1PVSCOM" && _level0.moreVs == true)
      {
         if(loseTimes_P2 == 1 && isKO == 2)
         {
            stopAllSounds();
            _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
            _loc15_ = _level0.charSelect_P22 + _level0.mode_role_P22;
            _loc14_ = _level0.charSelect_P22;
            _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
            _level0.bgmControl_mc.playSound();
         }
         if(loseTimes_P2 == 2 & isKO == 2)
         {
            stopAllSounds();
            _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
            _loc15_ = _level0.charSelect_P23 + _level0.mode_role_P23;
            _loc14_ = _level0.charSelect_P23;
            _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
            _level0.bgmControl_mc.playSound();
         }
      }
      roundNum_played++;
      roundNum_played_currentBattle++;
      life_rate = P1_role.life / P1_role.life_max;
      life_rate_array_battle.push(life_rate);
      life_rate_array.push(life_rate);
      if(loseTimes_P2 >= roundMax)
      {
         _loc7_ = 0;
         _loc1_ = P1_role.hitsArray;
         for(var _loc17_ in _loc1_)
         {
            _loc7_ += _loc1_[_loc17_];
         }
         _loc20_ = _loc7_ / _loc1_.length;
         _loc20_ = int(_loc20_ * 100) / 100;
         hits_array.push(_loc20_);
         P1_role.hitsArray = [];
         if(_level0.moreVs3V3 != true)
         {
            if(life_rate_array_battle.length == 2)
            {
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
            }
         }
         else
         {
            if(loseTimes_P1 == 1)
            {
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
            }
            if(loseTimes_P1 == 0)
            {
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
            }
         }
      }
      if(winner == P1_role)
      {
         roundNum_win++;
         roundNum_win_currentBattle++;
         _loc25_ = (P2_role.life_max - P2_role.life) / life_max;
         _loc21_ = playTime - life_power_mc.time_mc.time_txt.text;
         _loc19_ = 0;
         _loc24_ = 45 + 4 * (_loc25_ - 1) * (level + 1);
         if(_loc21_ <= 30)
         {
            _loc19_ = 1;
         }
         else
         {
            _loc19_ = 1 - (_loc21_ - 30) / (_loc24_ - 30);
         }
         time_lifeBar = _loc19_;
         if(time_lifeBar <= 0)
         {
            time_lifeBar = 0;
         }
         time_lifeBar_array.push(time_lifeBar);
         time_lifeBar_array_battle.push(time_lifeBar);
      }
      else
      {
         life_rate = 0;
         life_rate_array.push(life_rate);
      }
      _level0.menu_bottom_mc.mc.trigger_setting._visible = false;
   }
   KO = false;
   timeOver = false;
   if(loseTimes_P1 >= roundMax || loseTimes_P2 >= roundMax)
   {
      roundNum = 1;
      isKO = "";
      transOut();
      win();
      return undefined;
   }
   role_reset();
   roundNum++;
   if(moreVs == true)
   {
      if(loseTimes_P1 > 0 && serviceName == "AI" && player_type == "1PVSCOM")
      {
         P1_type = "player";
      }
      if(_level0.player_type == "1PVSCOM" && ((_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true || (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true))
      {
         if(isKO == 1)
         {
            if(loseTimes_P1 == 1)
            {
               role_mode(P1_role,mode_role_P12,200,"begin",charSelect_P12);
            }
            else if(loseTimes_P1 == 2)
            {
               role_mode(P1_role,mode_role_P13,200,"begin",charSelect_P13);
            }
            LP_P1.reset();
         }
         if(isKO == 2)
         {
            roundNum = 1;
            isKO = "";
            win();
            return undefined;
         }
      }
      else
      {
         if(isKO == 1)
         {
            if(loseTimes_P1 == 1)
            {
               P1_role.roleName = charSelect_P12;
               role_mode(P1_role,mode_role_P12,200,"begin",charSelect_P12);
            }
            else if(loseTimes_P1 == 2)
            {
               P1_role.roleName = charSelect_P13;
               role_mode(P1_role,mode_role_P13,200,"begin",charSelect_P13);
            }
            LP_P1.reset();
         }
         if(isKO == 2)
         {
            if(loseTimes_P2 == 1)
            {
               P2_role.roleName = charSelect_P22;
               role_mode(P2_role,mode_role_P22,663,"begin",charSelect_P22);
            }
            else if(loseTimes_P2 == 2)
            {
               P2_role.roleName = charSelect_P23;
               role_mode(P2_role,mode_role_P23,663,"begin",charSelect_P23);
            }
            LP_P2.reset();
         }
      }
   }
   else
   {
      if(charSelect_P1 == charSelect_P2)
      {
         if(_level0.p1colormode == "normal")
         {
            _level0.p2colormode = "black";
         }
      }
      else
      {
         _level0.p2colormode = "normal";
      }
      role_mode(P1_role,P1_role.roleMode,200,"begin");
      LP_P1.reset();
      role_mode(P2_role,P2_role.roleMode,663,"begin");
      LP_P2.reset();
   }
   if(P1_type == "cpu")
   {
      playerType1P = "CPU";
   }
   else
   {
      playerType1P = "1P";
   }
   if(P2_type == "cpu")
   {
      playerType2P = "CPU";
   }
   else
   {
      playerType2P = "2P";
   }
   role_reset();
   _level0.KO = false;
   life_power_mc.time_mc.init_time();
   stage_mc.bg_mc.startControl();
   timer_start();
}
function timer_start()
{
   var _loc1_ = element_mc.attachMovie("battle_start","battle_start",_level0.depth_control);
}
function timer_end()
{
   life_power_mc.time_mc.timeStop();
}
function trainning_start()
{
   var _loc1_ = element_mc.attachMovie("battle_start","battle_start",_level0.depth_control);
}
function role_start()
{
   P1_role.start();
   P2_role.start();
}
function role_reset()
{
   P1_role.reset();
   P2_role.reset();
}
function role_control(is)
{
   battleStarted = true;
   if(layTime != -1)
   {
      life_power_mc.time_mc.timeStart();
   }
   time_roundStart = getTimer();
   P1_role.start_control();
   P2_role.start_control();
}
function resetBattle1PVSCOM()
{
   debugTest = false;
   var func = function()
   {
      _level0.transOut();
      stopAllSounds();
      char_mc.removeMovieClip();
      stage_mc.removeMovieClip();
      life_power_mc.removeMovieClip();
      element_mc.removeMovieClip();
      bgEff_mc.removeMovieClip();
      bgEff2_mc.removeMovieClip();
      fgEff_mc.removeMovieClip();
      ad_ship.removeMovieClip();
      delete this.onEnterFrame;
      inFreeze = false;
      inPause = false;
      KO = false;
      roundNum = 1;
      loseTimes1PVSCOM++;
      loseTimes_P1 = 0;
      loseTimes_P2 = 0;
      orderNum_p1 = 0;
      orderNum_p2 = 0;
      firstNum1P = 0;
      firstNum2P = 0;
      isKO = "";
      timeOver = false;
      selectCount2P = 0;
      selectCount1P = 0;
      _root._x = 0;
      _root._y = 0;
      gotoAndStop("charSelect");
   };
   _level0.transIn();
   trans.onTransIn = function()
   {
      func();
   };
}
function reset_trigger()
{
   first_attack = true;
   if(player_type == "1PVSCOM")
   {
      resetBattle1PVSCOM();
   }
   else
   {
      element_mc.attachMovie("reset_mc","reset_mc",_level0.depth_ko,{_x:430,_y:170});
   }
}
function restoreLifePower()
{
   LP_P1.reset();
   LP_P2.reset();
   LP_P1.reset_power();
   LP_P2.reset_power();
}
function reset2()
{
   _level0.menu_bottom_mc.mc.trigger_setting._visible = true;
   P1_role.reset_error();
   P2_role.reset_error();
}
function showWinner()
{
   var _loc1_ = element_mc.attachMovie("winner","winner",_level0.depth_ko);
   P1_role.control = false;
   P2_role.control = false;
   LP_P1.burst_end();
   LP_P2.burst_end();
}
function showWintimes()
{
   life_power_mc.winTimes_P1.gotoAndStop(P1_role.winTimes + 1);
   life_power_mc.winTimes_P2.gotoAndStop(P2_role.winTimes + 1);
}
function showStart_txt()
{
   element_mc.attachMovie("start_mc","start_mc",_level0.depth_ko,{_x:430,_y:170});
}
function win()
{
   stopAllSounds();
   menu_bottom_trigger.removeMovieClip();
   menu_bottom_mc.removeMovieClip();
   if(player_type == "1PVSCOM" && winner == P2_role)
   {
      element_mc.attachMovie("UI_gameOver","winResult",_level0.depth_ko);
   }
   else if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 8 && _level0.moreVs3V3 != true) || _level0.stageID == 6 && _level0.moreVs3V3 == true)
   {
      _quality = quality1;
      element_mc.attachMovie("winAll","winResult",_level0.depth_ko);
      passTimes = Number(passTimes) + 1;
      setting.data.passTimes = passTimes;
      setting.flush();
   }
   else
   {
      _quality = quality1;
      element_mc.attachMovie("winResult","winResult",_level0.depth_ko);
   }
}
function timeOut()
{
   if(KO)
   {
      return undefined;
   }
   KO = true;
   timeOver = true;
   element_mc.attachMovie("timeOut","timeOut_mc",_level0.depth_ko,{_x:431,_y:150});
   P1_role.do_end();
   P2_role.do_end();
   timer_end();
   time_roundEnd = getTimer();
   if(P1_role.life == P2_role.life)
   {
      winner = null;
   }
   else
   {
      if(P1_role.life > P2_role.life)
      {
         winner = P1_role;
         winTimesP1++;
      }
      else if(P1_role.life < P2_role.life)
      {
         winner = P2_role;
         winTimesP2++;
      }
      winner.winTimes++;
   }
   if((_level0.P1_role.life / _level0.P1_role.life_max == 1 || _level0.P2_role.life / _level0.P2_role.life_max == 1) && _level0.P1_role.life != _level0.P2_role.life)
   {
      setTimeout(function()
      {
         _level0.element_mc.attachMovie("Perfect_mc","Perfect_mc",_level0.depth_ko,{_x:330,_y:150});
      }
      ,1500);
   }
   setTimeout(function()
   {
      var _loc1_ = element_mc.attachMovie("battle_end","battle_end",_level0.depth_control);
   }
   ,3000);
}
function do_KO(_loser, _winner)
{
   if(KO)
   {
      return undefined;
   }
   KO = true;
   battleStarted = false;
   winner = _winner;
   P1_role.do_end();
   P2_role.do_end();
   life_power_mc.time_mc.timeStop();
   winner.winTimes++;
   if(P1_role == winner)
   {
      winTimesP1++;
   }
   else if(P2_role == winner)
   {
      winTimesP2++;
   }
   timer_end();
   time_roundEnd = getTimer();
   if(winner.winTimes == roundMax)
   {
      stopAllSounds();
   }
   _loser.do_KO(_loser);
   var s1 = setInterval(function()
   {
      if(winner.status_1 == "stand")
      {
         _loser.showHits_end();
         winner.showHits_end();
      }
   }
   ,27);
   setTimeout(function()
   {
      clearInterval(s1);
      var _loc1_ = element_mc.attachMovie("battle_end","battle_end",_level0.depth_control);
   }
   ,3000);
}
function do_win()
{
   winner.do_win();
   showWinner();
   P1_role.showHits_end();
   P2_role.showHits_end();
   var _loc1_ = winner.opp;
   if(timeOver)
   {
      if(_loc1_.status_1 != "getup1" && _loc1_.status_1 != "getup2")
      {
         _loc1_.isOK = true;
      }
      else if(_loc1_.life == 0)
      {
         _loc1_.isOK = true;
      }
      _loc1_.do_lose();
   }
}
function do_draw()
{
   battleStarted = false;
   var _loc1_ = element_mc.attachMovie("draw","draw",_level0.depth_ko);
   P1_role.control = false;
   P2_role.control = false;
   P1_role.showHits_end();
   P2_role.showHits_end();
   LP_P1.burst_end();
   LP_P2.burst_end();
   if(P1_role.life == P2_role.life && P2_role.life > 0)
   {
      P1_role.do_lose();
      P2_role.do_lose();
   }
}
function actionSet(role, _action)
{
   if(role == P1_role)
   {
      actionSet_status_P1 = _action;
   }
   else
   {
      actionSet_status_P2 = _action;
   }
   if(_action == "control")
   {
      role.control2 = true;
   }
   else
   {
      role.control2 = false;
      role.toStatus(_action);
   }
}
function powerMAX(role, _type)
{
   role.inBurst = true;
   role.burst_mode = _type;
   role.reset_power();
}
function rePower(role)
{
   if(role == _root.P1_role)
   {
      LP_P1.reset_power();
   }
   else
   {
      LP_P2.reset_power();
   }
   role.inBurst = false;
   role.burst_mode = "";
   role.reset_power();
}
function resetBattle(p1, p2)
{
   charSelect_P1 = p1;
   charSelect_P2 = p2;
   stage_mc.removeMovieClip();
   life_power_mc.removeMovieClip();
   element_mc.removeMovieClip();
   ad_ship.removeMovieClip();
   bgEff_mc.removeMovieClip();
   char_mc.removeMovieClip();
   gotoAndStop("reload");
   play();
   first_attack = true;
}
function nextBattle()
{
   roundNum_played_currentBattle = 0;
   roundNum_win_currentBattle = 0;
   perfect_currentBattle = [];
   debugTest = false;
   stage_mc.removeMovieClip();
   life_power_mc.removeMovieClip();
   element_mc.removeMovieClip();
   ad_ship.removeMovieClip();
   bgEff_mc.removeMovieClip();
   _level0.bgm1_snd.start(0,1000);
   if(player_type == "1PVSCOM")
   {
      if(stageID == 8)
      {
         stageID = 0;
         judgeCPUlist = false;
      }
      else
      {
         stageID++;
      }
      if(!judgeCPUlist)
      {
         judgeCPUlist = true;
      }
      life_rate_array_battle = [];
      time_lifeBar_array_battle = [];
      gotoAndStop("charSelect");
   }
   else
   {
      gotoAndStop("menu");
      play();
   }
}
function playAgain()
{
   nextBattle();
}
function levelUp()
{
   level++;
   if(level > 5)
   {
      level = 5;
   }
   setting.data.level = level;
}
function gameOver(selection)
{
   stage_mc.removeMovieClip();
   life_power_mc.removeMovieClip();
   char_mc.removeMovieClip();
   ad_ship.removeMovieClip();
   roundNum_played_currentBattle = 0;
   roundNum_win_currentBattle = 0;
   life_rate_array_battle = [];
   time_lifeBar_array_battle = [];
   perfect_currentBattle = [];
   if(selection == "continue")
   {
      stopAllSounds();
      attachService();
      transOut();
   }
   else
   {
      bgEff_mc.removeMovieClip();
      gotoAndPlay(1629);
   }
}
function autoPlayGameGotoMain()
{
   stopAllSounds();
   char_mc.removeMovieClip();
   stage_mc.removeMovieClip();
   life_power_mc.removeMovieClip();
   element_mc.removeMovieClip();
   bgEff_mc.removeMovieClip();
   bgEff2_mc.removeMovieClip();
   fgEff_mc.removeMovieClip();
   ad_ship.removeMovieClip();
   charSelect_mc.removeMovieClip();
   if(moreVs == true)
   {
      UI_VS.removeMovieClip();
   }
   else
   {
      UI_VS_SINGE.removeMovieClip();
   }
   life_power_mc.removeMovieClip();
   resetData();
   _level0.autoPlayGame = false;
   _level0.autoSelectRank = false;
   _level0.moreVs = _level0.setting.data.moreVs;
   _level0.moreVs3V3 = _level0.setting.data.moreVs3V3;
   _level0.insertCoin_snd.start();
   _level0.gotoAndStop("title");
}
function autoPlayGameGotoDisplay()
{
   char_mc.removeMovieClip();
   stage_mc.removeMovieClip();
   life_power_mc.removeMovieClip();
   element_mc.removeMovieClip();
   bgEff_mc.removeMovieClip();
   bgEff2_mc.removeMovieClip();
   fgEff_mc.removeMovieClip();
   ad_ship.removeMovieClip();
   charSelect_mc.removeMovieClip();
   if(moreVs == true)
   {
      UI_VS.removeMovieClip();
   }
   else
   {
      UI_VS_SINGE.removeMovieClip();
   }
   life_power_mc.removeMovieClip();
   resetData();
   stopAllSounds();
   _level0.gotoAndStop("menu");
}
function attachService()
{
   element_mc.attachMovie("UI_service","service",_level0.depth_ko);
}
function gameService(selection)
{
   element_mc.removeMovieClip();
   bgEff_mc.removeMovieClip();
   bgEff2_mc.removeMovieClip();
   fgEff_mc.removeMovieClip();
   _level0.p2colormode = "normal";
   serviceName = selection;
   if(selection != "no" && selection != "AI" && selection != "reselect")
   {
      score *= 0.5;
   }
   if(selection == "AI")
   {
      score *= 0.75;
   }
   score = int(score);
   if(selection == "reselect")
   {
      score *= 0.25;
      score = int(score);
      gotoAndStop("charSelect");
      play();
   }
   else
   {
      gotoAndStop("vs");
      play();
   }
}
function sortRank(playerName, role, m, vsType)
{
   var _loc1_ = new LoadVars();
   _loc1_.kname = playerName;
   _loc1_.score = score;
   _loc1_.role = role + m;
   _loc1_.vsType = vsType;
   if(role == "random" || m == undefined)
   {
      _loc1_.role = role;
   }
   _loc1_.sendAndLoad(_level0.wingUrl + ":" + _level0.wingRankPort + "/rankAdd",_loc1_,"get");
   _loc1_.onLoad = function(success)
   {
      if(!success)
      {
      }
   };
}
function exitTo(type)
{
   serviceName = "";
   debugTest = false;
   var func = function()
   {
      _level0.transOut();
      stopAllSounds();
      char_mc.removeMovieClip();
      stage_mc.removeMovieClip();
      life_power_mc.removeMovieClip();
      element_mc.removeMovieClip();
      bgEff_mc.removeMovieClip();
      bgEff2_mc.removeMovieClip();
      fgEff_mc.removeMovieClip();
      ad_ship.removeMovieClip();
      delete this.onEnterFrame;
      resetData();
      restScoreData();
      _root._x = 0;
      _root._y = 0;
      if(type == "charSelect")
      {
         gotoAndStop("charSelect");
      }
      else if(type == "menu")
      {
         gotoAndStop(1628, type);
      }
      else if(type == "charToMenu")
      {
         charSelect_mc.removeMovieClip();
         option_snd.start(0,1000);
         gotoAndStop("menu");
      }
      else
      {
         gotoAndStop("title");
      }
   };
   _level0.transIn();
   trans.onTransIn = function()
   {
      func();
   };
}
function exit()
{
   stopAllSounds();
   char_mc.removeMovieClip();
   stage_mc.removeMovieClip();
   life_power_mc.removeMovieClip();
   element_mc.removeMovieClip();
   bgEff_mc.removeMovieClip();
   bgEff2_mc.removeMovieClip();
   fgEff_mc.removeMovieClip();
   ad_ship.removeMovieClip();
   delete this.onEnterFrame;
   _root._x = 0;
   _root._y = 0;
   _level0.bgm1_snd.start(0,1000);
   gotoAndPlay(1629);
}
function getTime()
{
   return life_power_mc.time_mc.time_txt.text;
}
function game_pause()
{
   var _loc3_ = _level0.P1_role.mc;
   var _loc2_ = _level0.P2_role.mc;
   if(inPause != true)
   {
      if(inFreeze)
      {
         return undefined;
      }
      if(!_level0.P1_role.control)
      {
         return undefined;
      }
      if(pauseMC.onEnterFrame != null)
      {
         return undefined;
      }
      _quality = quality1;
      pauseFrame_p1 = _loc3_._currentframe;
      pauseFrame_p2 = _loc2_._currentframe;
      status_p1 = P1_role.status_1;
      status_p2 = P2_role.status_1;
      effect_mc.getFireFrame();
      var owner = this;
      var f = 0;
      pauseMC.onEnterFrame = function()
      {
         if(_level0.P1_role.inFreeze)
         {
            return undefined;
         }
         if(_level0.P2_role.inFreeze)
         {
            return undefined;
         }
         f++;
         if(f == 2)
         {
            owner.startPause();
            this.onEnterFrame = null;
         }
      };
   }
   else if(inPause)
   {
      inPause = false;
      _quality = quality2;
      stopPause();
   }
}
function startPause()
{
   var _loc2_ = _level0.P1_role.mc;
   var _loc1_ = _level0.P2_role.mc;
   inPause = true;
   if(_loc2_._currentframe != pauseFrame_p1)
   {
      rolePause_p1 = true;
   }
   if(_loc1_._currentframe != pauseFrame_p2)
   {
      rolePause_p2 = true;
   }
   effect_mc.checkFireFrame();
   _loc2_.stop();
   _loc1_.stop();
   effect_mc.fire_stop();
   _level0.menu_bottom_mc._visible = true;
   _level0.menu_bottom_trigger.btnUp._visible = false;
   _level0.menu_bottom_trigger.btnDown._visible = true;
}
function stopPause()
{
   var _loc2_ = _level0.P1_role.mc;
   var _loc1_ = _level0.P2_role.mc;
   if(rolePause_p1 || status_p1 != P1_role.status_1)
   {
      _loc2_.play();
      rolePause_p1 = false;
   }
   if(rolePause_p2 || status_p2 != P2_role.status_1)
   {
      _loc1_.play();
      rolePause_p2 = false;
   }
   effect_mc.fire_continue();
   _level0.menu_bottom_mc._visible = false;
   _level0.menu_bottom_trigger.btnUp._visible = true;
   _level0.menu_bottom_trigger.btnDown._visible = false;
}
function charToCenter()
{
   var _loc2_;
   var _loc1_ = int((P2_role._x + P1_role._x) / 2);
   char_mc._x = stage_c - _loc1_;
}
function checkNoEnemyMode(role)
{
   if(isNoEnemyMode && player_type == "1PVSCOM" && role == P1_role)
   {
      return true;
   }
   return false;
}
function checkPowerNoLimit(role)
{
   if(player_type == "trainning" && trainningInfPower)
   {
      return true;
   }
   if(isNoEnemyMode)
   {
      if(player_type == "1PVSCOM")
      {
         return true;
      }
      if(player_type == "1PVS2P")
      {
         return true;
      }
      if(player_type == "COMVSCOM")
      {
         return true;
      }
      if(player_type == "vs")
      {
         return true;
      }
   }
   return false;
}
function nextRound_Draw()
{
   IoriStarted = 0;
   first_attack = true;
   loseTimes_P1++;
   loseTimes_P2++;
   if(_level0.moreVs3V3 == true)
   {
      roundMax = 3;
   }
   else
   {
      roundMax = 2;
   }
   var _loc3_ = {ra:75,rb:153,ga:75,gb:153,ba:75,bb:153,aa:60,ab:0};
   var _loc4_ = {ra:25,rb:255,ga:75,gb:102,ba:0,bb:0,aa:100,ab:0};
   var _loc27_ = new Color(_level0.LP_P1.name_mc0);
   var _loc9_ = new Color(_level0.LP_P1.name_mc);
   var _loc8_ = new Color(_level0.LP_P2.name_mc);
   var _loc2_ = _loc27_.getTransform();
   var _loc5_ = _level0.charSelect_P1;
   var _loc10_ = _level0.charSelect_P12;
   var _loc13_ = _level0.charSelect_P13;
   if(_level0.mode_role_P1 > 1 && (_level0.charSelect_P1 == "Zero" || _level0.charSelect_P1 == "Orochi"))
   {
      _loc5_ += _level0.mode_role_P1;
   }
   if(_level0.mode_role_P12 > 1 && (_level0.charSelect_P12 == "Zero" || _level0.charSelect_P12 == "Orochi"))
   {
      _loc10_ += _level0.mode_role_P12;
   }
   if(_level0.mode_role_P13 > 1 && (_level0.charSelect_P13 == "Zero" || _level0.charSelect_P13 == "Orochi"))
   {
      _loc13_ += _level0.mode_role_P13;
   }
   if(_level0.charSelect_P1 == "Iori" && _level0.mode_role_P1 == 3)
   {
      _loc5_ += _level0.mode_role_P1;
   }
   if(_level0.charSelect_P12 == "Iori" && _level0.mode_role_P12 == 3)
   {
      _loc10_ += _level0.mode_role_P12;
   }
   if(_level0.charSelect_P13 == "Iori" && _level0.mode_role_P13 == 3)
   {
      _loc13_ += _level0.mode_role_P13;
   }
   var _loc18_ = new Color(_level0.LP_P1.name_mc12);
   var _loc23_ = new Color(_level0.LP_P1.name_mc13);
   var _loc16_ = new Color(_level0.LP_P2.name_mc22);
   var _loc22_ = new Color(_level0.LP_P2.name_mc23);
   var _loc6_ = _level0.charSelect_P2;
   var _loc11_ = _level0.charSelect_P22;
   var _loc12_ = _level0.charSelect_P23;
   if(_level0.mode_role_P2 > 1 && (_level0.charSelect_P2 == "Zero" || _level0.charSelect_P2 == "Orochi"))
   {
      _loc6_ += _level0.mode_role_P2;
   }
   if(_level0.mode_role_P22 > 1 && (_level0.charSelect_P22 == "Zero" || _level0.charSelect_P22 == "Orochi"))
   {
      _loc11_ += _level0.mode_role_P22;
   }
   if(_level0.mode_role_P23 > 1 && (_level0.charSelect_P23 == "Zero" || _level0.charSelect_P23 == "Orochi"))
   {
      _loc12_ += _level0.mode_role_P23;
   }
   if(_level0.charSelect_P2 == "Iori" && _level0.mode_role_P2 == 3)
   {
      _loc6_ += _level0.mode_role_P2;
   }
   if(_level0.charSelect_P22 == "Iori" && _level0.mode_role_P22 == 3)
   {
      _loc11_ += _level0.mode_role_P22;
   }
   if(_level0.charSelect_P23 == "Iori" && _level0.mode_role_P23 == 3)
   {
      _loc12_ += _level0.mode_role_P23;
   }
   if(_level0.moreVs == true && _level0.moreVs3V3 == true)
   {
      if(loseTimes_P1 == 1)
      {
         _level0.LP_P1.name_mc12.gotoAndStop(_loc13_);
         _level0.LP_P1.name_mc13.gotoAndStop(_loc5_);
         _loc23_.setTransform(_loc3_);
         if(_level0.mode_role_P13 == 2 && _level0.charSelect_P13 != "Zero" && _level0.charSelect_P13 != "Orochi")
         {
            _loc18_.setTransform(_loc4_);
         }
         else
         {
            _loc18_.setTransform(_loc2_);
         }
         if(_level0.mode_role_P12 == 2 && _level0.charSelect_P12 != "Zero" && _level0.charSelect_P12 != "Orochi")
         {
            _loc9_.setTransform(_loc4_);
         }
         else
         {
            _loc9_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P1 == 2)
      {
         _level0.LP_P1.name_mc12.gotoAndStop(_loc5_);
         _level0.LP_P1.name_mc13.gotoAndStop(_loc10_);
         _loc18_.setTransform(_loc3_);
         _loc23_.setTransform(_loc3_);
         if(_level0.mode_role_P13 == 2 && _level0.charSelect_P13 != "Zero" && _level0.charSelect_P13 != "Orochi")
         {
            _loc9_.setTransform(_loc4_);
         }
         else
         {
            _loc9_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P2 == 1)
      {
         _level0.LP_P2.name_mc22.gotoAndStop(_loc12_);
         _level0.LP_P2.name_mc23.gotoAndStop(_loc6_);
         _loc22_.setTransform(_loc3_);
         if(_level0.mode_role_P23 == 2 && _level0.charSelect_P23 != "Zero" && _level0.charSelect_P23 != "Orochi")
         {
            _loc16_.setTransform(_loc4_);
         }
         else
         {
            _loc16_.setTransform(_loc2_);
         }
         if(_level0.mode_role_P22 == 2 && _level0.charSelect_P22 != "Zero" && _level0.charSelect_P22 != "Orochi")
         {
            _loc8_.setTransform(_loc4_);
         }
         else
         {
            _loc8_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P2 == 2)
      {
         _level0.LP_P2.name_mc22.gotoAndStop(_loc6_);
         _level0.LP_P2.name_mc23.gotoAndStop(_loc11_);
         _loc16_.setTransform(_loc3_);
         _loc22_.setTransform(_loc3_);
         if(_level0.mode_role_P23 == 2 && _level0.charSelect_P23 != "Zero" && _level0.charSelect_P23 != "Orochi")
         {
            _loc8_.setTransform(_loc4_);
         }
         else
         {
            _loc8_.setTransform(_loc2_);
         }
      }
   }
   else if(_level0.moreVs == true && _level0.moreVs3V3 != true)
   {
      if(loseTimes_P1 == 1)
      {
         _level0.LP_P1.name_mc12.gotoAndStop(_loc5_);
         _loc18_.setTransform(_loc3_);
         if(_level0.mode_role_P12 == 2 && _level0.charSelect_P12 != "Zero" && _level0.charSelect_P12 != "Orochi")
         {
            _loc9_.setTransform(_loc4_);
         }
         else
         {
            _loc9_.setTransform(_loc2_);
         }
      }
      if(loseTimes_P2 == 1)
      {
         _level0.LP_P2.name_mc22.gotoAndStop(_loc6_);
         _loc16_.setTransform(_loc3_);
         if(_level0.mode_role_P22 == 2 && _level0.charSelect_P22 != "Zero" && _level0.charSelect_P22 != "Orochi")
         {
            _loc8_.setTransform(_loc4_);
         }
         else
         {
            _loc8_.setTransform(_loc2_);
         }
      }
   }
   var _loc24_;
   var _loc15_;
   var _loc14_;
   if(player_type != "1PVSCOM")
   {
      _loc24_ = Math.random();
      _loc15_ = "";
      _loc14_ = "";
      if((loseTimes_P2 == 1 || loseTimes_P2 == 1) && _level0.moreVs == true)
      {
         stopAllSounds();
         _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
         if(_loc24_ <= 0.5)
         {
            _loc15_ = _level0.charSelect_P22 + _level0.mode_role_P22;
            _loc14_ = _level0.charSelect_P22;
         }
         else
         {
            _loc15_ = _level0.charSelect_P12 + _level0.mode_role_P12;
            _loc14_ = _level0.charSelect_P12;
         }
         _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
         _level0.bgmControl_mc.playSound();
      }
      if((loseTimes_P2 == 2 || loseTimes_P1 == 2) && _level0.moreVs == true)
      {
         stopAllSounds();
         _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
         if(_loc24_ <= 0.5)
         {
            _loc15_ = _level0.charSelect_P23 + _level0.mode_role_P23;
            _loc14_ = _level0.charSelect_P23;
         }
         else
         {
            _loc15_ = _level0.charSelect_P13 + _level0.mode_role_P13;
            _loc14_ = _level0.charSelect_P13;
         }
         _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
         _level0.bgmControl_mc.playSound();
      }
   }
   var _loc7_;
   var _loc1_;
   var _loc20_;
   var _loc26_;
   var _loc21_;
   var _loc19_;
   var _loc25_;
   if(player_type == "1PVSCOM" || player_type == "vs")
   {
      _loc15_ = "";
      _loc14_ = "";
      if(player_type == "1PVSCOM" && _level0.moreVs == true)
      {
         if(loseTimes_P2 == 1)
         {
            stopAllSounds();
            _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
            _loc15_ = _level0.charSelect_P22 + _level0.mode_role_P22;
            _loc14_ = _level0.charSelect_P22;
            _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
            _level0.bgmControl_mc.playSound();
         }
         if(loseTimes_P2 == 2)
         {
            stopAllSounds();
            _level0.bgmControl_mc.stageSound.setVolume(_level0.BgmVolume);
            _loc15_ = _level0.charSelect_P23 + _level0.mode_role_P23;
            _loc14_ = _level0.charSelect_P23;
            _level0.bgmControl_mc.loadSound(_loc15_,_loc14_);
            _level0.bgmControl_mc.playSound();
         }
      }
      roundNum_played++;
      roundNum_played_currentBattle++;
      life_rate = P1_role.life / P1_role.life_max;
      life_rate_array_battle.push(life_rate);
      life_rate_array.push(life_rate);
      if(loseTimes_P2 == roundMax)
      {
         _loc7_ = 0;
         _loc1_ = P1_role.hitsArray;
         for(var _loc17_ in _loc1_)
         {
            _loc7_ += _loc1_[_loc17_];
         }
         _loc20_ = _loc7_ / _loc1_.length;
         _loc20_ = int(_loc20_ * 100) / 100;
         hits_array.push(_loc20_);
         P1_role.hitsArray = [];
         if(_level0.moreVs3V3 != true)
         {
            if(life_rate_array_battle.length == 2)
            {
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
            }
         }
         else
         {
            if(loseTimes_P1 == 1)
            {
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
            }
            if(loseTimes_P1 == 0)
            {
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
               life_rate_array_battle.push(1);
               life_rate_array.push(1);
            }
         }
      }
      if(winner == P1_role)
      {
         roundNum_win++;
         roundNum_win_currentBattle++;
         _loc26_ = (P2_role.life_max - P2_role.life) / life_max;
         _loc21_ = playTime - life_power_mc.time_mc.time_txt.text;
         _loc19_ = 0;
         _loc25_ = 45 + 4 * (_loc26_ - 1) * (level + 1);
         if(_loc21_ <= 30)
         {
            _loc19_ = 1;
         }
         else
         {
            _loc19_ = 1 - (_loc21_ - 30) / (_loc25_ - 30);
         }
         time_lifeBar = _loc19_;
         if(time_lifeBar <= 0)
         {
            time_lifeBar = 0;
         }
         time_lifeBar_array.push(time_lifeBar);
         time_lifeBar_array_battle.push(time_lifeBar);
      }
      else
      {
         life_rate = 0;
         life_rate_array.push(life_rate);
      }
      _level0.menu_bottom_mc.mc.trigger_setting._visible = false;
   }
   KO = false;
   timeOver = false;
   if(loseTimes_P1 >= roundMax && loseTimes_P2 < roundMax || loseTimes_P2 >= roundMax && loseTimes_P1 < roundMax)
   {
      roundNum = 1;
      isKO = "";
      transOut();
      win();
      return undefined;
   }
   if(loseTimes_P1 >= roundMax || loseTimes_P2 >= roundMax)
   {
      roundNum = 1;
      isKO = "";
      transOut();
      loseTimes_P1 = 0;
      loseTimes_P2 = 0;
      if(_level0.player_type == "1PVSCOM")
      {
         gameOver("continue");
      }
      else
      {
         char_mc.removeMovieClip();
         roundNum_played_currentBattle = 0;
         roundNum_win_currentBattle = 0;
         perfect_currentBattle = [];
         stopAllSounds();
         nextBattle();
      }
      return undefined;
   }
   role_reset();
   roundNum++;
   if(moreVs == true)
   {
      if(loseTimes_P1 > 0 && serviceName == "AI" && player_type == "1PVSCOM")
      {
         P1_type = "player";
      }
      if(_level0.player_type == "1PVSCOM" && ((_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true || (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true))
      {
         if(loseTimes_P1 <= roundMax)
         {
            roundNum = 1;
            isKO = "";
            win();
            return undefined;
         }
         loseTimes_P1 = 0;
         loseTimes_P2 = 0;
         gameOver("continue");
      }
      else
      {
         if(loseTimes_P1 == 1)
         {
            P1_role.roleName = charSelect_P12;
            role_mode(P1_role,mode_role_P12,200,"begin",charSelect_P12);
         }
         else if(loseTimes_P1 == 2)
         {
            P1_role.roleName = charSelect_P13;
            role_mode(P1_role,mode_role_P13,200,"begin",charSelect_P13);
         }
         setTimeout(function()
         {
            if(loseTimes_P2 == 1)
            {
               P2_role.roleName = charSelect_P22;
               role_mode(P2_role,mode_role_P22,663,"begin",charSelect_P22);
            }
            else if(loseTimes_P2 == 2)
            {
               P2_role.roleName = charSelect_P23;
               role_mode(P2_role,mode_role_P23,663,"begin",charSelect_P23);
            }
            LP_P2.reset();
         }
         ,1000);
         LP_P1.reset();
      }
   }
   else
   {
      if(charSelect_P1 == charSelect_P2)
      {
         if(_level0.p1colormode == "normal")
         {
            _level0.p2colormode = "black";
         }
      }
      else
      {
         _level0.p2colormode = "normal";
      }
      role_mode(P1_role,P1_role.roleMode,200,"begin");
      LP_P1.reset();
      role_mode(P2_role,P2_role.roleMode,663,"begin");
      LP_P2.reset();
   }
   if(P1_type == "cpu")
   {
      playerType1P = "CPU";
   }
   else
   {
      playerType1P = "1P";
   }
   if(P2_type == "cpu")
   {
      playerType2P = "CPU";
   }
   else
   {
      playerType2P = "2P";
   }
   role_reset();
   _level0.KO = false;
   setTimeout(function()
   {
      life_power_mc.time_mc.init_time();
      stage_mc.bg_mc.startControl();
      transOut();
      timer_start();
   }
   ,1500);
}
function coverSkill(role)
{
   role.newKeyControl.toAction_interval = 10;
   role.newKeyControl.Interval_toAction = 0;
   role.newKeyControl.toAction = function(action)
   {
      clearInterval(this.Interval_toAction);
      role.toAction(action);
   };
   role.newKeyControl.actionCheck = function(myKey)
   {
      var _loc2_;
      if(myKey == this.f)
      {
         if(this.dir == 1)
         {
            _loc2_ = "walk_f";
         }
         else
         {
            _loc2_ = "walk_b";
         }
      }
      else if(myKey == this.b)
      {
         if(this.dir == 1)
         {
            _loc2_ = "walk_b";
         }
         else
         {
            _loc2_ = "walk_f";
         }
      }
      else if(myKey == this.u)
      {
         _loc2_ = "jump";
      }
      else if(myKey == this.d)
      {
         _loc2_ = "squat";
      }
      clearInterval(this.Interval_toAction);
      this.Interval_toAction = setInterval(this,"toAction",this.toAction_interval,_loc2_);
   };
   role.newKeyControl.keyChain_dir = function(key)
   {
      var _loc2_ = key;
      if(this.dir == -1)
      {
         if(_loc2_ == this.f)
         {
            _loc2_ = this.b;
         }
         else if(_loc2_ == this.b)
         {
            _loc2_ = this.f;
         }
      }
      var _loc4_;
      var _loc3_;
      if(this.time_check == 0)
      {
         this.input_array.push(_loc2_);
         this.time_check = getTimer();
      }
      else
      {
         _loc4_ = this.time_check;
         _loc3_ = getTimer();
         this.time_check = _loc3_;
         if(_loc3_ - _loc4_ < this.time_interval && _loc3_ - _loc4_ > this.time_interval3)
         {
            this.input_array.push(_loc2_);
            if(this.input_array[this.input_array.length - 2] == _loc2_)
            {
               clearInterval(this.Interval_toAction);
               this.Interval_toAction = setInterval(this,"doubleKey",this.toAction_interval,_loc2_);
            }
         }
         else
         {
            this.keyClear();
            this.time_check = 0;
            this.keyChain_dir(key);
         }
      }
      if(this.input_array.length > 6)
      {
         this.input_array.shift();
      }
   };
   role.newKeyControl.doubleKey = function(myKey)
   {
      clearInterval(this.Interval_toAction);
      if(myKey == this.f)
      {
         this.role._to_double_f();
      }
      else if(myKey == this.b)
      {
         this.role._to_double_b();
      }
      else if(myKey == this.d)
      {
         this.role._to_double_d();
      }
   };
   role.power_skillBurst = 150;
   role.superCheck = function(action)
   {
      this.superSkill = false;
      if(this.superList[action] == 1)
      {
         if(this.superPoint > 0)
         {
            this.superSkill = true;
            this.powerDecType = "super";
            return true;
         }
         if(this.inBurst)
         {
            this.superSkill = true;
            this.powerDecType = "super";
            return true;
         }
         return false;
      }
      return "notSuperSkill";
   };
}
function moreVsRole_mode(roleNameP1, roleModeP1, roleNameP2, roleModeP2, pp, pp1, pp2)
{
   _quality = quality2;
   role_initMoreVs(roleNameP1,roleModeP1,roleNameP2,roleModeP2,pp,pp1,pp2);
   if(!isLoadStage)
   {
      stageControl_mc.init2();
      stageControl_mc.init(863,510,stage_mc);
      stageControl_mc.startControl();
   }
   else
   {
      stageControl_mc.init2();
      stageControl_mc.init(863,510,stage_mc.mc);
      stageControl_mc.startControl();
   }
   onEnterFrame = function()
   {
      P1_role.checkSide();
      P2_role.checkSide();
      P1_role.checkTouch(0);
      P2_role.checkTouch(0);
   };
}
function role_initMoreVs(roleNameP1, roleModeP1, roleNameP2, roleModeP2, pp, pp1, pp2)
{
   P1_mc.addPlayer(P1_type,roleModeP1);
   P2_mc.addPlayer(P2_type,roleModeP2);
   P1_role = P1_mc.role_mc;
   P2_role = P2_mc.role_mc;
   P1_role.player_order = 1;
   P2_role.player_order = 2;
   P1_role.normalmode = p1colormode;
   P2_role.normalmode = p2colormode;
   P1_role.roleMode = roleModeP1;
   P2_role.roleMode = roleModeP2;
   P1_role.e_mode(P1_role,ashShadow);
   P2_role.e_mode(P2_role,ashShadow);
   P1_role.player_type = P1_type;
   P2_role.player_type = P2_type;
   P1_role.player_order = 1;
   P2_role.player_order = 2;
   P1_role.init(key_P1,mode_key_P1);
   P2_role.init(key_P2,mode_key_P2);
   P1_role.roleName = roleNameP1;
   P2_role.roleName = roleNameP2;
   var _loc1_ = life_max * lifeBar_num;
   var _loc3_ = 200;
   var _loc2_ = 663;
   if(pp == 1)
   {
      P1_role.stageVar(_loc1_,pp1,powerPoint_max,P2_role,mode_P1);
      P2_role.stageVar(P2_role.life,pp2,powerPoint_max,P1_role,mode_P2);
      P1_role.stageInf(stage_with,egde_max,egde_min,_loc3_,land_Y,char);
      P2_role.stageInf(stage_with,egde_max,egde_min,_loc2_,land_Y,char);
      life_power_mc.LP_P1.burst_end();
   }
   if(pp == 2)
   {
      P1_role.stageVar(P1_role.life,pp1,powerPoint_max,P2_role,mode_P1);
      P2_role.stageVar(_loc1_,pp2,powerPoint_max,P1_role,mode_P2);
      P1_role.stageInf(stage_with,egde_max,egde_min,_loc3_,land_Y,char);
      P2_role.stageInf(stage_with,egde_max,egde_min,_loc2_,land_Y,char);
      life_power_mc.LP_P2.burst_end();
   }
   coverSkill(P1_role);
   coverSkill(P2_role);
   loadCombo();
}
function fullScreen()
{
   var _loc2_;
   if(!inFullScreen)
   {
      inFullScreen = true;
      _loc2_ = attachMovie("hint_fullScreen","hint_fullscreen_mc",this.getNextHighestDepth());
      _loc2_._x = 330;
      _loc2_._y = 240;
      fscommand("togglefullscreen");
   }
   else
   {
      inFullScreen = false;
      fscommand("togglefullscreen");
   }
}
_root.autoPlayGame = false;
_root.autoSelectRank = false;
media_mc._visible = false;
_root.setMask(mask_mc);
_quality = quality1;
var glowMode;
var autoPlayGame = false;
var autoSelectRank = false;
var glowType;
var XIIIeffOpen;
var XIIIeff;
var counterMode = true;
var BGM = true;
var defend = true;
var moreVs = true;
var moreVs3V3 = true;
var flashing;
var glow2P = false;
var glow2Ptype = false;
var lan_set;
var kwUnlock;
var ashShadow;
var wface;
var showMoreMsg = true;
var SE_old = false;
var cpu_op_mode;
var isTransIn = false;
var roleNameP1 = charSelect_P1;
var roleNameP2 = charSelect_P2;
var roleModeP1 = mode_role_P1;
var roleModeP2 = mode_role_P2;
var canSelect = true;
var winTimesP1 = 0;
var winTimesP2 = 0;
var currentLifeP1 = 0;
var currentLifeP2 = 0;
var lifeMaxP1 = 0;
var lifeMaxP2 = 0;
var canSelect1P = true;
var canSelect2P = true;
var selectCount1P = 0;
var selectCount2P = 0;
var selectMax = 0;
var loading = false;
var BgmVolume = setting.data.BgmVolume;
var raining;
var tq;
var passKusanagi = false;
var settingArr = ["glowMode","glowType","XIIIeffOpen","XIIIeff","counterMode","BGM","defend","moreVs","moreVs3V3","flashing","glow2P","glow2Ptype","lan_set","loading","passKusanagi","BgmVolume","volume","showMoreMsg","SE_old"];
var i = 0;
while(i < settingArr.length)
{
   if(setting.data[settingArr[i]] == undefined)
   {
      this[settingArr[i]] = false;
   }
   else
   {
      this[settingArr[i]] = setting.data[settingArr[i]];
   }
   i++;
}
if(!onLine)
{
   XIIIeffOpen = true;
}
if(setting.data.ashShadow == undefined)
{
   if(glowMode)
   {
      ashShadow = true;
   }
   else
   {
      ashShadow = false;
   }
}
else
{
   ashShadow = setting.data.ashShadow;
}
var menu_now = 1;
var isNoEnemyMode = false;
var player_type;
var fight_type = "singer";
var P1_type;
var P2_type;
var skillhit = false;
var isKO = "";
var mode_role_P1 = 1;
var mode_role_P2 = 1;
var mode_role_P11 = 1;
var mode_role_P21 = 1;
var mode_role_P12 = 1;
var mode_role_P22 = 1;
var mode_role_P13 = 1;
var mode_role_P23 = 1;
var p1colormode = "nromal";
var p2colormode = "nromal";
var mode_key_P1 = "normal";
var mode_key_P2 = "normal";
var mode_power_P1 = "advanced";
var mode_power_P2 = "advanced";
var dash_ex_enabled_P1 = false;
var roll_ex_enabled_P1 = false;
var charge_enabled_P1 = false;
var dash_ex_enabled_P2 = false;
var roll_ex_enabled_P2 = false;
var charge_enabled_P2 = false;
var charSelect_P1 = "";
var charSelect_P11 = "";
var charSelect_P12 = "";
var charSelect_P13 = "";
var charSelect_P2 = "";
var charSelect_P21 = "";
var charSelect_P22 = "";
var charSelect_P23 = "";
var ranCharSelect = false;
var ranCharSelectNum2 = false;
var ranCharSelectNum3 = false;
var ranCharSelectN = false;
var ranCharSelectNNum2 = false;
var ranCharSelectNNum3 = false;
var ranCharSelect_name = "";
var charSelect_P1_origin = "";
var charSelect_P11_origin = "";
var charSelect_P12_origin = "";
var charSelect_P13_origin = "";
var charSelect_P2_origin = "";
var charSelect_P21_origin = "";
var charSelect_P22_origin = "";
var charSelect_P23_origin = "";
var mode_role_P1_origin = 1;
var mode_role_P2_origin = 1;
var mode_role_P11_origin = 1;
var mode_role_P21_origin = 1;
var mode_role_P12_origin = 1;
var mode_role_P22_origin = 1;
var mode_role_P13_origin = 1;
var mode_role_P23_origin = 1;
var firstNum1P = 0;
var firstNum2P = 0;
var loseTimes1PVSCOM = 0;
var winTimes1PPVP = 0;
var winTimes2PPVP = 0;
var winTimes1PPVE = 0;
var winTimes2PPVE = 0;
var winTimes1PEVE = 0;
var winTimes2PEVE = 0;
var color_mode = ["blue","black","normal","green"];
var orderMax = 4;
var orderNum_p1 = 0;
var orderNum_p2 = 0;
var inFullScreen;
var charID_P1;
var charID_P2;
var selectOrderListP1 = new Array();
var selectOrderListP2 = new Array();
var bgID = 0;
var attacker;
var hurter;
var winner;
var inFreeze = false;
var inPause = false;
var battleStarted = false;
var IoriStarted = 0;
var stage_with = 863;
var stage_height = 485;
var stage_c = int(stage_with / 2);
var center_x = int(stage_with / 2);
var center_y = int(stage_height / 2);
var egde_max = stage_with - 40;
var egde_min = 40;
var land_Y = 445;
var g = 5;
var KO = false;
var roundMax = 2;
var roundNum = 1;
var stageID = 0;
var loseTimes_P1 = 0;
var loseTimes_P2 = 0;
var lifeBar_num = 2;
var lifeBar_num_temp = 2;
var life_max = 300;
var superPoint = 3;
var power_max = 100;
var powerPoint_max = 3;
var trainningInfPower = false;
var level = 2;
var playTime = 60;
var timeOver = false;
var playedTimes;
var passTimes = 0;
var passCharArray = new Array();
var hiddenCharArray0 = new Array("Kyo","Iori","K","Kula","Orochi");
var hiddenCharArray = new Array();
hiddenCharArray = [];
var charGetObj = {Iori3:false,Orochi:false,Igniz:false,Rugal:false};
var charPassObj = {Kyo_1:false,Kyo_2:false,Ryu_1:false,Ryu_2:false,Iori_1:false,Iori_2:false,Iori_3:false,K_1:false,K_2:false,Kula_1:false,Kula_2:false,Moriya_1:false,Moriya_2:false,Mai_1:false,Mai_2:false,Chunli_1:false,Chunli_2:false,Terry_1:false,Terry_2:false,Haohmaru_1:false,Haohmaru_2:false,Igniz_1:false,Igniz_2:false,Orochi_1:false,Orochi_2:false,Rugal_1:false,Rugal_2:false,Athena_1:false,Ryo_1:false,Ryo_2:false,Kim_2:false,Zero_1:false,Nameless_1:false,Zero_2:false,Kim_1:false,Kim_2:false,Krizalid_1:false,Krizalid_2:false,Goenitz_1:false,Oswald_1:false};
var charPassArray = ["Kyo_1","Kyo_2","Ryu_1","Ryu_2","Iori_1","Iori_2","Iori_3","K_1","K_2","Kula_1","Kula_2","Moriya_1","Moriya_2","Mai_1","Mai_2","Chunli_1","Chunli_2","Terry_1","Terry_2","Haohmaru_1","Haohmaru_2","Igniz_1","Igniz_2","Orochi_1","Orochi_2","Rugal_1","Rugal_2","Athena_1","Ryo_1","Ryo_2","Zero_1","Nameless_1","Zero_2","Kim_1","Kim_2","Kusanagi_1","Krizalid_1","Krizalid_2","Goenitz_1","Oswald_1"];
var passChar = [];
var passIori3 = false;
var passOrochi = false;
var passIgniz = false;
var passRugal = false;
var first_attack = true;
var temp = false;
var hideHint = setting.data.hideHint;
if(hideHint == undefined || hideHint == null)
{
   hideHint = false;
}
var rankDisplayObj;
if(setting.data.rankDisplayObj == undefined)
{
   setting.data.rankDisplayObj = [{Name:"克里斯羊",_score:300000,_rr:"Orochi1"},{Name:"残殇",_score:240000,_rr:"random"},{Name:"栗子",_score:180000,_rr:"Goenitz1"},{Name:"信石夜",_score:150000,_rr:"Igniz2"},{Name:"串串香辣",_score:120000,_rr:"Krizalid1"},{Name:"屑云玩",_score:100000,_rr:"Haohmaru1"}];
   setting.flush();
}
rankDisplayObj = setting.data.rankDisplayObj;
var actionSet_status_P1 = "control";
var actionSet_status_P2 = "control";
var power_skillSuper = 60;
var power_skillBurst = 150;
var power_holdCounter = 30;
var power_holdRoll = 30;
var comboIndex;
var comboRecord_array = new Array();
var comboRecord_current;
var depth_select = 2;
var depth_stage = 3;
var depth_adShip = 4;
var depth_bgEff1 = 5;
var depth_fgEff = 26;
var depth_fgEff2 = 27;
var depth_char = 10;
var depth_stage0 = 11;
var depth_life = 20;
var depth_hitCounter = 30;
var depth_ko = 100;
var depth_trans = 200;
var depth_control = 300;
var depth_shake = 350;
var depth_menu = 400;
var depth_other = 150;
var depth_soundMC = 1050;
var depth_musicMC = 1060;
var depth_soundMCSYS = 1049;
var depth_slowSound = 1070;
var depth_pauseMC = 1080;
var depth_P1 = 20;
var depth_P2 = 10;
var depth_effect = 30;
var depth_effect_bg = 5;
var depth_effect_fg = 25;
var playerType1P;
var playerType2P;
var life_rate;
var time_roundStart;
var time_roundEnd;
var time_lifeBar;
var roundNum_played = 0;
var roundNum_win = 0;
var roundNum_played_currentBattle = 0;
var roundNum_win_currentBattle = 0;
var resetNum = 0;
var time_lifeBar_array = new Array();
var life_rate_array = new Array();
var hits_array = new Array();
var life_rate_array_battle = new Array();
var time_lifeBar_array_battle = new Array();
var perfect_currentBattle = new Array();
var scoreObj = new Object();
var score = 0;
var ran = Math.round(Math.random() * 3);
var serviceName;
var url_cheat = "http://kof.flashwing.net/cheat_kof1_5.htm";
var char_list = new Array("Kyo","KyoW","Ryu","Iori","Iori3","Terry","K","Kula","Moriya","Mai","Chunli","Haohmaru","Orochi","Mizuchi","Igniz","Rugal","Ash","Ash2","Ryo","Athena","Nameless","Zero","Zero2","Kim","Kusanagi","Andy","Goenitz","Krizalid","Oswald");
var arcade_Bosslist = new Array("Iori3","Orochi","Orochi2","Igniz","Igniz2","Rugal","Rugal2","Zero","Zero2","Goenitz","Krizalid","Krizalid2","Ash2");
var pvp_BossNamelist = new Array("Iori3","Orochi","Mizuchi","Igniz","Rugal","Zero","CZero","Goenitz","Krizalid","CKrizalid","Ash2","Goenitz");
var name_list = new Array("Kyo","KyoW","Ryu","Iori","Iori3","Terry","K","Kula","Moriya","Mai","Chunli","Haohmaru","Orochi","Mizuchi","Igniz","Rugal","Ash","Ryo","Athena","Nameless","Zero","Kim","Kusanagi","Andy","Goenitz","Krizalid","Oswald");
var name_list_cn = new Array("草薙京","草薙京","隆","八神庵","暴走八神庵","特瑞","K’","库拉","御名方守矢","不知火舞","春丽","霸王丸","大蛇","蛟","伊格尼斯","卢卡尔","阿修","坂崎良","雅典娜","无名","零","金家潘","草薙","安迪","高尼茨","古力查力度","奥斯瓦尔德");
var cpuNormal_list = new Array("Kyo","Terry","Chunli","Mai","Ryu","Iori","K","Kula","Moriya","Haohmaru","Ryo","Athena","Ash","Nameless","Kim","Andy","Oswald");
if(onLine)
{
   cpuNormal_list = new Array("Kyo","Terry","Mai","Iori","K","Kula","Ryo","Athena","Ash");
}
var cpuBoss_list = new Array();
var mc_list = {Kyo:"b",KyoW:"q",Iori:"k",Iori3:"p",K:"d",Kula:"f",Orochi:"n",Mai:"g",Terry:"e",Ryo:"a",Athena:"h",Ash:"a2",Ryu:"c",Haohmaru:"l",Chunli:"i",Moriya:"j",Nameless:"u",Rugal:"hi",Zero:"zero",Igniz:"o",Orochi:"n",Kusanagi:"r",Andy:"a1",Kim:"t",Goenitz:"s",Krizalid:"a3",Oswald:"Oswald"};
var startCalBoss = false;
var judgeCPUlist = false;
var cpu_list = new Array();
cpu_list = getCPUList();
var cpu_list2 = new Array();
cpu_list2 = getCPUList2();
var bgMapping = new Object();
var bgMappingDefault = new LoadVars();
bgMappingDefault.stageBG = "moonbridge,factory,gym,palace,earth";
bgMappingDefault.Kyo = "factory";
bgMappingDefault.Iori = "moonbridge";
bgMappingDefault.K = "palace";
bgMappingDefault.Kula = "palace";
bgMappingDefault.Orochi = "earth";
bgMappingDefault.Mai = "gym";
bgMappingDefault.Terry = "factory";
bgMappingDefault.Ryo = "gym";
bgMappingDefault.Athena = "palace";
bgMappingDefault.Ash = "factory";
var mustDefendSkill = new Object();
mustDefendSkill.Kyo = ["sk31","sk31_s"];
mustDefendSkill.Iori = ["sk_s_89b_s"];
mustDefendSkill.Kula = ["sk_s_xingchen","sk_s_jiejie"];
mustDefendSkill.Zero = ["dfdf_k"];
mustDefendSkill.CZero = ["dfdf_k"];
mustDefendSkill.Orochi = ["sk_s_yangguang"];
mustDefendSkill.Mizuchi = ["sk_s_zhuanpan2","sk_s_sanhua"];
mustDefendSkill.Ash = ["bf_C_2"];
var key_P1_proto = {u:87,d:83,b:65,f:68,p:74,k:75,p_l:85,k_l:73,s:79,s2:76,h:84,qq:80};
var key_P2_proto = {u:38,d:40,b:37,f:39,p:97,k:98,p_l:100,k_l:101,s:102,s2:99,h:96,qq:103};
var key_P1 = new Array(key_P1_proto);
var key_P2 = new Array(key_P2_proto);
var u;
var d;
var f;
var b;
var p;
var p_l;
var k_l;
var u2;
var d2;
var f2;
var b2;
var p2;
var p_l2;
var k_l2;
var key_sound = 113;
var key_fullScreen = 114;
var key_esc = 115;
var soundOn = true;
var musicOn = true;
var volume = setting.data.volume;
var sound_mc = _root.createEmptyMovieClip("sound_mc",depth_soundMC);
var sound_mcSys = _root.createEmptyMovieClip("sound_mcSys",depth_soundMCSYS);
var music_mc = _root.createEmptyMovieClip("music_mc",depth_musicMC);
var allSound_snd = new Sound(sound_mc);
allSound_snd.setVolume(volume);
var option_snd = new Sound(sound_mc);
option_snd.loadSound("sound/main.mp3");
var mainTitle_snd = new Sound(sound_mc);
mainTitle_snd.attachSound("title97");
var mainTitle02um_snd = new Sound(sound_mc);
mainTitle02um_snd.attachSound("title02um");
var round97_snd = new Sound(sound_mcSys);
round97_snd.attachSound("round97");
var round02um_snd = new Sound(sound_mcSys);
round02um_snd.attachSound("round02um");
var round97_1_snd = new Sound(sound_mcSys);
round97_1_snd.attachSound("round97_1");
var round02um_1_snd = new Sound(sound_mcSys);
round02um_1_snd.attachSound("round02um_1");
var round97_2_snd = new Sound(sound_mcSys);
round97_2_snd.attachSound("round97_2");
var round02um_2_snd = new Sound(sound_mcSys);
round02um_2_snd.attachSound("round02um_2");
var round97_3_snd = new Sound(sound_mcSys);
round97_3_snd.attachSound("round97_3");
var round02um_3_snd = new Sound(sound_mcSys);
round02um_3_snd.attachSound("round02um_3");
var round97_4_snd = new Sound(sound_mcSys);
round97_4_snd.attachSound("round97_4");
var round02um_4_snd = new Sound(sound_mcSys);
round02um_4_snd.attachSound("round02um_4");
var round97_5_snd = new Sound(sound_mcSys);
round97_5_snd.attachSound("round97_5");
var round02um_5_snd = new Sound(sound_mcSys);
round02um_5_snd.attachSound("round02um_5");
var fight97_snd = new Sound(sound_mcSys);
fight97_snd.attachSound("fight97");
var fight02um_snd = new Sound(sound_mcSys);
fight02um_snd.attachSound("fight02um");
var drawgame97_snd = new Sound(sound_mcSys);
drawgame97_snd.attachSound("drawgame97");
var drawgame02um_snd = new Sound(sound_mcSys);
drawgame02um_snd.attachSound("drawgame02um");
var ko97_snd = new Sound(sound_mcSys);
ko97_snd.attachSound("ko97");
var ko02um_snd = new Sound(sound_mcSys);
ko02um_snd.attachSound("ko02um");
var perfect97_snd = new Sound(sound_mcSys);
perfect97_snd.attachSound("perfect97");
var perfect02um_snd = new Sound(sound_mcSys);
perfect02um_snd.attachSound("perfect02um");
var timeover97_snd = new Sound(sound_mcSys);
timeover97_snd.attachSound("timeover97");
var timeover02um_snd = new Sound(sound_mcSys);
timeover02um_snd.attachSound("timeover02um");
var winnerVoice97_snd = new Sound(sound_mcSys);
winnerVoice97_snd.attachSound("winnerVoice97");
var winnerVoice02um_snd = new Sound(sound_mcSys);
winnerVoice02um_snd.attachSound("winnerVoice02um");
var winnerVoice02um2_snd = new Sound(sound_mcSys);
winnerVoice02um2_snd.attachSound("winnerVoice02um2");
var bossStage97Voice_snd = new Sound(sound_mcSys);
bossStage97Voice_snd.attachSound("bossStage97Voice");
var bossStage97_snd = new Sound(sound_mcSys);
bossStage97_snd.attachSound("bossStage97");
var bossStage02um_snd = new Sound(sound_mcSys);
bossStage02um_snd.attachSound("bossStage02um");
var bossStageFinal_snd = new Sound(sound_mcSys);
bossStageFinal_snd.attachSound("bossStageFinal");
var select_snd = new Sound(sound_mc);
select_snd.attachSound("select");
var select97_snd = new Sound(sound_mcSys);
select97_snd.attachSound("select97");
var select02um_snd = new Sound(sound_mcSys);
select02um_snd.attachSound("select02um");
var selectMenu_snd = new Sound(sound_mcSys);
selectMenu_snd.attachSound("selectMenu");
var selectMenu02um_snd = new Sound(sound_mcSys);
selectMenu02um_snd.attachSound("select02um");
var randomSelect_snd = new Sound(sound_mc);
randomSelect_snd.attachSound("randomSelect");
var ok_snd = new Sound(sound_mc);
ok_snd.attachSound("ok");
ok_snd.setVolume(volume * 2);
var ok97_snd = new Sound(sound_mcSys);
ok97_snd.attachSound("ok97");
ok97_snd.setVolume(volume * 2);
var ok02um_snd = new Sound(sound_mcSys);
ok02um_snd.attachSound("ok02um");
ok02um_snd.setVolume(volume * 2);
var insertCoin_snd = new Sound(sound_mcSys);
insertCoin_snd.attachSound("insertCoin");
insertCoin_snd.setVolume(volume * 2);
var timeOverNotice_snd = new Sound(sound_mcSys);
timeOverNotice_snd.attachSound("timeOverNotice");
timeOverNotice_snd.setVolume(100);
var p_snd = new Sound(sound_mc);
p_snd.attachSound("punch");
var pl_snd = new Sound(sound_mc);
pl_snd.attachSound("punch_l");
var kl_snd = new Sound(sound_mc);
pl_snd.attachSound("punch_l");
var k_snd = new Sound(sound_mc);
k_snd.attachSound("kick");
var run_snd = new Sound(sound_mc);
run_snd.attachSound("run_snd");
var dizzy = new Sound(sound_mc);
dizzy.attachSound("dizzy");
var jump_snd = new Sound(sound_mc);
jump_snd.attachSound("jump_snd");
var fire1_snd = new Sound(sound_mc);
fire1_snd.attachSound("fire1.wav");
var fire2_snd = new Sound(sound_mc);
fire2_snd.attachSound("fire2.wav");
var boom_snd = new Sound(sound_mc);
boom_snd.attachSound("boom.wav");
var soundControl = new Sound();
soundControl.setVolume(volume);
var game_quality;
var menu_quality;
var trans;
var pauseFrame_p1;
var pauseFrame_p2;
var rolePause_p1;
var rolePause_p2;
var status_p1;
var status_p2;
var pauseMC = createEmptyMovieClip("pauseMC",depth_pauseMC);
HitCheck;
HitCheck_obj;
role_corn.Role;
if(testVer)
{
   var code_mc = attachMovie("code_mc","code_mc",this.getNextHighestDepth());
   loadMovie("code.swf",code_mc);
}
