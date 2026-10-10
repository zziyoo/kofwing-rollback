this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.player_type == "cpu")
   {
      _parent.hong_check();
   }
   var _loc4_ = _root.role_mc.opp.getObjs();
   var _loc5_ = 0;
   var _loc3_;
   while(_loc5_ < _loc4_.length)
   {
      if(s_mc.obj_level >= _loc4_[_loc5_].area.obj_level && _loc4_[_loc5_].area.people != true && _loc4_[_loc5_].area.isObj == true)
      {
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            if(s_mc.hitTest(_loc4_[_loc3_].area))
            {
               s_name = _loc4_[_loc3_].objName;
               s_x = _loc4_[_loc3_]._x;
               s_y = _loc4_[_loc3_]._y;
               isBlack = _loc4_[_loc3_].isBlack;
               isGrey = _loc4_[_loc3_].isGrey;
               _loc4_[_loc3_].removeMovieClip();
               mc._y = s_y - 180;
               mc.play();
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      _loc5_ = _loc5_ + 1;
   }
};
