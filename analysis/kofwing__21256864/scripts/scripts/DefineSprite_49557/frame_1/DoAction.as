_visible = false;
onEnterFrame = function()
{
   if(_root.role_mc.opp.status_1 == "sk_97" || _root.role_mc.opp.status_1 == "sk_jiao")
   {
      return undefined;
   }
   if(_level0.inPause || _level0.inFreeze)
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
   if(_root.role_mc.dir == 1)
   {
      if(fw == "forward" && _loc3_._x >= _root.role_mc.opp._x || fw == "back" && _loc3_._x <= _root.role_mc.opp._x)
      {
         return undefined;
      }
   }
   else if(fw == "forward" && _loc3_._x <= _root.role_mc.opp._x || fw == "back" && _loc3_._x >= _root.role_mc.opp._x)
   {
      return undefined;
   }
   if(ax == true)
   {
      if(Math.abs(_loc3_.x - _root.role_mc.opp._x) <= fw2)
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
      if(_root.role_mc.opp._y == _loc3_.y)
      {
         return undefined;
      }
      if(_root.role_mc.opp._y > _loc3_.y)
      {
         _root.role_mc.opp._x += speed;
         spppd += add;
      }
      else
      {
         _root.role_mc.opp._y -= speed;
         spppd += add;
      }
   }
};
