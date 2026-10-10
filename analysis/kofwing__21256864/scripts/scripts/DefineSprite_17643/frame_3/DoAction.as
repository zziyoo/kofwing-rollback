this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   t++;
   if(t > 300)
   {
      delete this.onEnterFrame;
      _parent.status_6 = "normal";
      gotoAndStop("att");
      play();
   }
   var _loc5_ = _root.role_mc.opp.getObjs();
   var _loc6_ = 0;
   var _loc4_;
   while(_loc6_ < _loc5_.length)
   {
      if(s_mc.obj_level >= _loc5_[_loc6_].area.obj_level && _loc5_[_loc6_].area.people != true && _loc5_[_loc6_].area.isObj == true)
      {
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(s_mc.hitTest(_loc5_[_loc4_].area))
            {
               s_name = _loc5_[_loc4_].objName;
               s_x = _loc5_[_loc4_]._x;
               s_y = _loc5_[_loc4_]._y;
               isBlack = _loc5_[_loc4_].isBlack;
               isGrey = _loc5_[_loc4_].isGrey;
               _loc5_[_loc4_].removeMovieClip();
               mc._y = s_y - 180;
               mc.play();
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      _loc6_ = _loc6_ + 1;
   }
};
var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   _parent.status_6 = "normal";
   owner.gotoAndPlay("att");
};
hold_mc.endFunc = function()
{
   _parent.status_6 = "normal";
   owner.gotoAndPlay("att");
};
