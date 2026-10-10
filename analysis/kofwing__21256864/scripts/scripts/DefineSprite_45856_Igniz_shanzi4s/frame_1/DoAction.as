if(_level0.glowMode && !_level0.XIIIeff)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
if(_level0.XIIIeff)
{
   this.blendMode = "screen";
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
   gotoAndStop("XIII");
   play();
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
