stop();
allowNum = 1;
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(13421772,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "hardlight";
}
