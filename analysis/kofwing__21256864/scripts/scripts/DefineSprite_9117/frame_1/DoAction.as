stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var n = checkTimes;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   var _loc4_;
   var _loc3_;
   if(n > 0)
   {
      _loc4_ = _root.role_mc.opp.getObjs();
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if((obj_level >= _loc4_[_loc3_].area.obj_level || force == true) && _loc4_[_loc3_].area.people != true)
         {
            if(this.hitTest(_loc4_[_loc3_].area))
            {
               _loc4_[_loc3_].area.do_hitObj();
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      n--;
   }
   else
   {
      delete this.onEnterFrame;
   }
};
