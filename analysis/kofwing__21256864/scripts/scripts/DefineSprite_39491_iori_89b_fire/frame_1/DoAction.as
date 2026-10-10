stop();
dirs = this.dir;
if(_level0.glowMode)
{
   if(!_level0.XIIIeff)
   {
      var filter = new flash.filters.GlowFilter(16711935,1,10,10,0.75,3,false,false);
      var filterArray = new Array();
      filterArray.push(filter);
      mc.filters = filterArray;
   }
   if(_level0.glowType)
   {
      mc.blendMode = "hardlight";
   }
   else
   {
      mc.blendMode = "add";
   }
}
if(_root.role_mc.status_1 == "ready")
{
   gotoAndPlay(92);
}
