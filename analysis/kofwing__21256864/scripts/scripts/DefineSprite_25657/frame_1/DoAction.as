if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16750848,1,10,10,1.5,3,false,false);
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
