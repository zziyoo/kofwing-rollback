this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   var _loc4_ = _root.role_mc.opp.getObjs();
   var _loc3_ = 0;
   var _loc6_;
   var _loc5_;
   while(_loc3_ < _loc4_.length)
   {
      if(s_mc.obj_level >= _loc4_[_loc3_].area.obj_level && _loc4_[_loc3_].area.people != true && _loc4_[_loc3_].area.isObj == true)
      {
         if(s_mc.hitTest(_loc4_[_loc3_].area))
         {
            s_name = _loc4_[_loc3_].objName;
            s_f = _loc4_[_loc3_]._currentframe;
            s_x = _loc4_[_loc3_]._x;
            s_y = _loc4_[_loc3_]._y;
            isBlack = _loc4_[_loc3_].isBlack;
            isGrey = _loc4_[_loc3_].isGrey;
            _loc4_[_loc3_].removeMovieClip();
            mc._y = s_y - 440;
            _root.role_mc.addSkill(s_name,mc,Vx,Va,isBlack,isGrey,true);
            if(s_f > 1)
            {
               _loc6_ = _root.role_mc.getObjs();
               _loc5_ = 0;
               while(_loc5_ < _loc6_.length)
               {
                  if(_loc6_[_loc5_].objName == s_name)
                  {
                     _loc6_[_loc5_].gotoAndPlay(s_f);
                  }
                  _loc5_ = _loc5_ + 1;
               }
            }
            delete this.onEnterFrame;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
};
