_level0.k_snd.start();
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   var _loc3_ = _root.role_mc.opp.getObjs();
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(s_mc.obj_level >= _loc3_[_loc2_].area.obj_level && _loc3_[_loc2_].area.people != true)
      {
         if(s_mc.hitTest(_loc3_[_loc2_].area))
         {
            _loc3_[_loc2_].area.do_hitObj();
            gotoAndStop("att");
            play();
         }
      }
      _loc2_ = _loc2_ + 1;
   }
};
