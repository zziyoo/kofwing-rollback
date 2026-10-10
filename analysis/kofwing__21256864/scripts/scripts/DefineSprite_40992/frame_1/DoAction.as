this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
};
if(_level0.glowMode && !_level0.XIIIeff)
{
   var filter = new flash.filters.GlowFilter(16711935,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   if(_level0.glowType)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
}
if(_level0.XIIIeff)
{
   if(_level0.glowMode)
   {
      if(_level0.glowType)
      {
         this.blendMode = "hardlight";
      }
      else
      {
         this.blendMode = "add";
      }
   }
   gotoAndStop("XIII");
   play();
}
