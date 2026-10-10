_X = _root.role_mc.opp._x;
_Y = _root.role_mc.opp._y - 200;
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   if(_level0.glowMode)
   {
      this.blendMode = "add";
   }
}
