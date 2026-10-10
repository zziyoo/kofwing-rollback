_visible = false;
onEnterFrame = function()
{
   if(_root.role_mc.opp.status_6 == "nomove")
   {
      return undefined;
   }
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_root.role_mc.dir == 1)
   {
      if(fw == "forward" && _root.role_mc._x >= _root.role_mc.opp._x || fw == "back" && _root.role_mc._x <= _root.role_mc.opp._x)
      {
         return undefined;
      }
   }
   else if(fw == "forward" && _root.role_mc._x <= _root.role_mc.opp._x || fw == "back" && _root.role_mc._x >= _root.role_mc.opp._x)
   {
      return undefined;
   }
   if(_level0.inFreeze == true || _level0.P1_role.inFreeze == true || _level0.P2_role.inFreeze == true)
   {
      return undefined;
   }
   var _loc4_ = Func.lToG(this);
   var _loc6_ = _loc4_.x;
   var _loc5_ = _loc4_.y;
   var _loc3_ = new Object();
   _loc3_.x = _loc6_;
   _loc3_.y = _loc5_;
   _level0.char_mc.globalToLocal(_loc3_);
   if(ax == true)
   {
      if(_root.role_mc.opp._x == _loc3_.x)
      {
         return undefined;
      }
      if(_root.role_mc.opp._x > _loc3_.x)
      {
         _root.role_mc.opp._x -= speed;
         spppd += add;
      }
      else
      {
         _root.role_mc.opp._x += speed;
         spppd += add;
      }
   }
   if(ay == true)
   {
      if(_root.role_mc.opp.status_2 == "land" && _root.role_mc.opp.status_3 == "hurt")
      {
         _root.role_mc.opp._y -= speed;
         speed += add;
      }
   }
};
