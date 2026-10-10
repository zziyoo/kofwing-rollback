var flag = true;
this.onEnterFrame = function()
{
   if(_root.role_mc.opp.mc._currentframe <= 1 && _root.role_mc.opp.status_1 == "hurt4" && _root.role_mc.opp.status_7 == "tfnh" && s_mc.hitTest(_root.role_mc.opp.mc.body) == true)
   {
      flag = false;
   }
   if(_level0.inPause)
   {
      stop();
      return undefined;
   }
   if(_level0.inFreeze)
   {
      stop();
      return undefined;
   }
   if(_root.role_mc.opp.status_7 == "tfnh" && flag == false)
   {
      flag = true;
      gotoAndStop("end");
      play();
   }
   else
   {
      play();
   }
   var _loc5_ = this._currentframe + 1;
   var _loc4_ = _root.role_mc.opp.getObjs();
   var _loc6_ = 0;
   var _loc3_;
   while(_loc6_ < _loc4_.length)
   {
      if(s_mc.obj_level >= _loc4_[_loc6_].area.obj_level && _loc4_[_loc6_].area.people != true && _loc4_[_loc6_].area.isObj == true)
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
               _root.role_mc.addSkill(s_name,mc,Vx,Va,isBlack,isGrey,true);
               if(_loc5_ > 8)
               {
                  if(_loc5_ >= 17)
                  {
                     gotoAndPlay(_loc5_ - 8);
                  }
                  else
                  {
                     gotoAndPlay(_loc5_ - 8);
                     mca.gotoAndPlay("loop");
                  }
               }
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      _loc6_ = _loc6_ + 1;
   }
};
