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
   if(!_root.role_mc.opp.mc.body)
   {
      return undefined;
   }
   if(ishurt == true && _root.role_mc.opp.status_3 != "hurt")
   {
      return undefined;
   }
   var _loc3_;
   if(nohit_status.length > 0)
   {
      for(var _loc5_ in nohit_status)
      {
         _loc3_ = nohit_status[_loc5_];
         if(_root.role_mc.opp.status_1 == _loc3_)
         {
            return undefined;
         }
         if(_root.role_mc.opp.status_2 == _loc3_)
         {
            return undefined;
         }
      }
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
   var _loc6_ = Func.lToG(this);
   var _loc8_ = _loc6_.x;
   var _loc7_ = _loc6_.y;
   var _loc4_ = new Object();
   _loc4_.x = _loc8_;
   _loc4_.y = _loc7_;
   _level0.char_mc.globalToLocal(_loc4_);
   if(ax == true)
   {
      if(_root.role_mc.opp._x == _loc4_.x)
      {
         return undefined;
      }
      if(_root.role_mc.opp._x > _loc4_.x)
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
   if(ay == true && _root.role_mc.opp.status_3 == "hurt" && _root.role_mc.opp.status_2 == "air")
   {
      if(_root.role_mc.opp._y == _loc4_.y)
      {
         return undefined;
      }
      if(_root.role_mc.opp._y > _loc4_.y)
      {
         _root.role_mc.opp._y -= speed;
         spppd += add;
      }
      else
      {
         _root.role_mc.opp._y += speed;
         spppd += add;
      }
   }
};
