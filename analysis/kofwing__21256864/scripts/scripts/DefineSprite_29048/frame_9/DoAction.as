continueHit = true;
if(_level0.glowMode)
{
   _parent.glowFromMc = true;
   var filter = new flash.filters.GlowFilter(16737792,1,10,10,1.5,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
}
