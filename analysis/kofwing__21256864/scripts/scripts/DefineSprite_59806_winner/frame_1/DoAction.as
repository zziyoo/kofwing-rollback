if(_level0.moreVs == true)
{
   this.onEnterFrame = function()
   {
      var _loc1_ = -0.1;
      if(_level0.P1_role.isKO)
      {
         if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true)
         {
            _loc1_ *= 1.15;
         }
         if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true)
         {
            _loc1_ /= 3;
         }
         _level0.P2_role.lifeObj.d_rate = _loc1_;
         _level0.lifeControl(_level0.P2_role.lifeObj,true);
      }
      if(_level0.P2_role.isKO)
      {
         _level0.P1_role.lifeObj.d_rate = _loc1_;
         _level0.lifeControl(_level0.P1_role.lifeObj,true);
      }
   };
}
