var _pause = false;
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16776960,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _root.role_mc.inFreeze || _root.role_mc._pause)
   {
      stop();
   }
   else
   {
      play();
   }
};
