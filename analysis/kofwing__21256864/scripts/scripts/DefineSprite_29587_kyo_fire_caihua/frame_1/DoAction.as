this._visible = false;
if(_level0.XIIIeff)
{
   this.blendMode = "screen";
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
   gotoAndStop("XIII");
   play();
   return undefined;
}
if(_level0.glowMode)
{
   if(_level0.glowType)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
   if(_level0.XIIIeff)
   {
      return undefined;
   }
   var filter = new flash.filters.GlowFilter(16711935,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
}
