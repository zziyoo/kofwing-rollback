stop();
allowNum = 1;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.opp.status_3 != "down")
   {
      delete this.onEnterFrame;
      gotoAndStop(1);
   }
};
if(_level0.glowMode)
{
   if(!_level0.XIIIeff)
   {
      var filter = new flash.filters.GlowFilter(16737792,1,10,10,0.75,3,false,false);
      var filterArray = new Array();
      filterArray.push(filter);
      this.filters = filterArray;
   }
   if(_level0.glowType)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
}
