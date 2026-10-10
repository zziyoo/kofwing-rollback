this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   var _loc4_ = _root.role_mc.opp.getObjs();
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      if(s_mc.obj_level >= _loc4_[_loc3_].area.obj_level && _loc4_[_loc3_].area.people != true && _loc4_[_loc3_].area.isObj == true)
      {
         if(s_mc.hitTest(_loc4_[_loc3_].area))
         {
            s_name = _loc4_[_loc3_].objName;
            s_x = _loc4_[_loc3_]._x;
            s_y = _loc4_[_loc3_]._y;
            isBlack = _loc4_[_loc3_].isBlack;
            isGrey = _loc4_[_loc3_].isGrey;
            _loc4_[_loc3_].removeMovieClip();
            delete this.onEnterFrame;
            mc.gotoAndPlay(12);
            gotoAndStop("att");
            play();
         }
      }
      _loc3_ = _loc3_ + 1;
   }
};
