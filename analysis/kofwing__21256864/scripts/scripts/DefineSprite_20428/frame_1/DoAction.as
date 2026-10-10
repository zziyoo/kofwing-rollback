stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var role = _root.role_mc;
var opp = role.opp;
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
      if(this.hitTest(_loc4_[_loc3_].area))
      {
         delete this.onEnterFrame;
         _loc4_[_loc3_].area.do_hitObj();
         role.gotoAndPlay("att");
      }
      _loc3_ = _loc3_ + 1;
   }
   if((this.hitTest(opp.mc.body) || this.hitTest(opp.mc.body2)) && !(opp.status_1 == "getup1" || opp.status_1 == "getup2"))
   {
      if(opp.status_3 == "hurt")
      {
         delete this.onEnterFrame;
         role.gotoAndPlay("att");
      }
   }
};
