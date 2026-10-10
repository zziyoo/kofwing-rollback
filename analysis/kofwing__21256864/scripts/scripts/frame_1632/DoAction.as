function initSelectOrder(data)
{
   if(data.targetInit == "p1" || data.targetInit == "all")
   {
      _level0.selectOrderListP1 = new Array();
      _level0.selectOrderListP1.push({name:data.char_p1,type:data.mode_p1});
      _level0.selectOrderListP1.push({name:data.char_p12,type:data.mode_p12});
      _level0.selectOrderListP1.push({name:data.char_p13,type:data.mode_p13});
   }
   if(data.targetInit == "p2" || data.targetInit == "all")
   {
      _level0.selectOrderListP2 = new Array();
      _level0.selectOrderListP2.push({name:data.char_p2,type:data.mode_p2});
      _level0.selectOrderListP2.push({name:data.char_p22,type:data.mode_p22});
      _level0.selectOrderListP2.push({name:data.char_p23,type:data.mode_p23});
   }
   charSelect_mc.removeMovieClip();
}
function loadSelectOrder(player)
{
   if(player == "p1" || player == "all")
   {
      charSelect_P1 = _level0.selectOrderListP1[0].name;
      mode_role_P1 = _level0.selectOrderListP1[0].type;
      charSelect_P12 = _level0.selectOrderListP1[1].name;
      mode_role_P12 = _level0.selectOrderListP1[2].type;
      charSelect_P13 = _level0.selectOrderListP1[2].name;
      mode_role_P13 = _level0.selectOrderListP1[2].type;
   }
   if(player = "p2" || player == "all")
   {
      charSelect_P2 = _level0.selectOrderListP2[0].name;
      mode_role_P2 = _level0.selectOrderListP2[0].type;
      charSelect_P22 = _level0.selectOrderListP2[1].name;
      mode_role_P22 = _level0.selectOrderListP2[1].type;
      charSelect_P23 = _level0.selectOrderListP2[2].name;
      mode_role_P23 = _level0.selectOrderListP2[2].type;
   }
}
function selectOK(data)
{
   charSelect_P1 = "";
   mode_role_P1 = "";
   charSelect_P2 = "";
   mode_role_P2 = "";
   charSelect_P12 = "";
   mode_role_P12 = "";
   charSelect_P22 = "";
   mode_role_P22 = "";
   charSelect_P13 = "";
   mode_role_P13 = "";
   charSelect_P23 = "";
   mode_role_P23 = "";
   charSelect_P1 = data.char_p1;
   mode_role_P1 = data.mode_p1;
   mode_power_P1 = data.mode3_p1;
   charSelect_P2 = data.char_p2;
   mode_role_P2 = data.mode_p2;
   mode_power_P2 = data.mode3_p2;
   charSelect_P12 = data.char_p12;
   mode_role_P12 = data.mode_p12;
   charSelect_P22 = data.char_p22;
   mode_role_P22 = data.mode_p22;
   charSelect_P13 = data.char_p13;
   mode_role_P13 = data.mode_p13;
   charSelect_P23 = data.char_p23;
   mode_role_P23 = data.mode_p23;
   if(player_type == "1PVSCOM" && (stageID == 0 || serviceName == "reselect"))
   {
      charSelect_P1_origin = charSelect_P1;
      charSelect_P12_origin = charSelect_P12;
      charSelect_P13_origin = charSelect_P13;
      mode_role_P1_origin = mode_role_P1;
      mode_role_P12_origin = mode_role_P12;
      mode_role_P13_origin = mode_role_P13;
   }
   var _loc6_;
   var _loc3_;
   var _loc8_;
   var _loc4_;
   var _loc5_;
   var _loc11_;
   var _loc17_;
   var _loc14_;
   var _loc10_;
   var _loc12_;
   var _loc13_;
   var _loc15_;
   var _loc18_;
   var _loc9_;
   var _loc16_;
   var _loc7_;
   if(P2_type == "cpu" && player_type == "1PVSCOM")
   {
      if(cpu_list[stageID].indexOf("_") != -1)
      {
         _loc6_ = cpu_list[stageID].split("_");
         _loc11_ = _loc6_[0];
         _loc13_ = Number(_loc6_[1]);
         _loc8_ = cpu_list[stageID + 9].split("_");
         _loc14_ = _loc8_[0];
         _loc18_ = Number(_loc8_[1]);
         if(stageID == 0)
         {
            _loc3_ = cpu_list[0].split("_");
            _loc4_ = cpu_list[1].split("_");
            _loc5_ = cpu_list[2].split("_");
         }
         if(stageID == 1)
         {
            _loc3_ = cpu_list[3].split("_");
            _loc4_ = cpu_list[4].split("_");
            _loc5_ = cpu_list[5].split("_");
         }
         if(stageID == 2)
         {
            _loc3_ = cpu_list[6].split("_");
         }
         if(stageID == 3)
         {
            _loc3_ = cpu_list[9].split("_");
            _loc4_ = cpu_list[10].split("_");
            _loc5_ = cpu_list[11].split("_");
         }
         if(stageID == 4)
         {
            _loc3_ = cpu_list[12].split("_");
            _loc4_ = cpu_list[13].split("_");
            _loc5_ = cpu_list[14].split("_");
         }
         if(stageID == 5)
         {
            _loc3_ = cpu_list[7].split("_");
         }
         if(stageID == 6)
         {
            _loc3_ = cpu_list[8].split("_");
            _loc4_ = "";
            _loc5_ = "";
         }
         _loc17_ = _loc3_[0];
         _loc15_ = Number(_loc3_[1]);
         _loc10_ = _loc4_[0];
         _loc9_ = Number(_loc4_[1]);
         _loc12_ = _loc5_[0];
         _loc16_ = Number(_loc5_[1]);
         if(_level0.moreVs3V3 != true)
         {
            charSelect_P2 = _loc11_;
            mode_role_P2 = _loc13_;
            charSelect_P22 = _loc14_;
            mode_role_P22 = _loc18_;
         }
         else
         {
            charSelect_P2 = _loc17_;
            mode_role_P2 = _loc15_;
            charSelect_P22 = _loc10_;
            mode_role_P22 = _loc9_;
            charSelect_P23 = _loc12_;
            mode_role_P23 = _loc16_;
            if(_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6)
            {
               charSelect_P22 = "";
               mode_role_P22 = 1;
               charSelect_P23 = "";
               mode_role_P23 = 1;
            }
         }
      }
      else
      {
         charSelect_P2 = cpu_list[stageID];
         charSelect_P22 = cpu_list[stageID + 9];
         _loc7_ = Math.random();
         mode_role_P2 = _loc7_ >= 0.5 ? 2 : 1;
         mode_role_P22 = _loc7_ >= 0.5 ? 2 : 1;
      }
   }
   if(data.mode2_p1 != undefined)
   {
      mode_key_P1 = data.mode2_p1;
      _root.setting.data.mode_key_P1 = mode_key_P1;
   }
   if(data.mode2_p2 != undefined)
   {
      mode_key_P2 = data.mode2_p2;
      _root.setting.data.mode_key_P2 = mode_key_P2;
   }
   _root.setting.data.mode_power_P1 = mode_power_P1;
   _root.setting.data.mode_power_P2 = mode_power_P2;
   if(!mode_role_P1)
   {
      mode_role_P1 = 1;
   }
   if(!mode_role_P2)
   {
      mode_role_P2 = 1;
   }
   if(!isLoadRole)
   {
      if(roleImportAll)
      {
         gotoAndStop("vs");
         play();
      }
      else
      {
         gotoAndStop("roleImport");
         play();
      }
   }
   else
   {
      gotoAndStop("vs");
      play();
   }
}
function getCpuMode(charName)
{
   var _loc1_ = 1;
   if(_level0.player_type == "1PVSCOM")
   {
      if(charName == "Orochi")
      {
         if(_level0.stageID == _level0.cpu_list.length - 2)
         {
            _loc1_ = 1;
         }
         else if(_level0.stageID == _level0.cpu_list.length - 1)
         {
            _loc1_ = 2;
         }
      }
      else if(charName == "Kyo" || charName == "Iori" || charName == "K")
      {
         if(Math.random() < 0.5)
         {
            _loc1_ = 1;
         }
         else
         {
            _loc1_ = 2;
         }
      }
   }
   mode_role_P2 = _loc1_;
   mode_role_P22 = _loc1_;
   mode_role_P23 = _loc1_;
   return _loc1_;
}
stop();
_quality = quality1;
battleStarted = false;
attachMovie("char_select_mc","charSelect_mc",depth_select);
var roleLoaded = 0;
