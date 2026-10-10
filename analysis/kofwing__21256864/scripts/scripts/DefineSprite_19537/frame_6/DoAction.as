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
      if(s_mc.obj_level >= _loc4_[_loc3_].area.obj_level && _loc4_[_loc3_].area.people != true)
      {
         if(s_mc.hitTest(_loc4_[_loc3_].area))
         {
            _loc4_[_loc3_].area.do_hitObj();
            delete this.onEnterFrame;
            gotoAndStop("att2");
            play();
         }
      }
      _loc3_ = _loc3_ + 1;
   }
};
