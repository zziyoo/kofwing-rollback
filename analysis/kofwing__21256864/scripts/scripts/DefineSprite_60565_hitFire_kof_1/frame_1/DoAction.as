_rotation = int(Math.random() * 360);
blendMode = "screen";
if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
if(_level0.glowMode)
{
   if(_level0.XIIIeff)
   {
      return undefined;
   }
   var filter = new flash.filters.GlowFilter(11935527,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
