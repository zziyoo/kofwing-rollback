var mc_list = _level0.mc_list;
if(!_level0.ranCharSelect && !_level0.ranCharSelectN)
{
   setTimeout(function()
   {
      var _loc2_ = mc_list[_level0.charSelect_P1_origin];
      if(_level0.charSelect_P1_origin == "Iori" && _level0.mode_role_P1_origin == 3)
      {
         _loc2_ = mc_list[_level0.charSelect_P1_origin + _level0.mode_role_P1_origin];
      }
      else
      {
         _loc2_ = mc_list[_level0.charSelect_P1_origin];
      }
      _parent.select_mc.player.selectMode = _level0.mode_role_P1_origin;
      _parent.select_mc.player.selectNext(_loc2_,_level0.mode_role_P1_origin);
   }
   ,1000);
}
if(_level0.moreVs == true)
{
   if(!_level0.ranCharSelectNum2 && !_level0.ranCharSelectNNum2)
   {
      setTimeout(function()
      {
         var _loc2_;
         if(_level0.charSelect_P12_origin == "Iori" && _level0.mode_role_P12_origin == 3)
         {
            _loc2_ = mc_list[_level0.charSelect_P12_origin + _level0.mode_role_P12_origin];
         }
         else
         {
            _loc2_ = mc_list[_level0.charSelect_P12_origin];
         }
         _parent.select_mc.player.selectMode = _level0.mode_role_P12_origin;
         _parent.select_mc.player.selectNext(_loc2_,_level0.mode_role_P12_origin);
      }
      ,1500);
   }
   if(_level0.moreVs3V3 == true && !_level0.ranCharSelectNum3 && !_level0.ranCharSelectNNum3)
   {
      setTimeout(function()
      {
         var _loc2_;
         if(_level0.charSelect_P13_origin == "Iori" && _level0.mode_role_P13_origin == 3)
         {
            _loc2_ = mc_list[_level0.charSelect_P13_origin + _level0.mode_role_P13_origin];
         }
         else
         {
            _loc2_ = mc_list[_level0.charSelect_P13_origin];
         }
         _parent.select_mc.player.selectMode = _level0.mode_role_P13_origin;
         _parent.select_mc.player.selectNext(_loc2_,_level0.mode_role_P13_origin);
      }
      ,2000);
   }
}
