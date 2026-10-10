var isMc = true;
var hitCount = 0;
var sf = function(r)
{
   var _loc3_ = hitCount + 1;
   var _loc1_ = r / (hitCount + 1);
   var _loc2_ = _loc1_ * 12;
   _loc2_ = Math.round(_loc2_);
   _loc1_ = _loc2_ / 10;
   return _loc1_;
};
