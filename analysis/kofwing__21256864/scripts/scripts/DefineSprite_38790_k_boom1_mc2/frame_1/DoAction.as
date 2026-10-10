_X = _root.role_mc.opp._x;
_Y = _root.role_mc.opp._y - 170;
if(_level0.glowMode && !_level0.XIIIeff)
{
   var filter = new flash.filters.GlowFilter(16737792,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
else if(_level0.XIIIeff)
{
   this.blendMode = "screen";
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
   gotoAndStop("XIII");
   play();
}
