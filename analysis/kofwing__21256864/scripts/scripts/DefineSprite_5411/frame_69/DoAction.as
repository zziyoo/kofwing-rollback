function checkRole()
{
   var _loc4_ = _root.role_mc.getObjs();
   var _loc5_ = {};
   var _loc14_ = _parent.dir;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      if(_loc4_[_loc3_].isRole = true)
      {
         _loc5_ = _loc4_[_loc3_];
         _loc5_._x += 8 * _loc14_;
         changeColor(_loc4_[_loc3_],{ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"120",aa:"55",ab:"0"});
      }
      _loc3_ = _loc3_ + 1;
   }
}
function checkOpp()
{
   var _loc4_ = _root.role_mc.opp.getObjs();
   var _loc5_ = {};
   var _loc14_ = _parent.dir;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      if(_loc4_[_loc3_].isRole = true)
      {
         _loc5_ = _loc4_[_loc3_];
         _loc5_._x += 8 * _loc14_;
         changeColor(_loc4_[_loc3_],{ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"120",aa:"55",ab:"0"});
      }
      _loc3_ = _loc3_ + 1;
   }
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   checkRole();
   checkOpp();
};
