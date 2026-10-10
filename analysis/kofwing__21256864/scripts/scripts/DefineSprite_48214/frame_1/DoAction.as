this.onEnterFrame = function()
{
   var _loc3_;
   var _loc2_;
   if(_level0.glowMode)
   {
      _loc3_ = new flash.filters.GlowFilter(65535,1,10,10,0.75,3,false,false);
      _loc2_ = new Array();
      _loc2_.push(_loc3_);
      this.filters = _loc2_;
      if(_level0.glowMode)
      {
         this.blendMode = "add";
      }
   }
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
