_level0.stageControl_mc.stopControl();
continueHit = false;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   var _loc4_ = _root.role_mc.getObjs();
   var _loc13_ = {};
   var _loc14_ = _parent.dir;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      if(_loc4_[_loc3_].isRole = true)
      {
         _loc13_ = _loc4_[_loc3_];
         changeColor(_loc4_[_loc3_],{ra:"0",rb:"0",ga:"0",gb:"0",ba:"0",bb:"0",aa:"0",ab:"0"});
      }
      _loc3_ = _loc3_ + 1;
   }
};
