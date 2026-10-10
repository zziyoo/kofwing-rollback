onClipEvent(keyDown){
   if(_level0.moreVs == true && _level0.player_type != "COMVSCOM")
   {
      if(_level0.player_type == "1PVSCOM" && (_level0.moreVs3V3 == true && !(_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) || _level0.moreVs3V3 != true && !(_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8)) || _level0.player_type == "1PVS2P")
      {
         if(_level0.orderMax == _level0.orderNum_p1 + _level0.orderNum_p2)
         {
            _parent.gotoAndPlay("continue");
            delete this.onEnterFrame;
         }
      }
      else if(_level0.orderMax == _level0.orderNum_p1 * 2)
      {
         _parent.gotoAndPlay("continue");
         delete this.onEnterFrame;
      }
   }
   else
   {
      _parent.gotoAndPlay("continue");
   }
}
