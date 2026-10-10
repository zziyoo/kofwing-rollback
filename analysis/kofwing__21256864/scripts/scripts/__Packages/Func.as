class Func
{
   function Func()
   {
   }
   static function lToG(mc)
   {
      var _loc1_ = new Object();
      _loc1_.x = mc._x;
      _loc1_.y = mc._y;
      mc._parent.localToGlobal(_loc1_);
      return _loc1_;
   }
   static function ltoL(mcFrom, mcTo)
   {
      var _loc1_ = new Object();
      _loc1_.x = mcFrom._x;
      _loc1_.y = mcFrom._y;
      mcFrom._parent.localToGlobal(_loc1_);
      mcTo.globalToLocal(_loc1_);
      return _loc1_;
   }
   static function zoomIn(loader, mc, rate)
   {
      var _loc2_ = Func.lToG(mc);
      loader._xscale = loader._yscale = rate * 100;
      var _loc1_ = Func.lToG(mc);
      var _loc5_ = _loc2_.x - _loc1_.x;
      var _loc4_ = _loc2_.y - _loc1_.y;
      loader._x += _loc5_;
      loader._y += _loc4_;
   }
   static function getMc(src)
   {
      var _loc1_;
      for(var _loc3_ in src)
      {
         _loc1_ = src[_loc3_];
         if(_loc1_ instanceof MovieClip)
         {
            return _loc1_;
         }
      }
   }
}
