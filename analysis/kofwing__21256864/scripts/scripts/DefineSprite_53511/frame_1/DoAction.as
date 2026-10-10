if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16737792,1,15,15,1,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "screen";
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
