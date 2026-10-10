if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16737792,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   mc.filters = filterArray;
   this.blendMode = "add";
}
