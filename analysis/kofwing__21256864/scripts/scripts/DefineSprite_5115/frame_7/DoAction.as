this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   var _loc5_ = _root.role_mc.opp.getObjs();
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      if(s_mc.obj_level >= _loc5_[_loc4_].area.obj_level && _loc5_[_loc4_].area.people != true && _loc5_[_loc4_].area.isObj == true)
      {
         if(s_mc.hitTest(_loc5_[_loc4_].area))
         {
            s_name = _loc5_[_loc4_].objName;
            s_x = _loc5_[_loc4_]._x;
            s_y = _loc5_[_loc4_]._y;
            isBlack = _loc5_[_loc4_].isBlack;
            isGrey = _loc5_[_loc4_].isGrey;
            _loc5_[_loc4_].removeMovieClip();
            mc._y = s_y - 445;
            _root.role_mc.addSkill(s_name,mc,Vx,Va,isBlack,isGrey,true);
            delete this.onEnterFrame;
            mc.gotoAndPlay(29);
            gotoAndStop("att1");
            play();
         }
      }
      _loc4_ = _loc4_ + 1;
   }
   if(_parent.player_type == "cpu")
   {
      _parent.breakdefend_attack();
   }
};
