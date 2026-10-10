class ExtMath extends Math
{
   static var __proto__ = Math;
   function ExtMath()
   {
      super();
   }
   static function distance(x1, y1, x2, y2)
   {
      var _loc1_ = x2 - x1;
      var _loc2_ = y2 - y1;
      return Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_);
   }
   static function distance2(x1, y1, x2, y2)
   {
      var _loc1_ = x2 - x1;
      var _loc2_ = y2 - y1;
      return _loc1_ * _loc1_ + _loc2_ * _loc2_;
   }
   static function degreesToRadians(angle)
   {
      return angle * 0.01745329;
   }
   static function radiansToDegrees(angle)
   {
      return angle * 57.29578;
   }
   static function sinD(angle)
   {
      return Math.sin(angle * 3.141593 / 180);
   }
   static function asinD(ratio)
   {
      return Math.asin(ratio) * 57.29578;
   }
   static function cosD(angle)
   {
      return Math.cos(angle * 3.141593 / 180);
   }
   static function acosD(ratio)
   {
      return Math.acos(ratio) * 57.29578;
   }
   static function tanD(angle)
   {
      return Math.tan(angle * 3.141593 / 180);
   }
   static function atan2D(y, x)
   {
      return Math.atan2(y,x) * 57.29578;
   }
   static function angleOfLine(x1, y1, x2, y2)
   {
      return ExtMath.atan2D(y2 - y1,x2 - x1);
   }
   static function fixAngle(angle)
   {
      angle %= 360;
      return angle % 360 >= 0 ? angle : angle + 360;
   }
   static function cartesianToFlash(o)
   {
      o._y *= -1;
      o._rotation *= -1;
   }
   static function flashToCartesian(o)
   {
      return ExtMath.cartesianToFlash(o);
   }
   static function cartesianToPolar(p)
   {
      var _loc2_ = Math.sqrt(p.x * p.x + p.y * p.y);
      var _loc3_ = ExtMath.atan2D(p.y,p.x);
      return {r:_loc2_,t:_loc3_};
   }
   static function polarToCartesian(p)
   {
      var _loc2_ = p.r * ExtMath.cosD(p.t);
      var _loc3_ = p.r * ExtMath.sinD(p.t);
      return {x:_loc2_,y:_loc3_};
   }
}
