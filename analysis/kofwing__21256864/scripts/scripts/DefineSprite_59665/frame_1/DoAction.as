if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16711935,1,20,20,0.75,2,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
}
