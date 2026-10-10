function initFaceName()
{
   var _loc7_ = _root.charSelect_P1;
   if(_loc7_ == "Iori" && _root.mode_role_P1 == 3)
   {
      _loc7_ = "Iori3";
   }
   if(_loc7_ == "Zero" && _root.mode_role_P1 == 2)
   {
      _loc7_ = "Zero2";
   }
   if(_loc7_ == "Orochi" && _root.mode_role_P1 == 2)
   {
      _loc7_ = "Orochi2";
   }
   var _loc6_ = _root.charSelect_P2;
   if(_loc6_ == "Iori" && _root.mode_role_P2 == 3)
   {
      _loc6_ = "Iori3";
   }
   if(_loc6_ == "Zero" && _root.mode_role_P2 == 2)
   {
      _loc6_ = "Zero2";
   }
   if(_loc6_ == "Orochi" && _root.mode_role_P2 == 2)
   {
      _loc6_ = "Orochi2";
   }
   var _loc5_ = _root.charSelect_P12;
   if(_loc5_ == "Iori" && _root.mode_role_P12 == 3)
   {
      _loc5_ = "Iori3";
   }
   if(_loc5_ == "Zero" && _root.mode_role_P12 == 2)
   {
      _loc5_ = "Zero2";
   }
   if(_loc5_ == "Orochi" && _root.mode_role_P12 == 2)
   {
      _loc5_ = "Orochi2";
   }
   var _loc3_ = _root.charSelect_P22;
   if(_loc3_ == "Iori" && _root.mode_role_P22 == 3)
   {
      _loc3_ = "Iori3";
   }
   if(_loc3_ == "Zero" && _root.mode_role_P22 == 2)
   {
      _loc3_ = "Zero2";
   }
   if(_loc3_ == "Orochi" && _root.mode_role_P22 == 2)
   {
      _loc3_ = "Orochi2";
   }
   var _loc4_ = _root.charSelect_P13;
   if(_loc4_ == "Iori" && _root.mode_role_P13 == 3)
   {
      _loc4_ = "Iori3";
   }
   if(_loc4_ == "Zero" && _root.mode_role_P13 == 2)
   {
      _loc4_ = "Zero2";
   }
   if(_loc4_ == "Orochi" && _root.mode_role_P13 == 2)
   {
      _loc4_ = "Orochi2";
   }
   var _loc2_ = _root.charSelect_P23;
   if(_loc2_ == "Iori" && _root.mode_role_P23 == 3)
   {
      _loc2_ = "Iori3";
   }
   if(_loc2_ == "Zero" && _root.mode_role_P23 == 2)
   {
      _loc2_ = "Zero2";
   }
   if(_loc2_ == "Orochi" && _root.mode_role_P23 == 2)
   {
      _loc2_ = "Orochi2";
   }
   name_p1.gotoAndStop(_loc7_);
   name_p2.gotoAndStop(_loc6_);
   if(_level0.moreVs == true)
   {
      name_p12.gotoAndStop(_loc5_);
   }
   else
   {
      name_p12.gotoAndStop("none");
   }
   if(_level0.moreVs3V3 == true)
   {
      name_p13.gotoAndStop(_loc4_);
   }
   else
   {
      name_p13.gotoAndStop("none");
   }
   if(_level0.player_type == "1PVSCOM" && ((_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true || (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true) || _level0.moreVs != true)
   {
      name_p22.gotoAndStop("none");
   }
   else
   {
      name_p22.gotoAndStop(_loc3_);
   }
   if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true || _level0.moreVs3V3 != true)
   {
      name_p23.gotoAndStop("none");
   }
   else
   {
      name_p23.gotoAndStop(_loc2_);
   }
   if(_root.mode_role_P1 > 1)
   {
      _loc7_ = _root.charSelect_P1 + _root.mode_role_P1;
   }
   if(_root.mode_role_P2 > 1)
   {
      _loc6_ = _root.charSelect_P2 + _root.mode_role_P2;
   }
   if(_root.mode_role_P12 > 1)
   {
      _loc5_ = _root.charSelect_P12 + _root.mode_role_P12;
   }
   if(_root.mode_role_P22 > 1)
   {
      _loc3_ = _root.charSelect_P22 + _root.mode_role_P22;
   }
   if(_root.mode_role_P13 > 1)
   {
      _loc4_ = _root.charSelect_P13 + _root.mode_role_P13;
   }
   if(_root.mode_role_P23 > 1)
   {
      _loc2_ = _root.charSelect_P23 + _root.mode_role_P23;
   }
   face_p1.gotoAndStop(_loc7_);
   face_p2.gotoAndStop(_loc6_);
   face_p12.gotoAndStop(_loc5_);
   face_p22.gotoAndStop(_loc3_);
   face_p13.gotoAndStop(_loc4_);
   face_p23.gotoAndStop(_loc2_);
}
this._visible = true;
