if(_level0.glowMode)
{
   _parent.glowFromMc = true;
   var filter = new flash.filters.GlowFilter(16750950,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
