var opp = _root.role_mc.opp;
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
      if(s_mc.hitTest(_loc4_[_loc3_].area))
      {
         delete this.onEnterFrame;
         _loc4_[_loc3_].area.do_hitObj();
         gotoAndStop("att");
         play();
      }
      _loc3_ = _loc3_ + 1;
   }
   if((s_mc.hitTest(opp.mc.body) || s_mc.hitTest(opp.mc.body2)) && !(opp.status_1 == "getup1" || opp.status_1 == "getup2"))
   {
      if(opp.status_3 == "hurt")
      {
         delete this.onEnterFrame;
         role.gotoAndPlay("att");
      }
   }
};
