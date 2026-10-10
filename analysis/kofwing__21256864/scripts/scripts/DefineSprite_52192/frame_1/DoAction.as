if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(255,1,15,15,1,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
